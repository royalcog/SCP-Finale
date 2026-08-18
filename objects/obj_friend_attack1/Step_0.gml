switch (phase)
{
    case "start":
        orientation = choose("vertical", "horizontal");

        strip_frac = random_range(0.1, 0.9);
        instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: orientation, position_frac: strip_frac });

        timer = 10 * 4 + 8 * 4 + 5; // matches obj_strip_flash's blink_on_time*blinks + blink_off_time*blinks, plus buffer
        phase = "waiting_flash";
    break;

    case "waiting_flash":
        timer--;
        if (timer <= 0 && instance_number(obj_strip_flash) == 0)
        {
            var _interior = scr_get_box_interior();
            var _side_pool = (orientation == "vertical") ? ["up", "down"] : ["left", "right"];
            var _side = _side_pool[irandom(1)];
            var _perp = (orientation == "vertical")
                ? lerp(_interior.x1, _interior.x2, strip_frac)
                : lerp(_interior.y1, _interior.y2, strip_frac);

            current_hand = instance_create_depth(0, 0, -380, obj_friend_hand_punch, { side: _side, fixed_coord: _perp });
            next_flash_spawned = false;
            phase = "waiting_hand";
        }
    break;

    case "waiting_hand":
        // Once the hand is mostly through its punch, kick off the next
        // strip flash early so it overlaps with the tail end of this hand
        // instead of waiting for it to fully finish first.
        if (!next_flash_spawned && instance_exists(current_hand) && current_hand.progress >= 0.6)
        {
            next_flash_spawned = true;
            repeat_count++;

            if (repeat_count < max_repeats)
            {
                orientation = choose("vertical", "horizontal");
                strip_frac = random_range(0.1, 0.9);
                instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: orientation, position_frac: strip_frac });
                timer = 10 * 4 + 8 * 4 + 5;
            }
        }

        if (!instance_exists(current_hand))
        {
            if (next_flash_spawned && repeat_count < max_repeats)
            {
                phase = "waiting_flash"; // the overlapping flash is already ticking
            }
            else
            {
                instance_destroy();
            }
        }
    break;
}