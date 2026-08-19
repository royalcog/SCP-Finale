if (sound_cooldown > 0) sound_cooldown--;

if (instance_exists(obj_battlebox))
{
    // real gravity always points straight down on screen — take that
    // fixed world direction and rotate it into the box's current local
    // frame, so the ball visibly falls the normal way no matter how the
    // box is oriented right now
    var _g = scr_rotate_point(0, gravity, -obj_battlebox.box_angle);
    local_vx += _g.x;
    local_vy += _g.y;

    var _speed = point_distance(0, 0, local_vx, local_vy);
    if (_speed > max_speed)
    {
        local_vx = local_vx / _speed * max_speed;
        local_vy = local_vy / _speed * max_speed;
    }
}

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
    var _damping = random_range(bounce_damping_min, bounce_damping_max);

    if (local_x < _min_x)
    {
        local_x = _min_x;
        if (local_vx < 0)
        {
            local_vx = -local_vx * _damping;
            if (local_vx < min_bounce_speed) local_vx = min_bounce_speed;
            _bounced = true;
        }
    }
    else if (local_x > _max_x)
    {
        local_x = _max_x;
        if (local_vx > 0)
        {
            local_vx = -local_vx * _damping;
            if (local_vx > -min_bounce_speed) local_vx = -min_bounce_speed;
            _bounced = true;
        }
    }

    if (local_y < _min_y)
    {
        local_y = _min_y;
        if (local_vy < 0)
        {
            local_vy = -local_vy * _damping;
            if (local_vy < min_bounce_speed) local_vy = min_bounce_speed;
            _bounced = true;
        }
    }
    else if (local_y > _max_y)
    {
        local_y = _max_y;
        if (local_vy > 0)
        {
            local_vy = -local_vy * _damping;
            if (local_vy > -min_bounce_speed) local_vy = -min_bounce_speed;
            _bounced = true;
        }
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