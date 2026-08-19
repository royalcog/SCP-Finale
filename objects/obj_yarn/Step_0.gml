vspeed_y = min(vspeed_y + gravity, max_speed);
x += vspeed_x;
y += vspeed_y;

if (!entered_box && instance_exists(obj_battlebox))
{
    var _check_interior = scr_get_box_interior();
    var _check_local = scr_world_to_box_local(x, y);
    if (_check_local.y >= _check_interior.y1 + yarn_radius)
    {
        entered_box = true;
    }
}

if (entered_box && instance_exists(obj_battlebox))
{
    // do the wall bounce in the box's local (unrotated) frame — this is
    // what makes it bounce correctly off edges that are themselves
    // continuously rotating, without needing to track each wall's
    // instantaneous velocity by hand
    var _local_pos = scr_world_to_box_local(x, y);
    var _local_vel = scr_rotate_point(vspeed_x, vspeed_y, -obj_battlebox.box_angle);

    var _interior = scr_get_box_interior();
    var _min_x = _interior.x1 + yarn_radius;
    var _max_x = _interior.x2 - yarn_radius;
    var _min_y = _interior.y1 + yarn_radius;
    var _max_y = _interior.y2 - yarn_radius;

    var _bounced = false;

    if (_local_pos.x < _min_x)      { _local_pos.x = _min_x; _local_vel.x = abs(_local_vel.x);  _bounced = true; }
    else if (_local_pos.x > _max_x) { _local_pos.x = _max_x; _local_vel.x = -abs(_local_vel.x); _bounced = true; }

    if (_local_pos.y < _min_y)      { _local_pos.y = _min_y; _local_vel.y = abs(_local_vel.y);  _bounced = true; }
    else if (_local_pos.y > _max_y) { _local_pos.y = _max_y; _local_vel.y = -abs(_local_vel.y); _bounced = true; }

    if (_bounced)
    {
        _local_vel.x *= bounce_damping;
        _local_vel.y *= bounce_damping;

        var _world_vel = scr_rotate_point(_local_vel.x, _local_vel.y, obj_battlebox.box_angle);
        vspeed_x = clamp(_world_vel.x, -max_speed, max_speed);
        vspeed_y = clamp(_world_vel.y, -max_speed, max_speed);

        var _world_pos = scr_box_local_to_world(_local_pos.x, _local_pos.y);
        x = _world_pos.x;
        y = _world_pos.y;

        audio_play_sound(snd_impact, 2, false);
    }
}

// tumble like a ball rolling under gravity: spin is driven by the current
// (box-relative) horizontal velocity, so a bounce that flips vx also flips
// which way it visibly spins
var _spin_vel = instance_exists(obj_battlebox)
    ? scr_rotate_point(vspeed_x, vspeed_y, -obj_battlebox.box_angle)
    : { x: vspeed_x, y: vspeed_y };
image_angle -= _spin_vel.x * spin_factor;

if (instance_exists(obj_soul) && scr_attack_touches_soul())
{
    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
}