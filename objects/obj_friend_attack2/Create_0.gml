phase = "start";
timer = 0;

left_hand = noone;
right_hand = noone;

beat = 0; 
beat_length = 30;
chant_text = "";

match_result = "";
winner_side = ""; 

sub_phase = "";
sub_timer = 0;
punch_repeats = 0;
max_punch_repeats = 0;
punch_side = "left";
chase_hand = noone;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }