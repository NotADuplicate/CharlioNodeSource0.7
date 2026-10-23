// Run with: node tests/ball_ai.test.cjs
// These helpers use the JS-compatible subset of GML. Execute the actual source
// with engine mocks to check geometry/decisions; this is not a GameMaker playtest.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = ['scr_ball_approach', 'scr_pushBallPath', 'scr_pathfind'].map(name =>
  fs.readFileSync(path.join(__dirname, '..', 'scripts', name, name + '.gml'), 'utf8')).join('\n');

function world() {
  const paths = new Map(), grid = new Set(), towers = [], bots = [];
  let nextPath = 0, shots = 0;
  const ball = {x: 512, y: 512, radius: 32, xspd: 0, yspd: 0, oil: 0, fric: 0.4};
  const key = (x, y) => x + ',' + y;
  const c = {
    x: 400, y: 512, num: 1, team: 2, state: 'Push', escapeTower: null, towerBallRange: [],
    ballApproachPath: -1, navigationPath: -1, path_index: -1, path_position: 0,
    walkingAround: false, pushPos: {x: 492, y: 512},
    targetX: 0, targetY: 0, gunDir: 0, reload: 0, ammo: 10,
    speed: 0, bleed: 0, frost: 0, enraged: false, pushingBall: 0,
    ballBodyContact: false, ballBodyPushTime: 0, ballPushStallTime: 0,
    ballProgressX: 512, ballProgressY: 512, ballStageGoal: null, ballRecoveryGoal: null,
    ballDislodgeTime: 0, ballDislodgeX: 512, ballDislodgeY: 512,
    delta_time: 1000000 / 30,
    ballApproachProgressX: 400, ballApproachProgressY: 512, ballApproachNoProgressTime: 0,
    skirmishTowerWaitTime: 0, skirmishTowerEnemy: null, enemy: null,
    fightingDist: 120, recentlySwithced: 0, hp: 250, knownLocation: 0,
    enemyDistances: Array(7).fill(1000), levels: 3, pointDir: 0,
    link: {dashing: 0}, alarm: [], room_width: 1024, room_height: 1024,
    obj_bigBall: 'ball', obj_turret: 'tower', obj_AI: 'ai', ball_wall: 'wall', noone: null,
    path_action_stop: 0, global: {bb: grid, AiPathGrid: grid, teamNum: {1: 0, 2: 1}, aiPushing: []},
    min: Math.min, max: Math.max, floor: Math.floor, ceil: Math.ceil, abs: Math.abs,
    clamp: (n, a, b) => Math.max(a, Math.min(b, n)),
    point_distance: (ax, ay, bx, by) => Math.hypot(bx - ax, by - ay),
    point_direction: (ax, ay, bx, by) => Math.atan2(ay - by, bx - ax) * 180 / Math.PI,
    lengthdir_x: (n, d) => n * Math.cos(d * Math.PI / 180),
    lengthdir_y: (n, d) => -n * Math.sin(d * Math.PI / 180),
    array_length: a => a.length, array_push: (a, v) => a.push(v),
    instance_find: (o, i) => o === 'ball' ? ball : o === 'ai' ? bots[i] : towers[i],
    instance_number: o => o === 'tower' ? towers.length : o === 'ai' ? bots.length : 1,
    instance_exists: o => o != null && (o === ball || o === c.enemy || bots.includes(o) || towers.includes(o)),
    collision_line: () => null, place_meeting: () => false,
    collision_circle: () => null,
    is_struct: value => typeof value === 'object' && value !== null,
    path_add: () => {const id = nextPath++; paths.set(id, []); return id;},
    path_delete: id => paths.delete(id), path_exists: id => paths.has(id),
    path_get_number: id => paths.get(id).length,
    path_get_point_x: (id, i) => paths.get(id)[i][0],
    path_get_point_y: (id, i) => paths.get(id)[i][1],
    path_get_length: id => paths.get(id).reduce((length, point, i, points) =>
      i ? length + Math.hypot(point[0] - points[i - 1][0], point[1] - points[i - 1][1]) : 0, 0),
    path_clear_points: id => paths.set(id, []),
    path_add_point: (id, x, y) => paths.get(id).push([x, y]),
    path_end: () => {c.active = null; c.path_index = -1;},
    path_start: (id, speed) => {c.active = id; c.path_index = id; c.path_position = 0; c.moveSpeed = speed; c.path_speed = speed;},
    mp_grid_get_cell: (g, x, y) => x < 0 || y < 0 || x >= 32 || y >= 32 || g.has(key(x, y)) ? -1 : 0,
    mp_grid_add_cell: (g, x, y) => g.add(key(x, y)),
    mp_grid_clear_cell: (g, x, y) => g.delete(key(x, y)),
    random: () => 0, random_range: (low, high) => (low + high) / 2,
  };
  c.self = c;
  bots.push(c);
  c.id = c;
  c.variable_instance_exists = (instance, name) => name in instance;
  for (const [name, axis, offset] of [
    ['bbox_left', 'x', -12], ['bbox_right', 'x', 8],
    ['bbox_top', 'y', -12], ['bbox_bottom', 'y', 21]
  ]) Object.defineProperty(c, name, {configurable: true, get: () => c[axis] + offset});
  c.gunObj = {name: 'Shotgun', maxRange: 220, aiUse: () => {shots++; c.reload = 40;}, skirmishAction: () => {}};
  // Eight-neighbour grid routing, with exact start/end points like the engine.
  c.mp_grid_path = (g, id, sx, sy, tx, ty) => {
    const start = [Math.floor(sx / 32), Math.floor(sy / 32)];
    const end = [Math.floor(tx / 32), Math.floor(ty / 32)];
    if (c.mp_grid_get_cell(g, ...end)) return false;
    const queue = [start], previous = new Map([[key(...start), null]]);
    for (let index = 0; index < queue.length; index++) {
      const cell = queue[index];
      if (key(...cell) === key(...end)) {
        const cells = [];
        for (let at = cell; at; at = previous.get(key(...at))) cells.push(at);
        paths.set(id, [[sx, sy], ...cells.reverse().slice(1).map(([x, y]) => [x * 32 + 16, y * 32 + 16]), [tx, ty]]);
        return true;
      }
      for (let dx = -1; dx <= 1; dx++) for (let dy = -1; dy <= 1; dy++) {
        if (!dx && !dy) continue;
        const next = [cell[0] + dx, cell[1] + dy], k = key(...next);
        if (!previous.has(k) && !c.mp_grid_get_cell(g, ...next)) {
          previous.set(k, cell); queue.push(next);
        }
      }
    }
    return false;
  };
  vm.createContext(c);
  vm.runInContext(source, c);
  return {c, ball, paths, grid, towers, bots, shots: () => shots};
}

