phase = "start";
timer = 0;

left_hand = noone;
right_hand = noone;

// Chanting variables
beat = 0; 
beat_length = 30; // Frames between each word (30 = half a second at 60fps)
chant_text = "";

match_result = "";
winner_side = ""; 

// Sub-attack state (rock/paper/scissors)
sub_phase = "";
sub_timer = 0;
punch_repeats = 0;
max_punch_repeats = 0;
chase_hand = noone;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }