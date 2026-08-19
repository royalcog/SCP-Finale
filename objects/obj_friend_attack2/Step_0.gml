switch (phase)
{
    case "start":
        var _interior = scr_get_box_interior();
        var _cy = lerp(_interior.y1, _interior.y2, 0.5);
        
        if (!instance_exists(left_hand)) {
            left_hand = instance_create_depth(_interior.x1 - 250, _cy, -380, obj_rps_hand, { side: "left" });
        }
        if (!instance_exists(right_hand)) {
            right_hand = instance_create_depth(_interior.x2 + 250, _cy, -380, obj_rps_hand, { side: "right" });
        }
        
        left_hand.sprite_index = spr_friend_hand_rock;
        right_hand.sprite_index = spr_friend_hand_rock;
        
        beat = 0;
        chant_text = "ROCK";
        audio_play_sound(snd_select, 5, false);
        left_hand.bouncing = true; 
        right_hand.bouncing = true;
        
        timer = beat_length;
        phase = "chanting";
    break;

    case "chanting":
        timer--;
        if (timer <= 0)
        {
            timer = beat_length; 
            beat++;
            
            if (beat == 1) {
                chant_text = "PAPER";
                audio_play_sound(snd_select, 5, false);
                left_hand.bouncing = true; right_hand.bouncing = true;
            } else if (beat == 2) {
                chant_text = "SCISSORS";
                audio_play_sound(snd_select, 5, false);
                left_hand.bouncing = true; right_hand.bouncing = true;
            } else if (beat == 3) {
                chant_text = "SHOOT!";
                audio_play_sound(snd_select, 5, false);
                left_hand.bouncing = false;
                right_hand.bouncing = false;
                phase = "reveal"; 
                timer = beat_length;
            }
        }
    break;

    case "reveal":
        timer--;
        if (timer <= 0)
        {
            var _choices = ["rock", "paper", "scissors"];
            var _left_choice = _choices[irandom(2)];
            var _right_choice = _choices[irandom(2)];
            
            switch (_left_choice) {
                case "rock":     left_hand.sprite_index = spr_friend_hand_rock; break;
                case "paper":    left_hand.sprite_index = spr_friend_hand_paper; break;
                case "scissors": left_hand.sprite_index = spr_friend_hand_scissors; break;
            }
            
            switch (_right_choice) {
                case "rock":     right_hand.sprite_index = spr_friend_hand_rock; break;
                case "paper":    right_hand.sprite_index = spr_friend_hand_paper; break;
                case "scissors": right_hand.sprite_index = spr_friend_hand_scissors; break;
            }
            
            if (_left_choice == _right_choice)
            {
                audio_play_sound(snd_error, 5, false);
                phase = "tie_wait";
                timer = 60;
            }
            else
            {
                var _left_wins = ((_left_choice == "rock" && _right_choice == "scissors") || 
                                  (_left_choice == "paper" && _right_choice == "rock") || 
                                  (_left_choice == "scissors" && _right_choice == "paper"));
                
                if (_left_wins) {
                    match_result = _left_choice;
                    winner_side = "left";
                } else {
                    match_result = _right_choice;
                    winner_side = "right";
                }
                
                audio_play_sound(snd_won, 5, false);
                phase = "transition";
                timer = 60;
            }
        }
    break;

    case "tie_wait":
        timer--;
        if (timer <= 0) {
            phase = "start";
        }
    break;

    case "transition":
        timer--;
        if (timer <= 0) {
            chant_text = "";
            sub_phase = "";
            phase = "attack_" + match_result;
        }
    break;

    case "attack_rock":
        switch (sub_phase)
        {
            case "":
                if (instance_exists(left_hand))  instance_destroy(left_hand);
                if (instance_exists(right_hand)) instance_destroy(right_hand);

                instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: "vertical", position_frac: 0.5 });
                sub_timer = 10 * 4 + 8 * 4 + 5;
                sub_phase = "waiting_flash";
            break;

            case "waiting_flash":
                sub_timer--;
                if (sub_timer <= 0 && instance_number(obj_strip_flash) == 0)
                {
                    if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_x = 0.18;

                    var _l = instance_create_depth(0, 0, -380, obj_rps_squeeze_hand, { side: "left" });
                    _l.sprite_index = spr_friend_hand_rock;
                    var _r = instance_create_depth(0, 0, -380, obj_rps_squeeze_hand, { side: "right" });
                    _r.sprite_index = spr_friend_hand_rock;
                    sub_phase = "squeezing";
                }
            break;

            case "squeezing":
                if (instance_number(obj_rps_squeeze_hand) == 0 && scr_box_scale_settled())
                {
                    if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_x = 1;
                    instance_destroy();
                }
            break;
        }
    break;

    case "attack_scissors":
        switch (sub_phase)
        {
            case "":
            {
                var _loser  = (winner_side == "left") ? right_hand : left_hand;
                var _winner = (winner_side == "left") ? left_hand  : right_hand;

                if (instance_exists(_loser)) instance_destroy(_loser);

                if (instance_exists(_winner))
                {
                    _winner.sprite_index = spr_friend_hand_scissors;
                    _winner.image_speed = 1;
                    _winner.bouncing = false;
                    _winner.chasing = true;
                }

                chase_hand = _winner;

                punch_repeats = 0;
                max_punch_repeats = 5;
                sub_timer = 45;
                sub_phase = "chase_and_punch";
            }
            break;

            case "chase_and_punch":
                if (instance_exists(chase_hand) && instance_exists(obj_soul))
                {
                    with (chase_hand)
                    {
                        var _dir = point_direction(x, y, obj_soul.x, obj_soul.y);
                        x += lengthdir_x(4, _dir);
                        y += lengthdir_y(4, _dir);
                        draw_angle = _dir;

                        if (place_meeting(x, y, obj_soul))
                        {
                            scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
                        }
                    }
                }

                sub_timer--;
                if (sub_timer <= 0 && instance_number(obj_friend_hand_punch) == 0)
                {
                    var _interior = scr_get_box_interior();
                    var _orientation = choose("vertical", "horizontal");
                    var _frac = random_range(0.1, 0.9);
                    var _side_pool = (_orientation == "vertical") ? ["up", "down"] : ["left", "right"];
                    var _side = _side_pool[irandom(1)];
                    var _perp = (_orientation == "vertical")
                        ? lerp(_interior.x1, _interior.x2, _frac)
                        : lerp(_interior.y1, _interior.y2, _frac);

                    instance_create_depth(0, 0, -380, obj_friend_hand_punch, { side: _side, fixed_coord: _perp });

                    punch_repeats++;
                    sub_timer = 45;

                    if (punch_repeats >= max_punch_repeats)
                    {
                        sub_phase = "finishing";
                    }
                }
            break;

            case "finishing":
                if (instance_number(obj_friend_hand_punch) == 0)
                {
                    instance_destroy();
                }
            break;
        }
    break;

    case "attack_paper":
        switch (sub_phase)
        {
            case "":
                if (instance_exists(left_hand))  instance_destroy(left_hand);
                if (instance_exists(right_hand)) instance_destroy(right_hand);

                instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: "horizontal", position_frac: 0.5 });
                sub_timer = 10 * 4 + 8 * 4 + 5;
                sub_phase = "waiting_flash";
            break;

            case "waiting_flash":
                sub_timer--;
                if (sub_timer <= 0 && instance_number(obj_strip_flash) == 0)
                {
                    if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_y = 0.22;

                    var _u = instance_create_depth(0, 0, -380, obj_rps_squeeze_hand, { side: "up" });
                    _u.sprite_index = spr_friend_hand_paper;
                    var _d = instance_create_depth(0, 0, -380, obj_rps_squeeze_hand, { side: "down" });
                    _d.sprite_index = spr_friend_hand_paper;
                    sub_phase = "flattening";
                }
            break;

            case "flattening":
                if (instance_number(obj_rps_squeeze_hand) == 0 && scr_box_scale_settled())
                {
                    punch_repeats = 0;
                    max_punch_repeats = 6;
                    sub_timer = 20;
                    sub_phase = "punch_gap";
                }
            break;

            case "punch_gap":
                sub_timer--;
                if (sub_timer <= 0)
                {
                    punch_side = choose("left", "right");
                    instance_create_depth(0, 0, -390, obj_paper_shockwave, { side: punch_side });
                    sub_timer = 10;
                    sub_phase = "punch_hand_delay";
                }
            break;

            case "punch_hand_delay":
                sub_timer--;
                if (sub_timer <= 0)
                {
                    var _jab = instance_create_depth(0, 0, -380, obj_rps_squeeze_hand, { side: punch_side, gap_half: 120, hold_time: 8 });
                    _jab.sprite_index = spr_friend_hand_paper;
                    sub_phase = "punching";
                }
            break;

            case "punching":
                if (instance_number(obj_rps_squeeze_hand) == 0)
                {
                    punch_repeats++;
                    if (punch_repeats >= max_punch_repeats)
                    {
                        if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_y = 1;
                        instance_destroy();
                    }
                    else
                    {
                        sub_timer = 20;
                        sub_phase = "punch_gap";
                    }
                }
            break;
        }
    break;
}