let count = 0;
function test(name, run) {
  run(); count++; console.log('PASS ' + name);
}
test('aligned bot walks into the ball and shoots', () => {
  const {c, ball, shots} = world();
  c.scr_ball_approach();
  assert.equal(c.walkingAround, false);
  assert.ok(c.targetX > c.x && c.targetX < ball.x);
  assert.ok(Math.abs(c.targetX - ball.x) < ball.radius);
  assert.equal(shots(), 1);
});
test('grenade launcher pushes with its body without shooting', () => {
  const {c, shots} = world();
  c.gunObj.name = 'Grenade Launcher'; c.scr_ball_approach();
  assert.ok(c.active != null); assert.equal(shots(), 0);
});
test('reload and ammo prevent invalid shots', () => {
  const {c, shots} = world();
  c.ammo = 1; c.scr_ball_approach(); assert.equal(shots(), 0);
  c.ammo = 10; c.reload = 1; c.scr_ball_approach(); assert.equal(shots(), 0);
});
test('wrong-side route goes around the ball and preserves grid walls', () => {
  const {c, paths, grid, shots} = world();
  c.x = 650; grid.add('16,14');
  const before = [...grid];
  c.scr_ball_approach();
  assert.equal(c.walkingAround, true); assert.equal(shots(), 0);
  assert.ok(c.active != null); assert.ok(c.targetX < 512);
  const points = paths.get(c.active);
  for (let i = 1; i < points.length; i++)
    assert.ok(c.scr_ball_approach_segment(...points[i - 1], ...points[i], 56));
  assert.deepEqual([...grid], before);
});
test('bot already touching the wrong side can step away', () => {
  const {c, ball, paths} = world();
  c.x = ball.x + 35; c.scr_ball_approach();
  assert.ok(c.active != null); assert.equal(c.walkingAround, true);
  const points = paths.get(c.active);
  for (let i = 1; i < points.length; i++)
    assert.ok(c.scr_ball_approach_segment(...points[i - 1], ...points[i], 56));
});
test('wrong-side bot completes its detour and starts pushing', () => {
  const {c, paths} = world();
  c.x = 650;
  let pushing = false;
  for (let update = 0; update < 100; update++) {
    c.scr_ball_approach();
    if (!c.walkingAround) {pushing = true; break;}
    const points = paths.get(c.active);
    let budget = c.moveSpeed * 3;
    for (let i = 1; points && i < points.length && budget > 0; i++) {
      const dx = points[i][0] - c.x, dy = points[i][1] - c.y;
      const distance = Math.hypot(dx, dy);
      if (distance === 0) continue;
      const amount = Math.min(distance, budget);
      c.x += dx / distance * amount; c.y += dy / distance * amount;
      budget -= amount;
    }
  }
  assert.ok(pushing, 'detour must finish without an external shove');
});
test('angled staging beside a wall transitions into pushing instead of idling', () => {
  const {c, ball, shots} = world();
  // The preferred rear waypoint is blocked, so the old planner repeatedly
  // selected this reachable 30-degree staging point as its current position.
  c.x = ball.x + c.lengthdir_x(104, 210);
  c.y = ball.y + c.lengthdir_y(104, 210);
  c.place_meeting = (x, y) => x < 415;
  c.scr_ball_approach();
  assert.equal(c.walkingAround, false);
  assert.ok(Math.hypot(c.targetX - c.x, c.targetY - c.y) > 20);
  assert.equal(shots(), 0, 'an angled body push is not permission for a sideways shot');
});
test('replanning follows a moved ball without accumulating paths', () => {
  const {c, ball, paths} = world();
  for (let i = 0; i < 100; i++) {
    ball.x += 0.1; c.pushPos.x = ball.x - 20; c.scr_ball_approach();
    assert.equal(paths.size, 1);
  }
  assert.ok(Math.abs(ball.x - c.targetX - ball.radius * 0.5) < 0.001);
});
test('failed routes restore grid and do not start an empty path', () => {
  const {c, grid, paths} = world();
  grid.add('16,16'); const before = [...grid];
  c.place_meeting = () => true; c.scr_ball_approach();
  assert.equal(c.active, null); assert.equal(paths.size, 0);
  assert.deepEqual([...grid], before);
});
test('two-point ball route gives the correct push direction', () => {
  const {c, ball, paths} = world();
  c.mp_grid_path = (g, id) => {paths.set(id, [[ball.x, ball.y], [700, ball.y]]); return true;};
  const pos = c.scr_pushBallPath(700, 512, 20);
  assert.equal(pos.x, 492); assert.equal(pos.y, 512); assert.equal(paths.size, 0);
});
test('blocked ball route holds rather than using player coordinates', () => {
  const {c, ball} = world();
  c.mp_grid_path = () => false; c.collision_line = () => 'wall';
  const pos = c.scr_pushBallPath(700, 512, 20);
  assert.equal(pos.x, ball.x); assert.equal(pos.y, ball.y);
});
function towerWorld() {
  const w = world();
  w.c.x = 600;
  w.ball.x = 700;
  w.towers.push({x: 512, y: 512, hp: 100, num: 2, bigRange: 260, target: 'ball'});
  return w;
}
test('outgoing ball triggers retreat before it leaves tower range', () => {
  const {c, ball, towers} = towerWorld();
  ball.xspd = 15;
  assert.equal(c.scr_ball_tower_escape(), true);
  assert.equal(c.state, 'Escape Tower'); assert.equal(c.escapeTower, towers[0]);
  c.scr_ball_tower_escape_path();
  assert.ok(Math.hypot(c.targetX - 512, c.targetY - 512) > 308);
});
test('retreat remains latched until outside the safety margin', () => {
  const {c, ball} = towerWorld();
  ball.xspd = 15; c.scr_ball_tower_escape(); ball.xspd = 0;
  assert.equal(c.scr_ball_tower_escape(), true);
  c.x = 850;
  assert.equal(c.scr_ball_tower_escape(), false);
  assert.equal(c.state, 'Travel Ball');
});
test('stationary, incoming or friction-stopped ball does not cause retreat', () => {
  for (const velocity of [0, -15, 2]) {
    const {c, ball} = towerWorld(); ball.xspd = velocity;
    assert.equal(c.scr_ball_tower_escape(), false);
  }
});
test('friendly towers and towers tanked by another player are ignored', () => {
  const {c, ball, towers} = towerWorld(); ball.xspd = 15;
  towers[0].num = 1; assert.equal(c.scr_ball_tower_escape(), false);
  towers[0].num = 2; towers[0].target = {};
  assert.equal(c.scr_ball_tower_escape(), false);
});
test('targeting the bot does not interrupt an incoming push', () => {
  const {c, ball, towers} = towerWorld(); towers[0].target = c.link;
  ball.xspd = -15;
  assert.equal(c.scr_ball_tower_escape(), false);
  assert.equal(c.state, 'Push');
});
test('ball crossing out triggers escape and destroyed towers release it', () => {
  const {c, ball, towers} = towerWorld(); towers[0].target = c.link;
  assert.equal(c.scr_ball_tower_escape(), false);
  ball.x = 800;
  assert.equal(c.scr_ball_tower_escape(), true);
  towers[0].hp = 0; assert.equal(c.scr_ball_tower_escape(), false);
});
test('approaching the tower boundary never triggers retreat', () => {
  const {c, ball, towers} = towerWorld();
  // Follow the ball from outside to inside, including the old +24 trigger band.
  for (const ballDistance of [320, 285, 265, 261, 260, 250, 210, 150]) {
    ball.x = towers[0].x + ballDistance;
    ball.xspd = -3;
    c.x = ball.x + 40;
    assert.equal(c.scr_ball_tower_escape(), false);
    assert.equal(c.state, 'Push');
  }
});
test('outgoing ball does not make a bot outside the tower radius retreat', () => {
  const {c, ball, towers} = towerWorld();
  c.x = towers[0].x + towers[0].bigRange + 5;
  ball.xspd = 15;
  assert.equal(c.scr_ball_tower_escape(), false);
  ball.x = 800;
  assert.equal(c.scr_ball_tower_escape(), false);
});
test('body contact never pushes backwards while repositioning or escaping', () => {
  const {c, ball} = world();
  let pushes = 0;
  Object.assign(c, {
    other: ball, pushing: 0.5, path_speed: 5,
    power: Math.pow, sqrt: Math.sqrt, scr_ball_move: () => {pushes++;}
  });
  const collision = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI',
    'Collision_obj_bigBall.gml'), 'utf8').replace(/\bexit;/g, 'return;');
  c.is_struct = value => typeof value === 'object' && value !== null;
  vm.runInContext('function contact() {' + collision + '}', c);
  c.contact(); assert.equal(pushes, 1);
  c.x = ball.x + 10; c.contact(); assert.equal(pushes, 1);
  c.x = 400; c.walkingAround = true; c.contact(); assert.equal(pushes, 1);
  c.state = 'Escape Tower'; c.walkingAround = false; c.contact(); assert.equal(pushes, 1);
});
test('tower shots require half a second of actual point-blank body pushing', () => {
  const {c, ball, towers, shots} = world();
  c.x = ball.x - 44;
  towers.push({x: ball.x + 120, y: ball.y, hp: 100, num: 2, bigRange: 260, target: 'ball'});
  for (let i = 0; i < 20; i++) c.scr_ball_approach();
  assert.equal(shots(), 0, 'navigation calls must not advance the contact timer');
  for (let frame = 0; frame < 14; frame++) {
    c.ballBodyContact = true; c.scr_ball_push_tick();
  }
  c.scr_ball_approach(); assert.equal(shots(), 0);
  c.ballBodyContact = true; c.scr_ball_push_tick();
  c.scr_ball_approach(); assert.equal(shots(), 1);
  assert.equal(c.ballBodyPushTime, 0, 'a new shot requires another contact interval');
});
test('tower shots reject perpendicular angles, range and interrupted contact', () => {
  const {c, ball, towers, shots} = world();
  towers.push({x: ball.x + 150, y: ball.y, hp: 100, num: 2, bigRange: 260, target: 'ball'});
  c.x = ball.x; c.y = ball.y + 44; c.ballBodyPushTime = 1;
  assert.equal(c.scr_ball_push_shoot(1, 0), false);
  c.x = ball.x - 100; c.y = ball.y;
  assert.equal(c.scr_ball_push_shoot(1, 0), false, 'long-range shots are not point blank');
  c.x = ball.x - 44; c.scr_ball_push_tick();
  assert.equal(c.ballBodyPushTime, 0);
  assert.equal(c.scr_ball_push_shoot(1, 0), false);
  assert.equal(shots(), 0);
});
test('corner staging rejects a contact point that is blocked by a wall', () => {
  const {c, ball} = world();
  c.x = ball.x + 140;
  // A narrow obstruction at the straight rear contact point. The old code
  // repeatedly staged on the straight line, tried contact, then backed away.
  c.place_meeting = (x, y) => Math.abs(x - (ball.x - 16)) < 3 && Math.abs(y - ball.y) < 3;
  c.scr_ball_approach();
  assert.ok(c.ballStageGoal);
  assert.ok(Math.abs(c.ballStageGoal.dy) > 0.01, 'choose an angled reachable contact');
  const first = {x: c.targetX, y: c.targetY};
  c.x -= 10;
  c.scr_ball_approach();
  assert.equal(c.targetX, first.x); assert.equal(c.targetY, first.y);
});
test('ball-width wall clearance chooses and commits to a recovery direction', () => {
  const {c, ball} = world();
  c.x = ball.x + 140;
  c.collision_circle = (x, y, radius) => x + radius >= 570 ? 'wall' : null;
  c.scr_ball_approach();
  assert.ok(c.ballStageGoal);
  assert.ok(Math.abs(c.ballStageGoal.dy) > 0.5, 'do not keep pushing into the wall');
  const goal = c.ballStageGoal;
  c.x = goal.x; c.y = goal.y;
  c.scr_ball_approach();
  assert.equal(c.walkingAround, false);
  assert.ok(Math.abs(c.pushPos.y - ball.y) > 10);
  c.scr_ball_approach();
  assert.ok(Math.abs(c.pushPos.y - ball.y) > 10, 'keep the recovery direction after arrival');
});
test('one second of body contact without ball progress replans the push', () => {
  const {c} = world();
  for (let i = 0; i < 31; i++) {
    c.ballBodyContact = true; c.scr_ball_push_tick();
  }
  assert.ok(c.ballPushStallTime >= 1);
  c.scr_ball_approach();
  assert.ok(c.ballStageGoal);
  assert.ok(Math.abs(c.ballStageGoal.dy) >= 0.49, 'choose an alternative to the stalled straight push');
});
test('ordinary routes detour around tower range and restore the shared grid', () => {
  const {c, towers, paths, grid} = world();
  c.state = 'Skirmish'; c.x = 100;
  towers.push({x: 512, y: 512, hp: 100, num: 2, bigRange: 160, target: 'ball'});
  grid.add('0,0'); const before = [...grid];
  assert.notEqual(c.scr_pathfind(924, 512, 5, true), -1);
  const points = paths.get(c.active);
  assert.ok(points.some(p => Math.abs(p[1] - 512) > 160));
  for (let i = 1; i < points.length; i++)
    assert.ok(c.scr_ai_tower_segment(...points[i - 1], ...points[i]));
  assert.deepEqual([...grid], before);
});
test('skirmish targets stay outside tower range while Push and Thirst may enter', () => {
  const {c, towers} = world();
  towers.push({x: 700, y: 512, hp: 100, num: 2, bigRange: 160, target: 'ball'});
  c.state = 'Skirmish'; c.x = 400; c.targetX = 700; c.targetY = 512;
  c.scr_ai_safe_tower_target();
  assert.ok(Math.hypot(c.targetX - 700, c.targetY - 512) >= 208);
  assert.equal(c.scr_ai_tower_segment(400, 512, 700, 512), false);
  for (const state of ['Push', 'Thirst']) {
    c.state = state; c.targetX = 700; c.targetY = 512; c.scr_ai_safe_tower_target();
    assert.equal(c.targetX, 700);
    assert.equal(c.scr_ai_tower_segment(400, 512, 700, 512), true);
  }
});
test('ordinary bots already under a tower retreat, but a kill chase may continue', () => {
  const {c, towers} = towerWorld();
  c.state = 'Skirmish'; assert.equal(c.scr_ball_tower_escape(), true);
  c.escapeTower = null; c.state = 'Thirst';
  assert.equal(c.scr_ball_tower_escape(), false);
  towers[0].num = 1; c.state = 'Skirmish';
  assert.equal(c.scr_ball_tower_escape(), false, 'friendly towers remain safe');
});
test('reaching the contact point keeps body pressure instead of backing away', () => {
  const {c, ball} = world();
  c.x = ball.x - ball.radius * 0.5;
  c.scr_ball_approach();
  assert.equal(c.walkingAround, false);
  assert.equal(c.ballStageGoal, null);
});
test('wall clearance respects asymmetric player bounds when moving away', () => {
  const {c} = world();
  c.x = 512;
  c.collision_line = (ax, ay, bx, by) => Math.max(ax, bx) >= 522 ? 'wall' : null;
  assert.equal(c.scr_ai_walk_segment(512, 512, 400, 512), true);
  assert.equal(c.scr_ai_walk_segment(512, 512, 530, 512), false);
});
test('combat shots cannot accidentally knock the ball sideways near a tower', () => {
  const {c, ball, towers} = world();
  towers.push({x: ball.x + 150, y: ball.y, hp: 100, num: 2, bigRange: 260, target: 'ball'});
  c.collision_line = (ax, ay, bx, by, object) => object === 'ball' ? ball : null;
  assert.equal(c.scr_ai_ball_blocks_combat_shot({x: 600, y: 700}), true);
  c.collision_line = () => null;
  assert.equal(c.scr_ai_ball_blocks_combat_shot({x: 600, y: 700}), false);
  towers[0].num = 1;
  c.collision_line = () => ball;
  assert.equal(c.scr_ai_ball_blocks_combat_shot({x: 600, y: 700}), false);
});
test('ordinary movement retries a blocked goal like the last committed planner', () => {
  for (const state of ['Travel', 'Travel Ball', 'Skirmish']) {
    const {c, paths, grid} = world();
    c.state = state; c.x = 100; c.targetX = 800; c.targetY = 512;
    grid.add('25,16'); // Desired endpoint is in a wall cell.
    c.place_meeting = (x, y) => x === 800 && y === 512;
    const route = c.scr_pathfind(c.targetX, c.targetY, 5, true);
    assert.notEqual(route, -1, state + ' must try nearby reachable endpoints');
    const points = paths.get(route), end = points.at(-1);
    assert.equal(end[0], 770); assert.equal(end[1], 512);
    assert.equal(c.targetX, 800, 'resolving a path must not rewrite the FSM target');
    assert.equal(c.targetY, 512);
  }
});
test('failed replans preserve active movement and path progress in ordinary states', () => {
  const alarmSource = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI', 'Alarm_2.gml'), 'utf8');
  const cleanup = alarmSource.slice(alarmSource.indexOf('if (state != "Push" && ballApproachPath'),
    alarmSource.indexOf('overlapping ='));
  const navigation = alarmSource.slice(alarmSource.indexOf('if(bleed == 0'),
    alarmSource.indexOf('alarm[2] = state == "Push"'));
  for (const state of ['Travel', 'Travel Ball', 'Skirmish']) {
    const {c, paths} = world();
    c.state = state; c.x = 100; c.targetX = 800; c.targetY = 512; c.spd = 5;
    vm.runInContext('function ordinaryAlarm() {' + cleanup + navigation + '}', c);
    c.ordinaryAlarm();
    const original = c.active;
    assert.ok(original != null);
    c.x = 300; c.path_position = 0.25;
    c.mp_grid_path = () => false;
    for (let update = 0; update < 5; update++) {
      c.targetX += 10;
      c.ordinaryAlarm();
      assert.equal(c.active, original, state + ' must retain its route on a transient failure');
      assert.equal(c.path_position, 0.25, 'do not restart a retained path at its beginning');
      assert.equal(paths.size, 1, 'failed candidates must not leak paths');
    }
  }
});
test('cleaning an old ball-approach resource does not stop a newer travel route', () => {
  const {c, paths} = world();
  c.scr_ball_approach();
  const ballRoute = c.ballApproachPath;
  c.state = 'Travel';
  const travelRoute = c.scr_pathfind(800, 512, 5, true);
  const alarm = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI', 'Alarm_2.gml'), 'utf8');
  const cleanup = alarm.slice(alarm.indexOf('if (state != "Push" && ballApproachPath'),
    alarm.indexOf('overlapping ='));
  vm.runInContext(cleanup, c);
  assert.equal(c.active, travelRoute);
  assert.equal(paths.has(ballRoute), false);
  assert.equal(c.ballApproachPath, -1);
});
test('ordinary grid routes remain usable when stricter body sweeps reject a waypoint', () => {
  const {c} = world();
  c.state = 'Travel'; c.x = 100;
  // This is a valid legacy grid route. Body-contact clearance belongs only
  // to the ball approach planner and must not cancel ordinary navigation.
  c.scr_ai_walk_segment = () => false;
  assert.notEqual(c.scr_pathfind(800, 512, 5, true), -1);
  assert.ok(c.active != null);
});
test('repeated ordinary replans make forward progress instead of reversing', () => {
  for (const state of ['Travel', 'Travel Ball', 'Skirmish']) {
    const {c, paths} = world();
    c.state = state; c.x = 100;
    for (let update = 0; update < 8; update++) {
      const before = c.x;
      c.scr_pathfind(800, 512, 5, true);
      const points = paths.get(c.active);
      let budget = 50, distanceTravelled = 0;
      for (let i = 1; i < points.length && budget > 0; i++) {
        const dx = points[i][0] - c.x, dy = points[i][1] - c.y;
        const distance = Math.hypot(dx, dy);
        if (!distance) continue;
        const amount = Math.min(distance, budget);
        c.x += dx / distance * amount; c.y += dy / distance * amount;
        budget -= amount; distanceTravelled += amount;
      }
      c.path_position = distanceTravelled / c.path_get_length(c.active);
      assert.ok(c.x > before, state + ' must continue progressing between alarms');
      assert.equal(paths.size, 1);
    }
  }
});
function installStepEvent(c, ball) {
  // GML permits obj_bigBall.x to resolve the singleton instance. Make that
  // lookup explicit in the mock, then execute the actual full Step event.
  const event = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI', 'Step_1.gml'), 'utf8')
    .replaceAll('obj_bigBall.', 'testBall.')
    .replace('if(global.aiPushing[team] = false)', 'if(global.aiPushing[team] == false)');
  c.testBall = ball;
  vm.runInContext('function aiStepEvent() {' + event + '}', c);
}
test('corner detours retain Push while losing sight of the ball and moving farther away', () => {
  const {c, ball, paths} = world();
  c.x = 650; c.enemy = {x: 1000, y: 1000, hp: 250, frost: 0};
  const route = c.path_add();
  // A valid detour may temporarily increase straight-line distance past 300.
  paths.set(route, [[650, 512], [700, 850], [400, 850], [408, 512]]);
  c.ballApproachPath = route;
  c.ballStageGoal = {x: 408, y: 512, ballX: ball.x, ballY: ball.y, dx: 1, dy: 0};
  c.walkingAround = true;
  c.path_start(route, 5);
  c.collision_line = (ax, ay, bx, by) => bx === ball.x && by === ball.y && c.x > 480 ? 'wall' : null;
  installStepEvent(c, ball);
  const length = c.path_get_length(route), points = paths.get(route);
  let fartherThan300 = false;
  for (let frame = 0; frame < Math.ceil(length / 5); frame++) {
    c.scr_ball_push_tick();
    c.aiStepEvent();
    assert.equal(c.state, 'Push', 'a progressing corner detour must not switch back to Travel Ball');
    const travelled = Math.min(length, (frame + 1) * 5);
    let remaining = travelled;
    for (let i = 1; i < points.length; i++) {
      const dx = points[i][0] - points[i - 1][0], dy = points[i][1] - points[i - 1][1];
      const segment = Math.hypot(dx, dy);
      if (remaining <= segment) {
        c.x = points[i - 1][0] + dx * remaining / segment;
        c.y = points[i - 1][1] + dy * remaining / segment;
        break;
      }
      remaining -= segment;
    }
    c.path_position = travelled / length;
    fartherThan300 ||= Math.hypot(c.x - ball.x, c.y - ball.y) > 300;
  }
  assert.ok(fartherThan300);
  assert.ok(Math.hypot(c.x - ball.x, c.y - ball.y) < 110);
});
test('stalled or stale corner routes do not hold Push indefinitely', () => {
  const {c, ball, paths} = world();
  c.x = 650;
  const route = c.path_add(); paths.set(route, [[650, 512], [408, 512]]);
  c.ballApproachPath = route; c.path_start(route, 5);
  c.ballStageGoal = {x: 408, y: 512, ballX: ball.x, ballY: ball.y, dx: 1, dy: 0};
  c.walkingAround = true;
  assert.equal(c.scr_ball_approach_committed(), true);
  c.ballApproachNoProgressTime = 2;
  assert.equal(c.scr_ball_approach_committed(), false);
  c.ballApproachNoProgressTime = 0; ball.x += 100;
  assert.equal(c.scr_ball_approach_committed(), false);
});
test('acquiring Push schedules its route immediately instead of following Travel Ball', () => {
  const {c, ball} = world();
  c.state = 'Travel Ball'; c.x = 400; c.alarm[2] = 10;
  c.enemy = {x: 1000, y: 1000, hp: 250, frost: 0};
  installStepEvent(c, ball);
  c.aiStepEvent();
  assert.equal(c.state, 'Push'); assert.equal(c.alarm[2], 1);
});
function protectedSkirmish() {
  const w = world();
  w.c.state = 'Skirmish'; w.c.x = 300;
  w.c.enemy = {x: 700, y: 512, hp: 250, frost: 0};
  w.towers.push({x: 700, y: 512, hp: 100, num: 2, bigRange: 260, target: 'ball'});
  return w;
}
test('four seconds of tower-blocked skirmishing selects Push without another pusher', () => {
  const {c, ball} = protectedSkirmish();
  c.global.aiPushing[c.team] = true; // A stale flag must not force Forward.
  installStepEvent(c, ball);
  for (let frame = 0; frame < 119; frame++) {
    c.aiStepEvent(); assert.equal(c.state, 'Skirmish');
  }
  c.aiStepEvent();
  assert.equal(c.state, 'Push'); assert.equal(c.alarm[2], 1);
  assert.ok(c.recentlySwithced > 0);
});
test('four-second timeout selects Forward only for an actual friendly pusher', () => {
  const {c, bots} = protectedSkirmish();
  bots.push({team: c.team + 1, state: 'Push'});
  bots.push({team: c.team, state: 'Push'});
  c.delta_time = 250000; // The timeout measures seconds, including slower frames.
  for (let frame = 0; frame < 15; frame++) assert.equal(c.scr_ai_skirmish_tower_tick(), false);
  assert.equal(c.scr_ai_skirmish_tower_tick(), true);
  assert.equal(c.state, 'Forward'); assert.equal(c.alarm[2], 1);
});
test('tower wait resets when switching enemy, gaining access or leaving Skirmish', () => {
  const {c, towers} = protectedSkirmish();
  c.delta_time = 100000;
  for (let i = 0; i < 30; i++) c.scr_ai_skirmish_tower_tick();
  c.enemy = {x: 710, y: 512, hp: 250, frost: 0};
  c.scr_ai_skirmish_tower_tick(); assert.ok(c.skirmishTowerWaitTime < 0.11);
  towers[0].hp = 0;
  c.scr_ai_skirmish_tower_tick(); assert.equal(c.skirmishTowerWaitTime, 0);
  towers[0].hp = 100; c.scr_ai_skirmish_tower_tick();
  c.state = 'Thirst'; c.scr_ai_skirmish_tower_tick();
  assert.equal(c.skirmishTowerWaitTime, 0); assert.equal(c.state, 'Thirst');
});
test('a safely reachable fighting position does not trigger the tower timeout', () => {
  const {c} = protectedSkirmish();
  c.x = 1020; c.enemy.x = 900; // Enemy near the edge; fighting position is outside.
  for (let frame = 0; frame < 150; frame++) assert.equal(c.scr_ai_skirmish_tower_tick(), false);
  assert.equal(c.state, 'Skirmish'); assert.equal(c.skirmishTowerWaitTime, 0);
});
test('repeated corner recovery cannot walk away from the ball indefinitely', () => {
  const {c, ball, paths} = world();
  c.x = ball.x + 35; c.y = ball.y + 35;
  // No useful push direction exists in this corner. Clearance is possible,
  // but reaching it must not authorize another step away from the ball.
  c.scr_ball_push_clear = () => false;
  for (let attempt = 0; attempt < 50; attempt++) {
    c.scr_ball_approach();
    if (c.active != null) {
      const end = paths.get(c.active).at(-1);
      c.x = end[0]; c.y = end[1]; c.path_end();
    }
    c.scr_ball_push_tick();
    assert.ok(Math.hypot(c.x - ball.x, c.y - ball.y) <= ball.radius + 72 + 0.01,
      'fallback endpoints must stay anchored to the ball, not advance from each new bot position');
  }
});
test('an already-clear bot walks into contact instead of retreating farther or idling', () => {
  const {c, ball, paths} = world();
  c.x = ball.x + 150; c.y = ball.y + 150;
  c.scr_ball_push_clear = () => false;
  for (let attempt = 0; attempt < 20; attempt++) {
    c.scr_ball_approach();
    assert.ok(c.active != null);
    const end = paths.get(c.active).at(-1);
    assert.ok(Math.hypot(end[0] - ball.x, end[1] - ball.y) < ball.radius);
    assert.equal(c.walkingAround, false);
    assert.equal(c.ballStageGoal, null);
    assert.equal(c.x, ball.x + 150); assert.equal(c.y, ball.y + 150);
  }
});
test('a stale waypoint far from the ball cannot keep a runaway Push route alive', () => {
  const {c, ball, paths} = world();
  c.x = 700; c.y = 700;
  const route = c.path_add(); paths.set(route, [[700, 700], [950, 950]]);
  c.ballApproachPath = route; c.path_start(route, 5);
  c.walkingAround = true;
  c.ballStageGoal = {x: 950, y: 950, ballX: ball.x, ballY: ball.y, dx: 1, dy: 0};
  assert.equal(c.scr_ball_approach_committed(), false);
  c.scr_ball_push_clear = () => false;
  c.scr_ball_approach();
  assert.notEqual(c.active, route);
  const end = paths.get(c.active).at(-1);
  assert.ok(Math.hypot(end[0] - ball.x, end[1] - ball.y) < ball.radius);
  assert.equal(c.ballStageGoal, null);
});
test('corner clearance never creates a path endpoint beyond the map bounds', () => {
  for (const [bx, by, px, py] of [
    [30, 30, 10, 10], [994, 30, 1014, 10],
    [30, 994, 10, 1014], [994, 994, 1014, 1014]
  ]) {
    const {c, ball, paths} = world();
    Object.assign(ball, {x: bx, y: by});
    c.x = px; c.y = py; c.pushPos = {x: bx - 20, y: by};
    c.scr_ball_push_clear = () => false;
    c.scr_ball_approach();
    for (const points of paths.values()) for (const [x, y] of points) {
      assert.ok(x >= 0 && y >= 0 && x < c.room_width && y < c.room_height);
    }
  }
});
test('corner wall geometry falls back to body contact and applies a collision impulse', () => {
  const {c, ball, paths, shots} = world();
  c.x = 600; c.y = 600;
  // Ball touches the top and left walls. No useful rear stance fits between
  // the ball and those walls, but walking into its exposed face is possible.
  c.place_meeting = (x, y) => x - 12 < 480 || y - 12 < 480;
  c.collision_line = (ax, ay, bx, by) => Math.min(ax, bx) < 480 || Math.min(ay, by) < 480 ? 'wall' : null;
  c.collision_circle = (x, y, radius) => x - radius < 480 || y - radius < 480 ? 'wall' : null;
  c.scr_ball_approach();
  assert.ok(c.ballDislodgeTime > 0);
  assert.equal(c.walkingAround, false);
  assert.ok(c.active != null);
  const end = paths.get(c.active).at(-1);
  assert.ok(Math.hypot(end[0] - ball.x, end[1] - ball.y) < ball.radius);
  c.x = end[0]; c.y = end[1];
  let impulses = 0;
  Object.assign(c, {
    other: ball, pushing: 0.5, path_speed: 5, power: Math.pow, sqrt: Math.sqrt,
    scr_ball_move: (direction, force) => {assert.ok(force > 0); impulses++;}
  });
  const collision = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI',
    'Collision_obj_bigBall.gml'), 'utf8').replace(/\bexit;/g, 'return;');
  vm.runInContext('function cornerCollision() {' + collision + '}', c);
  c.cornerCollision();
  assert.equal(impulses, 1, 'wrong-side/reposition guards must not suppress the corner nudge');
  assert.equal(c.ballBodyContact, true);
  assert.equal(shots(), 0, 'dislodging must not authorize a sideways weapon shot');
});
test('a missing objective heading still permits direct corner contact', () => {
  const {c, ball, paths} = world();
  c.pushPos = {x: ball.x, y: ball.y};
  c.scr_ball_approach();
  assert.ok(c.active != null);
  assert.equal(c.walkingAround, false);
  assert.ok(c.ballDislodgeTime > 0);
  const end = paths.get(c.active).at(-1);
  assert.ok(Math.hypot(end[0] - ball.x, end[1] - ball.y) < ball.radius);
});
test('a body nudge expires after half a second or earlier ball movement', () => {
  const {c, ball} = world();
  assert.equal(c.scr_ball_corner_contact(), true);
  c.delta_time = 100000;
  for (let frame = 0; frame < 5; frame++) c.scr_ball_push_tick();
  assert.ok(c.ballDislodgeTime < 0.000001);
  c.scr_ball_corner_contact(); assert.ok(c.ballDislodgeTime > 0);
  ball.x += 12; c.scr_ball_push_tick();
  assert.equal(c.ballDislodgeTime, 0);
  c.scr_ball_corner_contact(); c.state = 'Travel'; c.scr_ball_push_tick();
  assert.equal(c.ballDislodgeTime, 0);
});
test('direct contact does not cross a wall or chase a dangerous ball', () => {
  const {c, ball} = world();
  c.collision_line = () => 'wall';
  assert.equal(c.scr_ball_corner_contact(), false);
  c.collision_line = () => null; ball.murderball = 1;
  assert.equal(c.scr_ball_corner_contact(), false);
  assert.equal(c.ballDislodgeTime, 0);
});
function singleWall(which) {
  const w = world(), {c, ball} = w;
  const horizontal = which === 'top' || which === 'bottom';
  const dx = horizontal ? 1 : 0, dy = horizontal ? 0 : 1;
  const nx = which === 'left' ? 1 : which === 'right' ? -1 : 0;
  const ny = which === 'top' ? 1 : which === 'bottom' ? -1 : 0;
  const blocked = (x, y, left, right, top, bottom) =>
    which === 'top' ? y + top < 480 : which === 'bottom' ? y + bottom > 544 :
    which === 'left' ? x + left < 480 : x + right > 544;
  c.x = ball.x - dx * 44 + nx * 14;
  c.y = ball.y - dy * 44 + ny * 14;
  c.pushPos = {x: ball.x - dx * 20, y: ball.y - dy * 20};
  c.place_meeting = (x, y) => blocked(x, y, -12, 8, -12, 21);
  c.collision_line = (ax, ay, bx, by) =>
    blocked(ax, ay, 0, 0, 0, 0) || blocked(bx, by, 0, 0, 0, 0) ? 'wall' : null;
  c.collision_circle = (x, y, r) => blocked(x, y, -r, r, -r, r) ? 'wall' : null;
  return {...w, dx, dy, blocked};
}
test('a single-wall push corrects alignment into contact instead of backing out', () => {
  for (const which of ['top', 'bottom', 'left', 'right']) {
    const {c, ball} = singleWall(which);
    c.scr_ball_approach();
    assert.equal(c.walkingAround, false, which + ': keep advancing on the wall-parallel line');
    assert.equal(c.ballStageGoal, null);
    assert.ok(Math.hypot(c.targetX - ball.x, c.targetY - ball.y) < ball.radius);
    assert.equal(c.ballDislodgeTime, 0, 'a clear wall-parallel push needs no corner fallback');
  }
});
test('wall-parallel body pushing makes sustained progress with the actual ball-step code', () => {
  const collision = fs.readFileSync(path.join(__dirname, '..', 'objects', 'obj_AI',
    'Collision_obj_bigBall.gml'), 'utf8').replace(/\bexit;/g, 'return;');
  const ballPhysics = fs.readFileSync(path.join(__dirname, '..', 'scripts', 'scr_ballStep', 'scr_ballStep.gml'), 'utf8');
  for (const which of ['top', 'bottom', 'left', 'right']) {
    const {c, ball, paths, dx, dy, blocked} = singleWall(which);
    const physics = {
      x: ball.x, y: ball.y, xspd: 0, yspd: 0, oil: 0, fric: 0.4, radius: 32,
      point_distance: c.point_distance, ceil: Math.ceil, min: Math.min, max: Math.max, abs: Math.abs,
      lengthdir_x: c.lengthdir_x, lengthdir_y: c.lengthdir_y, power: Math.pow,
      noone: null, server_walls: 'server-wall', obj_turret: 'tower', ball_diagonal_wall: 'diagonal',
      instance_place: () => null,
      place_meeting: (x, y, object) => object === 'server-wall' && blocked(x, y, -32, 32, -32, 32)
    };
    vm.createContext(physics); vm.runInContext(ballPhysics, physics);
    let contacts = 0, worstBacktrack = 0;
    const startX = ball.x, startY = ball.y;
    c.ammo = 0; // Measure body pushing alone, without weapon impulses.
    Object.assign(c, {
      other: ball, pushing: 0.5, path_speed: 5, power: Math.pow, sqrt: Math.sqrt,
      scr_ball_move: (direction, force) => {
        physics.xspd += c.lengthdir_x(force, direction);
        physics.yspd += c.lengthdir_y(force, direction);
        contacts++;
      }
    });
    vm.runInContext('function bodyContact() {' + collision + '}', c);
    for (let frame = 0; frame < 120; frame++) {
      c.scr_ball_push_tick();
      if (c.pushingBall > 0 && --c.pushingBall === 0) c.path_speed *= 2;
      if (frame % 3 === 0) {
        c.pushPos = {x: ball.x - dx * 20, y: ball.y - dy * 20};
        c.scr_ball_approach();
      }
      const before = c.x * dx + c.y * dy;
      if (c.active != null) {
        const route = c.active, points = paths.get(route), length = c.path_get_length(route);
        let travelled = Math.min(length, c.path_position * length + c.path_speed);
        const position = length > 0 ? travelled / length : 1;
        for (let i = 1; i < points.length; i++) {
          const sx = points[i][0] - points[i - 1][0], sy = points[i][1] - points[i - 1][1];
          const segment = Math.hypot(sx, sy);
          if (travelled <= segment) {
            c.x = points[i - 1][0] + sx * travelled / segment;
            c.y = points[i - 1][1] + sy * travelled / segment;
            break;
          }
          travelled -= segment;
        }
        c.path_position = position;
        if (position >= 1) c.path_end();
      }
      worstBacktrack = Math.min(worstBacktrack, c.x * dx + c.y * dy - before);
      const nearestX = Math.max(c.x - 12, Math.min(c.x + 8, ball.x));
      const nearestY = Math.max(c.y - 12, Math.min(c.y + 21, ball.y));
      if (Math.hypot(nearestX - ball.x, nearestY - ball.y) <= ball.radius) c.bodyContact();
      physics.scr_ballStep(1);
      Object.assign(ball, {x: physics.x, y: physics.y, xspd: physics.xspd, yspd: physics.yspd});
    }
    const progress = (ball.x - startX) * dx + (ball.y - startY) * dy;
    assert.ok(contacts > 10, which + ': sustain physical contact');
    assert.ok(progress > 40, which + ': advance the ball along the wall, got ' + progress);
    assert.ok(worstBacktrack >= -0.01, which + ': no repeated backwards staging moves');
  }
});
test('small existing wall-contact overlap permits sliding but still rejects pushing into the wall', () => {
  const {c, ball} = singleWall('top');
  ball.y = 510; // Contact-mask rounding: initial 30px probe touches the wall.
  c.collision_circle = (x, y, r) => y - r <= 480 ? 'wall' : null;
  assert.equal(c.scr_ball_push_clear(1, 0), true);
  assert.equal(c.scr_ball_push_clear(0, -1), false);
});
console.log(count + ' checks passed (mock engine; in-game playtest still required).');
