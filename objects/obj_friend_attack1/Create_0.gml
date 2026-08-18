phase = "start";
timer = 0;
repeat_count = 0;
max_repeats = 4;
gap_timer = 60;

// pull the box to the very front of everything for the duration of the attack
if (instance_exists(obj_battlebox))
{
    pre_attack_box_depth = obj_battlebox.depth;
    obj_battlebox.depth = -5000; // attack effects use -5010, so they stay on top of this
}
if (instance_exists(obj_friend)) { obj_friend.visible = false; }
with (obj_fist_slam_cutscene) { visible = false; }