/// Quaternion rotates object coordinates into camera coordinates.
/// Math axes: X right, Y up, Z toward viewer; movement input: Y down.
/// State stays continuous; only the displayed pose is rounded to 5 degrees.
function ball_pose(_qx, _qy, _qz, _qw) {
    var _length = sqrt(_qx*_qx + _qy*_qy + _qz*_qz + _qw*_qw);
    if (_length <= 0) show_error("Ball quaternion must have nonzero length.", true);
    _qx /= _length; _qy /= _length; _qz /= _length; _qw /= _length;

    // Quaternion -> object-to-camera rotation matrix.
    var _r00 = 1 - 2*(_qy*_qy + _qz*_qz);
    var _r01 = 2*(_qx*_qy - _qw*_qz);
    var _r02 = 2*(_qx*_qz + _qw*_qy);
    var _r10 = 2*(_qx*_qy + _qw*_qz);
    var _r11 = 1 - 2*(_qx*_qx + _qz*_qz);
    var _r12 = 2*(_qy*_qz - _qw*_qx);
    var _nx = 2*(_qx*_qz - _qw*_qy);
    var _ny = 2*(_qy*_qz + _qw*_qx);
    var _nz = 1 - 2*(_qx*_qx + _qy*_qy);

    // The texture is mirrored across object Z=0. Fold the back hemisphere
    // to the front using R' = screen_flip_X * R * object_flip_Z.
    var _rear = (_nz < 0);
    if (_rear) {
        _r00 = -_r00; _r01 = -_r01;
        _r12 = -_r12;
        _nz = -_nz;
    }

    var _tilt = radtodeg(arccos(clamp(_nz, 0, 1)));
    var _azimuth = 0;
    if (_nx*_nx + _ny*_ny > 0.000000000001) {
        _azimuth = (darctan2(_ny, _nx) + 360) mod 360;
    }

    // Canonical camera's first row. Compare to actual camera to recover
    // the remaining screen-plane rotation. Use the unrounded direction.
    var _ct = dcos(_tilt);
    var _st = dsin(_tilt);
    var _cp = dcos(_azimuth);
    var _sp = dsin(_azimuth);
    var _cx = _ct*_cp;
    var _cy = _ct*_sp;
    var _cz = -_st;
    var _roll = darctan2(
        _r10*_cx + _r11*_cy + _r12*_cz,
        _r00*_cx + _r01*_cy + _r02*_cz
    );

    var _ring = clamp(floor(_tilt/5 + 0.5), 0, 18);
    var _sector = floor(_azimuth/5 + 0.5) mod 72;
    var _slot = 0;
    if (_ring > 0) _slot = 1 + (_ring - 1)*72 + _sector;
    // At the quantized pole, azimuth is no longer a viewing dimension.
    // C(0, azimuth) = screen_rotation(-azimuth), so absorb it into roll.
    if (_ring == 0) _roll -= _azimuth;

    var _angle = _roll;
    if (_rear) _angle = -_angle;
    _angle = (_angle + 720) mod 360;
    _angle = (floor(_angle/5 + 0.5)*5) mod 360;
    var _flip_h = _rear;

    return {
        qx : _qx, qy : _qy, qz : _qz, qw : _qw,
        frame : _slot,
        angle : _angle,
        flip_h : _flip_h,
        flip_v : false
    };
}

/// ball_roll(state, xMovement, yMovement, rollingRadius)
/// Distances and radius use the same units (usually room pixels).
/// Positive X rolls right; positive Y rolls down. No slipping.
/// Each call treats that frame's movement as one straight segment.
function ball_roll(_state, _xMovement, _yMovement, _radius = 16) {
    if (_radius <= 0) show_error("Ball rolling radius must be positive.", true);
    var _distance = sqrt(_xMovement*_xMovement + _yMovement*_yMovement);
    if (_distance == 0) {
        return ball_pose(_state.qx, _state.qy, _state.qz, _state.qw);
    }

    // Rolling axis is (yMovement, xMovement, 0). Angle = distance / radius.
    var _half = _distance / (2*_radius);
    var _s = sin(_half) / _distance;
    var _dx = _yMovement*_s;
    var _dy = _xMovement*_s;
    var _dw = cos(_half);
    var _qx = _state.qx;
    var _qy = _state.qy;
    var _qz = _state.qz;
    var _qw = _state.qw;

    // Pre-multiply by the world-space rolling quaternion: delta * current.
    // This preserves accumulated orientation when movement changes direction.
    return ball_pose(
        _dw*_qx + _dx*_qw + _dy*_qz,
        _dw*_qy - _dx*_qz + _dy*_qw,
        _dw*_qz + _dx*_qy - _dy*_qx,
        _dw*_qw - _dx*_qx - _dy*_qy
    );
}