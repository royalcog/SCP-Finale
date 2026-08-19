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

    var _clamped = false;
    var _bounced = false;
    var _angle = obj_battlebox.box_angle;
    var _damping = random_range(bounce_damping_min, bounce_damping_max); // rolled fresh per bounce, so it doesn't feel the same every hit

    // how far the box actually turned this one frame, and how far the ball
    // currently sits from the box's center — together these tell us how
    // fast a point way out near this ball is sweeping right now purely
    // from rotation, independent of the ball's own velocity
    var _angular_delta = abs(_angle - last_box_angle);
    last_box_angle = _angle;
    var _center = scr_box_center();
    var _radius_from_center = point_distance(_local.x, _local.y, _center.x, _center.y);
    var _rotation_sweep_speed = _radius_from_center * degtorad(_angular_delta);
    var _min_escape_speed = max(min_escape_speed_base, _rotation_sweep_speed * escape_safety_factor);

    // each wall reflects the ball off ITS current world-space facing (the
    // local axis direction rotated by the box's live angle), and only
    // actually bounces (and counts as a hit for the sound) when the
    // ball's real velocity is moving into it — _n is the wall's OUTWARD
    // normal, so "moving into it" means v·n is positive
    if (_local.x < _min_x)
    {
        _clamped = true;
        var _n = scr_rotate_point(-1, 0, _angle);
        var _dot = vx * _n.x + vy * _n.y;
        if (_dot > 0)
        {
            vx -= 2 * _dot * _n.x;
            vy -= 2 * _dot * _n.y;
            vx *= _damping;
            vy *= _damping;

            var _sep = -(vx * _n.x + vy * _n.y);
            if (_sep < _min_escape_speed)
            {
                var _boost = _min_escape_speed - _sep;
                vx -= _boost * _n.x;
                vy -= _boost * _n.y;
            }

            _local.x = _min_x + wall_nudge;
            _bounced = true;
        }
        else
        {
            _local.x = _min_x;
        }
    }
    else if (_local.x > _max_x)
    {
        _clamped = true;
        var _n = scr_rotate_point(1, 0, _angle);
        var _dot = vx * _n.x + vy * _n.y;
        if (_dot > 0)
        {
            vx -= 2 * _dot * _n.x;
            vy -= 2 * _dot * _n.y;
            vx *= _damping;
            vy *= _damping;

            var _sep = -(vx * _n.x + vy * _n.y);
            if (_sep < _min_escape_speed)
            {
                var _boost = _min_escape_speed - _sep;
                vx -= _boost * _n.x;
                vy -= _boost * _n.y;
            }

            _local.x = _max_x - wall_nudge;
            _bounced = true;
        }
        else
        {
            _local.x = _max_x;
        }
    }

    if (_local.y < _min_y)
    {
        _clamped = true;
        var _n = scr_rotate_point(0, -1, _angle);
        var _dot = vx * _n.x + vy * _n.y;
        if (_dot > 0)
        {
            vx -= 2 * _dot * _n.x;
            vy -= 2 * _dot * _n.y;
            vx *= _damping;
            vy *= _damping;

            var _sep = -(vx * _n.x + vy * _n.y);
            if (_sep < _min_escape_speed)
            {
                var _boost = _min_escape_speed - _sep;
                vx -= _boost * _n.x;
                vy -= _boost * _n.y;
            }

            _local.y = _min_y + wall_nudge;
            _bounced = true;
        }
        else
        {
            _local.y = _min_y;
        }
    }
    else if (_local.y > _max_y)
    {
        _clamped = true;
        var _n = scr_rotate_point(0, 1, _angle);
        var _dot = vx * _n.x + vy * _n.y;
        if (_dot > 0)
        {
            vx -= 2 * _dot * _n.x;
            vy -= 2 * _dot * _n.y;
            vx *= _damping;
            vy *= _damping;

            var _sep = -(vx * _n.x + vy * _n.y);
            if (_sep < _min_escape_speed)
            {
                var _boost = _min_escape_speed - _sep;
                vx -= _boost * _n.x;
                vy -= _boost * _n.y;
            }

            _local.y = _max_y - wall_nudge;
            _bounced = true;
        }
        else
        {
            _local.y = _max_y;
        }
    }

    if (_clamped)
    {
        var _world = scr_box_local_to_world(_local.x, _local.y);
        x = _world.x;
        y = _world.y;
    }

    if (_bounced && sound_cooldown <= 0)
    {
        audio_play_sound(snd_impact, 2, false);
        sound_cooldown = 6;
    }
}

image_angle -= vx * spin_factor;

if (instance_exists(obj_soul) && scr_attack_touches_soul())
{
    scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
}