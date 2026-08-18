if (instance_exists(obj_battlebox) && variable_instance_exists(id, "pre_attack_box_depth"))
{
    obj_battlebox.depth = pre_attack_box_depth;
}
if (instance_exists(obj_friend)) { obj_friend.visible = true; }
with (obj_fist_slam_cutscene) { visible = true; }