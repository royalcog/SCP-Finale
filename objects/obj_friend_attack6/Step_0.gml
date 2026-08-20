switch (phase)
{
    case "dialogue":
        if (!dialogue_started)
        {
            dialogue_started = true;
            dialogue_inst = instance_create_depth(0, 0, 0, obj_dialogue_chain);
            dialogue_inst.batches = [
                [ { speaker: obj_friend, text: "Let's try something different.", keep_animating: true } ]
            ];
        }
        else if (!instance_exists(dialogue_inst))
        {
            phase = "shake";
            scr_camera_shake(shake_intensity, shake_duration);
            timer = shake_duration;
        }
    break;

    case "shake":
        timer--;
        if (timer <= 0)
        {
            phase = "flip";

            camera_set_view_angle(view_camera[0], 180);

            if (instance_exists(obj_mewmew))
            {
                obj_mewmew.sprite_index = spr_mewmew_shocked_backwards_corrupted;
                obj_mewmew.image_index  = 0;
                obj_mewmew.image_speed  = 0;
            }

            timer = flip_hold_timer;
        }
    break;

    case "flip":
        timer--;
        if (timer <= 0)
        {
            phase = "laugh";
            instance_create_depth(0, 0, 0, obj_friend_laugh_attack);
        }
    break;

    case "laugh":
        if (instance_number(obj_friend_laugh_attack) == 0)
        {
            phase = "attack2";
            attack2_inst = instance_create_depth(0, 0, 0, obj_friend_attack2);
        }
    break;

    case "attack2":
        if (!instance_exists(attack2_inst))
        {
            phase = "revert";
        }
    break;

    case "revert":
        camera_set_view_angle(view_camera[0], 0);

        if (instance_exists(obj_mewmew))
        {
            obj_mewmew.sprite_index = spr_mewmew_walkup_corrupted;
            obj_mewmew.image_index  = 0;
            obj_mewmew.image_speed  = 0;
        }

        if (instance_exists(obj_friend)) { obj_friend.visible = true; }

        instance_destroy();
    break;
}