depth = -99999;
target_inst = noone; // set right after creation — the object getting punched

fist_sprite = spr_friend_hand_rock;

phase = "darken";

darken_alpha = 0;
darken_speed = 0.08;

fist_room_x = 0;
fist_room_y = 0;
fist_start_x = 0;
fist_slow_x = 0;

fast_speed = 24;
slow_speed = 5;
normal_speed = 14; // speed after impact, flying off screen

spawn_margin = 60;      // how far past the right edge it spawns from
offscreen_margin = 100; // how far past the left edge before it's considered gone

knockback_speed = 0;
knockback_max = 18;
knockback_dir = 0;
knockback_friction = 0.3;