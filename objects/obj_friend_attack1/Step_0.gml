switch (phase)
{
    case "start":
        orientation = choose("vertical", "horizontal");
        side_a = (orientation == "vertical") ? choose("left", "right") : choose("up", "down");
        side_b = (orientation == "vertical")
            ? ((side_a == "left") ? "right" : "left")
            : ((side_a == "up") ? "down" : "up");
        position_frac = random_range(0.35, 0.65);

        var _strip = instance_create_depth(0, 0, -390, obj_strip_flash);
        _strip.orientation = orientation;
        _strip.position_frac = position_frac;

        timer = _strip.blink_on_time * _strip.blinks + _strip.blink_off_time * _strip.blinks + 5;
        phase = "waiting_flash";
    break;

    case "waiting_flash":
        timer--;
        if (timer <= 0)
        {
            var _h1 = instance_create_depth(0, 0, -380, obj_friend_hand_punch);
            _h1.side = side_a;

            if (dual)
            {
                var _h2 = instance_create_depth(0, 0, -380, obj_friend_hand_punch);
                _h2.side = side_b;
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