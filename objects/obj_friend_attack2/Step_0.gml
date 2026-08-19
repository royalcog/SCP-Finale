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
	                sub_phase = "shrinking";
	            }
	        break;

	        case "shrinking":
	            if (scr_box_scale_settled())
	            {
	                punch_repeats = 0;
	                max_punch_repeats = 6;
	                sub_timer = 15;
	                sub_phase = "bar_gap";
	            }
	        break;

	        case "bar_gap":
	            sub_timer--;
	            if (sub_timer <= 0)
	            {
	                punch_side = choose("left", "right");
	                rock_bar_frac = random_range(0.15, 0.85);

	                // horizontal bar telegraphs the row the fist is about to punch through
	                instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: "horizontal", position_frac: rock_bar_frac, blinks: 2 });
	                sub_phase = "bar_wait";
	            }
	        break;

	        case "bar_wait":
	            if (instance_number(obj_strip_flash) == 0)
	            {
	                var _interior = scr_get_box_interior();
	                var _perp = lerp(_interior.y1, _interior.y2, rock_bar_frac);
	                var _p = instance_create_depth(0, 0, -380, obj_friend_hand_punch, { side: punch_side, fixed_coord: _perp });
	                _p.sprite_index = spr_friend_hand_rock;
	                sub_phase = "bar_punching";
	            }
	        break;

	        case "bar_punching":
	            if (instance_number(obj_friend_hand_punch) == 0)
	            {
	                punch_repeats++;
	                if (punch_repeats >= max_punch_repeats)
	                {
	                    if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_x = 1;
	                    sub_phase = "unsqueezing";
	                }
	                else
	                {
	                    sub_timer = 15;
	                    sub_phase = "bar_gap";
	                }
	            }
	        break;

	        case "unsqueezing":
	            if (scr_box_scale_settled())
	            {
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
	                _winner.image_index = 0;
	                _winner.image_speed = 1; // plays through all frames of the snip animation
	                _winner.bouncing = false;
	                _winner.chasing = true;
	                _winner.chase_target_scale = 0.8; // shrink down from RPS-reveal size once the attack starts
	            }

	            chase_hand = _winner;

	            punch_repeats = 0;
	            max_punch_repeats = 6;
	            sub_timer = 45;
	            sub_phase = "chase_and_punch";

	            trail_points = [];
	            trail_sample_timer = trail_sample_interval;
	            awaiting_punch = false;
	        }
	        break;

	        case "chase_and_punch":
	            // sample the soul's position periodically to build a trailing path
	            if (instance_exists(obj_soul))
	            {
	                trail_sample_timer--;
	                if (trail_sample_timer <= 0)
	                {
	                    array_push(trail_points, { x: obj_soul.x, y: obj_soul.y });
	                    if (array_length(trail_points) > trail_max_points) array_delete(trail_points, 0, 1);
	                    trail_sample_timer = trail_sample_interval;
	                }
	            }

	            if (instance_exists(chase_hand) && instance_exists(obj_soul))
	            {
	                // follow the recorded trail toward the soul instead of
	                // beelining straight at its current (live) position
	                var _follow_x = obj_soul.x;
	                var _follow_y = obj_soul.y;
	                if (array_length(trail_points) > 0)
	                {
	                    var _lead = trail_points[0];
	                    _follow_x = _lead.x;
	                    _follow_y = _lead.y;

	                    if (point_distance(chase_hand.x, chase_hand.y, _follow_x, _follow_y) < 12)
	                    {
	                        array_delete(trail_points, 0, 1);
	                    }
	                }

	                with (chase_hand)
	                {
	                    var _dir = point_direction(x, y, _follow_x, _follow_y);
	                    x += lengthdir_x(other.chase_speed, _dir);
	                    y += lengthdir_y(other.chase_speed, _dir);
	                    draw_angle = _dir;

	                    if (place_meeting(x, y, obj_soul))
	                    {
	                        scr_soul_take_hit(0, obj_mewmew.damage_color, obj_mewmew.damage_color);
	                    }
	                }
	            }

	            sub_timer--;
	            if (!awaiting_punch && sub_timer <= 0 && instance_number(obj_friend_hand_punch) == 0)
	            {
	                var _interior = scr_get_box_interior();
	                var _orientation = choose("vertical", "horizontal");
	                var _frac = random_range(0.1, 0.9);
	                var _side_pool = (_orientation == "vertical") ? ["up", "down"] : ["left", "right"];
	                var _side = _side_pool[irandom(1)];
	                var _perp = (_orientation == "vertical")
	                    ? lerp(_interior.x1, _interior.x2, _frac)
	                    : lerp(_interior.y1, _interior.y2, _frac);

	                // telegraph where the punch is about to come through, before it fires
	                instance_create_depth(0, 0, -390, obj_strip_flash, { orientation: _orientation, position_frac: _frac, blinks: 2 });

	                punch_telegraph_side = _side;
	                punch_telegraph_perp = _perp;
	                awaiting_punch = true;
	            }

	            if (awaiting_punch && instance_number(obj_strip_flash) == 0)
	            {
	                instance_create_depth(0, 0, -380, obj_friend_hand_punch, { side: punch_telegraph_side, fixed_coord: punch_telegraph_perp });

	                awaiting_punch = false;
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

			        // full-half indicator appears first, on its own
			        instance_create_depth(0, 0, -390, obj_paper_shockwave, { side: punch_side });
			        sub_phase = "punch_wait_indicator";
			    }
			break;

			case "punch_wait_indicator":
			    // ...and only once it's fully finished telegraphing does the hand come through
			    if (instance_number(obj_paper_shockwave) == 0)
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