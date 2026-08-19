if (sound_cooldown > 0) sound_cooldown--;

if (instance_exists(obj_battlebox))
{
    // gravity always points straight down in world space, but the sim runs
    // in the box's local frame, so re-derive what "down" looks like from
    // inside the (rotating) box each step
    var _local_gravity = scr_rotate_point(0, gravity, -obj_battlebox.box_angle);
    local_vx += _local_gravity.x;
    local_vy += _local_gravity.y;

    var _speed = point_distance(0, 0, local_vx, local_vy);
    if (_speed > max_speed)
    {
        local_vx = local_vx / _speed * max_speed;
        local_vy = local_vy / _speed * max_speed;
    }

    local_x += local_vx;
    local_y += local_vy;

    var _interior = scr_get_box_interior();
    var _min_x = _interior.x1 + yarn_radius;
    var _max_x = _interior.x2 - yarn_radius;
    var _min_y = _interior.y1 + yarn_radius;
    var _max_y = _interior.y2 - yarn_radius;

    // while it's still above the box, just let it fall freely — once it's
    // dropped down past the top wall for the first time, treat it as "in"
    // and apply full 4-wall bouncing from then on (including that same
    // top wall, correctly, if it later bounces back up into it)
    if (!entered_box && local_y >= _min_y) entered_box = true;

    if (entered_box)
    {
        var _bounced = false;

        if (local_x < _min_x)      { local_x = _min_x; local_vx = abs(local_vx)  * bounce_damping; _bounced = true; }
        else if (local_x > _max_x) { local_x = _max_x; local_vx = -abs(local_vx) * bounce_damping; _bounced = true; }

        if (local_y < _min_y)      { local_y = _min_y; local_vy = abs(local_vy)  * bounce_damping; _bounced = true; }
        else if (local_y > _max_y) { local_y = _max_y; local_vy = -abs(local_vy) * bounce_damping; _bounced = true; }

        if (_bounced && sound_cooldown <= 0)
        {
            audio_play_sound(snd_impact, 2, false);
            sound_cooldown = 6;
        }
    }

    var _world = scr_box_local_to_world(local_x, local_y);
    x = _world.x;
    y = _world.y;

    // tumble like a ball rolling under gravity: spin follows the current
    // local horizontal velocity, so a bounce that flips it also flips
    // which way it visibly spins
    image_angle -= local_vx * spin_factor;
}

if (instance_exists(obj_soul) && scr_attack_touches_soul())
{
    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
}