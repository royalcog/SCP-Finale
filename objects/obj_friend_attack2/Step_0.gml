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
        
        // Reset sprites to Rock
        left_hand.sprite_index = spr_friend_hand_rock;
        right_hand.sprite_index = spr_friend_hand_rock;
        
        beat = 0;
        chant_text = "ROCK"; // Show Rock immediately!
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
                left_hand.bouncing = true; right_hand.bouncing = true;
            } else if (beat == 2) {
                chant_text = "SCISSORS";
                left_hand.bouncing = true; right_hand.bouncing = true;
            } else if (beat == 3) {
                chant_text = "SHOOT!";
                phase = "reveal"; 
                timer = 15; // Brief pause on "SHOOT!" before revealing
            }
        }
    break;

    case "reveal":
        timer--;
        if (timer <= 0) // Small pause so "SHOOT!" lingers for a split second
        {
            var _choices = ["rock", "paper", "scissors"];
            var _left_choice = _choices[irandom(2)];
            var _right_choice = _choices[irandom(2)];
            
            // FIX: Using a switch statement so GameMaker knows these sprites are actively used!
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
            
            // Evaluate Win/Loss/Tie
            if (_left_choice == _right_choice)
            {
                phase = "tie_wait";
                timer = 60; // Wait 1 second on the tie before looping back
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
                
                phase = "transition";
                timer = 60; // Show winning hands for 1 second before attacking
            }
        }
    break;

    case "tie_wait":
        timer--;
        if (timer <= 0) {
            phase = "start"; // Loop back to the beginning!
        }
    break;

    case "transition":
        timer--;
        if (timer <= 0) {
            chant_text = ""; // Clear text
            phase = "attack_" + match_result; // Begin the actual attack
        }
    break;

    // We will build these next!
    case "attack_rock": break;
    case "attack_paper": break;
    case "attack_scissors": break;
}