switch (phase)
{
    case "grab":
        if (instance_exists(hand_left))  hand_left.image_alpha  = min(hand_left.image_alpha  + hand_fade_speed, 1);
        if (instance_exists(hand_right)) hand_right.image_alpha = min(hand_right.image_alpha + hand_fade_speed, 1);

        if ((!instance_exists(hand_left)  || hand_left.image_alpha  >= 1) &&
            (!instance_exists(hand_right) || hand_right.image_alpha >= 1))
        {
            audio_play_sound(snd_impact, 5, false);
            timer = 0;
            phase = "tear";
        }
    break;

    case "tear":
        timer++;

        // hide the box the instant the pull starts — the sequencer still
        // owns the real instance and will close/destroy it normally once
        // this whole attack ends, so we only ever touch its visibility
        if (timer == 1 && instance_exists(obj_battlebox)) obj_battlebox.visible = false;

        if (instance_exists(hand_left))  hand_left.x  -= 6;
        if (instance_exists(hand_right)) hand_right.x += 6;

        if (timer >= tear_duration)
        {
            if (instance_exists(hand_left))  instance_destroy(hand_left);
            if (instance_exists(hand_right)) instance_destroy(hand_right);
            phase = "dark_in";
        }
    break;

    case "dark_in":
        if (instance_exists(obj_lighting))
        {
            prev_darkness_left  = obj_lighting.darkness_target_left;
            prev_darkness_right = obj_lighting.darkness_target_right;
            obj_lighting.darkness_target_left  = 1;
            obj_lighting.darkness_target_right = 1;
            dark_active = true;
        }

        // a light that just follows the soul, so it's the only thing
        // still visible once the darkness fully settles in
        if (instance_exists(obj_soul))
        {
            light_inst = instance_create_depth(obj_soul.x, obj_soul.y, 0, obj_light_source, { light_on: true, light_radius: 140 });
        }

        phase = "guns";
    break;

    case "guns":
        if (instance_exists(light_inst) && instance_exists(obj_soul))
        {
            light_inst.x = obj_soul.x;
            light_inst.y = obj_soul.y;
        }

        if (!guns_spawned)
        {
            guns_spawned = true;
            for (var i = 0; i < array_length(gun_corners); i++)
            {
                instance_create_depth(0, 0, -380, obj_friend_hand_gun, { side: gun_corners[i] });
            }
        }

        if (!rock_started)
        {
            rock_delay--;
            if (rock_delay <= 0)
            {
                rock_started = true;
                rock_inst = instance_create_depth(0, 0, -380, obj_friend_attack_rock_solo, { duration: total_dark_frames - dark_timer });
            }
        }

        dark_timer++;
        if (dark_timer >= total_dark_frames)
        {
            with (obj_friend_hand_gun) instance_destroy();
            with (obj_friend_bullet)   instance_destroy();
            with (obj_friend_shrapnel) instance_destroy();
            if (instance_exists(rock_inst)) instance_destroy(rock_inst);

            phase = "dark_out";
        }
    break;

    case "dark_out":
        if (instance_exists(light_inst)) instance_destroy(light_inst);
        if (instance_exists(obj_soul))   instance_destroy(obj_soul);
        if (instance_exists(obj_battlebox)) obj_battlebox.visible = true;

        if (instance_exists(obj_lighting))
        {
            obj_lighting.darkness_target_left  = prev_darkness_left;
            obj_lighting.darkness_target_right = prev_darkness_right;
        }

        phase = "fading_in";
    break;

    case "fading_in":
        // ride obj_lighting's own smooth lerp back down to the ambient
        // level we captured, then this attack is done
        if (!instance_exists(obj_lighting) ||
            (abs(obj_lighting.darkness_alpha_left  - prev_darkness_left)  < 0.01 &&
             abs(obj_lighting.darkness_alpha_right - prev_darkness_right) < 0.01))
        {
            instance_destroy();
        }
    break;
}