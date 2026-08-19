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
chase_speed = 2.5; // scissors chase speed (was a hardcoded 4 in Step)

// scissors: trailing path the scissors follow to catch the soul, instead
// of instantly homing to its live position every frame
trail_points = [];
trail_sample_timer = 0;
trail_sample_interval = 8;
trail_max_points = 12;

// scissors/rock: telegraph-before-punch bookkeeping
awaiting_punch = false;
punch_telegraph_side = "left";
punch_telegraph_perp = 0;

// rock: which row the current horizontal bar/punch is on
rock_bar_frac = 0.5;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }