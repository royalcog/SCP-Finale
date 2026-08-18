phase = "start";
timer = 0;
repeat_count = 0;
max_repeats = 7;
gap_timer = 60;

if (instance_exists(obj_friend)) { obj_friend.visible = false; }
with (obj_fist_slam_cutscene) { visible = false; }