phase = "grab";
timer = 0;

hand_left = noone;
hand_right = noone;
hand_fade_speed = 0.04;

tear_duration = 40; // frames the hands spend visibly pulling apart

light_inst = noone;
dark_active = false;
prev_darkness_left = 0;
prev_darkness_right = 0;

gun_corners = ["top_left", "top_right", "bottom_left", "bottom_right"];
guns_spawned = false;

rock_delay = 90; // ~1.5s before the rock attack joins in
rock_started = false;
rock_inst = noone;

total_dark_frames = 900; // ~15s — a few seconds past a full guns-only pass
dark_timer = 0;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }

hand_left  = instance_create_depth(0, 0, -380, obj_rotate_hand, { side: "left"  });
hand_right = instance_create_depth(0, 0, -380, obj_rotate_hand, { side: "right" });