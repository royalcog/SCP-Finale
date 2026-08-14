mode = "directional"; // "directional", "arc", or "straight"

start_x = x;
start_y = y;
target_inst = noone;
target_x = x;
target_y = y;

move_speed = 8;
dir_x = 0;
dir_y = 0;

travel_time = 40;
timer = 0;
arc_height = 100;

animate = true;
spin_speed = 14;
hit_radius = 16;

damage_amount = 0;
color_top = c_white;
color_bottom = c_white;
impact_sound = noone;

after_obj = noone;
after_sprite = -1;
after_at = "target";

travel_sound = noone;
travel_sound_gap = 30;
travel_sound_timer = 0;