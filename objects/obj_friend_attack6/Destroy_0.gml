// safety net in case this attack instance is ever destroyed mid-sequence —
// make sure the screen isn't left flipped, Pink isn't stuck scared-backwards,
// and Friend is visible again
camera_set_view_angle(view_camera[0], 0);

if (instance_exists(obj_mewmew))
{
    obj_mewmew.sprite_index = spr_mewmew_walkup_corrupted;
}

if (instance_exists(obj_friend)) { obj_friend.visible = true; }