if (sound_cooldown > 0) sound_cooldown--;

local_x += local_vx;
local_y += local_vy;

if (instance_exists(obj_battlebox))
{
    var _interior = scr_get_box_interior();
    var _min_x = _interior.x1 + margin;
    var _max_x = _interior.x2 - margin;
    var _min_y = _interior.y1 + margin;
    var _max_y = _interior.y2 - margin;

    var _bounced = false;

    if (local_x < _min_x)
    {
        local_x = _min_x;
        if (local_vx < 0) { local_vx = -local_vx; _bounced = true; }
    }
    else if (local_x > _max_x)
    {
        local_x = _max_x;
        if (local_vx > 0) { local_vx = -local_vx; _bounced = true; }
    }

    if (local_y < _min_y)
    {
        local_y = _min_y;
        if (local_vy < 0) { local_vy = -local_vy; _bounced = true; }
    }
    else if (local_y > _max_y)
    {
        local_y = _max_y;
        if (local_vy > 0) { local_vy = -local_vy; _bounced = true; }
    }

    if (_bounced)
    {
        var _dir = point_direction(0, 0, local_vx, local_vy);
        var _new_speed = random_range(min_speed, max_speed);
        local_vx = lengthdir_x(_new_speed, _dir);
        local_vy = lengthdir_y(_new_speed, _dir);
    }

    var _world = scr_box_local_to_world(local_x, local_y);
    x = _world.x;
    y = _world.y;

    if (_bounced && sound_cooldown <= 0)
    {
        audio_play_sound(snd_impact, 2, false);
        sound_cooldown = 6;
    }
}

image_angle -= local_vx * spin_factor;

if (instance_exists(obj_soul) && scr_attack_touches_soul())
{
    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
}