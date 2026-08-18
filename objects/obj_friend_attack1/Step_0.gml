switch (phase)
{
    case "start":
        var _interior = scr_get_box_interior();
        axis = choose("horizontal", "vertical"); // horizontal = hands from left/right, vertical = from up/down
        var _pair_count = irandom_range(1, 2);   // 1 or 2 mirrored pairs -> 2 or 4 flashes total

        points = [];
        for (var i = 0; i < _pair_count; i++)
        {
            var _frac = random_range(0.15, 0.4); // distance in from the near edge; mirrored for the far edge
            if (axis == "horizontal")
            {
                var _y = lerp(_interior.y1, _interior.y2, random_range(0.2, 0.8));
                points[array_length(points)] = { wx: lerp(_interior.x1, _interior.x2, _frac),     wy: _y, side: "left"  };
                points[array_length(points)] = { wx: lerp(_interior.x1, _interior.x2, 1 - _frac), wy: _y, side: "right" };
            }
            else
            {
                var _x = lerp(_interior.x1, _interior.x2, random_range(0.2, 0.8));
                points[array_length(points)] = { wx: _x, wy: lerp(_interior.y1, _interior.y2, _frac),     side: "up"   };
                points[array_length(points)] = { wx: _x, wy: lerp(_interior.y1, _interior.y2, 1 - _frac), side: "down" };
            }
        }

        for (var i = 0; i < array_length(points); i++)
        {
            instance_create_depth(0, 0, -5010, obj_friend_flash_point, { world_x: points[i].wx, world_y: points[i].wy });
        }

        timer = 8 * 3 + 6 * 3 + 5; // matches flash_point's blink_on_time*blinks + blink_off_time*blinks, plus a small buffer
        phase = "waiting_flash";
    break;

    case "waiting_flash":
        timer--;
        if (timer <= 0 && instance_number(obj_friend_flash_point) == 0)
        {
            for (var i = 0; i < array_length(points); i++)
            {
                var _pt = points[i];
                var _perp = (_pt.side == "left" || _pt.side == "right") ? _pt.wy : _pt.wx;
                instance_create_depth(0, 0, -5010, obj_friend_hand_punch, { side: _pt.side, fixed_coord: _perp });
            }
            phase = "waiting_hand";
        }
    break;

    case "waiting_hand":
        if (instance_number(obj_friend_hand_punch) == 0)
        {
            repeat_count++;
            if (repeat_count >= max_repeats)
            {
                instance_destroy();
            }
            else
            {
                timer = gap_timer;
                phase = "gap";
            }
        }
    break;

    case "gap":
        timer--;
        if (timer <= 0) { phase = "start"; }
    break;
}