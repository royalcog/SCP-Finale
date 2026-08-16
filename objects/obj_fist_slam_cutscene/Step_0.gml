switch (phase)
{
    case "darken":
        darken_alpha += darken_speed;
        if (darken_alpha >= 1)
        {
            darken_alpha = 1;
            phase = "rush";

            var _cam = view_camera[0];
            var _vx = camera_get_view_x(_cam);
            var _vw = camera_get_view_width(_cam);

            fist_room_x = _vx + _vw + spawn_margin; // right edge of the screen
            fist_room_y = target_inst.y + fist_y_offset;
            fist_start_x = fist_room_x;
            fist_slow_x = target_inst.x + ((fist_start_x - target_inst.x) / 2);

            image_xscale = -1; // sprite faces right by default — flip to face the punch direction (left)

            if (instance_exists(target_inst))
            {
                target_inst.visible = false; // we draw a white silhouette copy of it ourselves below
            }
        }
    break;

    case "rush":
	    var _speed = (fist_room_x > fist_slow_x) ? fast_speed : slow_speed;
	    fist_room_x -= _speed;

	    if (fist_room_x <= target_inst.x + hit_offset)
	    {
	        fist_room_x = target_inst.x + hit_offset;
	        phase = "impact";
	        audio_stop_all();
	        audio_play_sound(snd_impact, 1, false);

	        knockback_dir = point_direction(fist_start_x, fist_room_y, target_inst.x, target_inst.y);
	        knockback_speed = knockback_max;

	        if (instance_exists(target_inst))
	        {
	            target_inst.visible = true;
	        }
	        if (instance_exists(obj_mewmew))
	        {
	            obj_mewmew.sprite_index = spr_mewmew_shocked_backwards_corrupted;
	        }
	    }
	break;

    case "impact":
        darken_alpha -= darken_speed * 2;
        if (darken_alpha < 0) darken_alpha = 0;

        if (instance_exists(target_inst))
        {
            target_inst.x += lengthdir_x(knockback_speed, knockback_dir);
            target_inst.y += lengthdir_y(knockback_speed, knockback_dir);
        }
        knockback_speed -= knockback_friction;
        if (knockback_speed < 0) knockback_speed = 0;

        if (knockback_speed <= 0)
        {
            phase = "hold";
            punch_complete = true;
        }
    break;

    case "hold":
        // fist stays right where it landed, normal colors, waiting for a later
        // step to move it into place as Friend's hand and duplicate it
    break;
}

// tracks the knight leaving the screen, regardless of impact/hold phase, to time the explosion
if ((phase == "impact" || phase == "hold") && instance_exists(target_inst) && !explosion_played)
{
    var _cam = view_camera[0];
    var _onscreen = (target_inst.x > camera_get_view_x(_cam) - 50
        && target_inst.x < camera_get_view_x(_cam) + camera_get_view_width(_cam) + 50);

    if (!_onscreen)
    {
        offscreen_timer++;
        if (offscreen_timer >= offscreen_wait)
        {
            audio_play_sound(snd_explosion, 1, false);
            explosion_played = true;
        }
    }
}