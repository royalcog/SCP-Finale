if (sound_cooldown > 0) sound_cooldown--;

vy = min(vy + gravity, max_speed);
x += vx;
y += vy;

if (instance_exists(obj_battlebox))
{
    var _local = scr_world_to_box_local(x, y);
    var _interior = scr_get_box_interior();
    var _min_x = _interior.x1 + yarn_radius;
    var _max_x = _interior.x2 - yarn_radius;
    var _min_y = _interior.y1 + yarn_radius;
    var _max_y = _interior.y2 - yarn_radius;

    // while it's still above the box, just let it fall freely — once it's
    // dropped down past the top wall for the first time, treat it as "in"
    // and start bouncing off all four walls from then on
    if (!entered_box && _local.y >= _min_y) entered_box = true;

    if (entered_box)
    {
        var _bounced = false;
        var _angle = obj_battlebox.box_angle;

        // each wall reflects the ball off ITS current world-space facing
        // (the local axis direction rotated by the box's live angle),
        // and only actually bounces (and counts as a hit for the sound)
        // when the ball's real velocity is moving into it
        if (_local.x < _min_x)
        {
            _local.x = _min_x;
            var _n = scr_rotate_point(-1, 0, _angle);
            var _dot = vx * _n.x + vy * _n.y;
            if (_dot < 0)
            {
                vx -= 2 * _dot * _n.x;
                vy -= 2 * _dot * _n.y;
                vx *= bounce_damping;
                vy *= bounce_damping;
                _bounced = true;
            }
        }
        else if (_local.x > _max_x)
        {
            _local.x = _max_x;
            var _n = scr_rotate_point(1, 0, _angle);
            var _dot = vx * _n.x + vy * _n.y;
            if (_dot < 0)
            {
                vx -= 2 * _dot * _n.x;
                vy -= 2 * _dot * _n.y;
                vx *= bounce_damping;
                vy *= bounce_damping;
                _bounced = true;
            }
        }

        if (_local.y < _min_y)
        {
            _local.y = _min_y;
            var _n = scr_rotate_point(0, -1, _angle);
            var _dot = vx * _n.x + vy * _n.y;
            if (_dot < 0)
            {
                vx -= 2 * _dot * _n.x;
                vy -= 2 * _dot * _n.y;
                vx *= bounce_damping;
                vy *= bounce_damping;
                _bounced = true;
            }
        }
        else if (_local.y > _max_y)
        {
            _local.y = _max_y;
            var _n = scr_rotate_point(0, 1, _angle);
            var _dot = vx * _n.x + vy * _n.y;
            if (_dot < 0)
            {
                vx -= 2 * _dot * _n.x;
                vy -= 2 * _dot * _n.y;
                vx *= bounce_damping;
                vy *= bounce_damping;
                _bounced = true;
            }
        }

        var _world = scr_box_local_to_world(_local.x, _local.y);
        x = _world.x;
        y = _world.y;

        if (_bounced && sound_cooldown <= 0)
        {
            audio_play_sound(snd_impact, 2, false);
            sound_cooldown = 6;
        }
    }
}

// tumble like a ball rolling under gravity: spin follows the current
// horizontal velocity, so a bounce that flips it also flips which way it
// visibly spins
image_angle -= vx * spin_factor;

if (instance_exists(obj_soul) && scr_attack_touches_soul())
{
    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
}