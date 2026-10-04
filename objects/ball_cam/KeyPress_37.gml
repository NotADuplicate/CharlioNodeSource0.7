/// @description Shift spectating backward
if (global.spectator || global.dead) {
    linked = true;

    var current = 0;
    if (instance_exists(link) && variable_instance_exists(link, "num"))
        current = link.num;

    var next = current;

    for (var i = 0; i < global.loop + (global.spectator ? 1 : 0); i++) {
        if (next == 1 || next == 0)
            next = global.spectator ? 100 : global.loop;
        else if (next == 100)
            next = global.loop;
        else
            next--;

        if (next == 100) {
            link = obj_bigBall;
            break;
        }

        var player = global.players[next];
        if (instance_exists(player)
            && player.respawnTimer <= 0
            && (global.spectator || global.teamNum[next] == global.teamNum[ball_player.num])) {
            link = player;
            break;
        }
    }
}