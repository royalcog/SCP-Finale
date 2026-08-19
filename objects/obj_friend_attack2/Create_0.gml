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

if (instance_exists(obj_friend)) { obj_friend.visible = false; }