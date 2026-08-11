
// Mewmew
if (!instance_exists(obj_mewmew))
{
    instance_create_layer(120, 255, "Instances", obj_mewmew);
}
else
{
    obj_mewmew.x = 120;
    obj_mewmew.y = 255;
}
if (instance_exists(obj_mewmew))
{
	obj_mewmew.ghosted = true;
    obj_mewmew.sprite_index = spr_ghost_shocked;
    obj_mewmew.image_speed = 0;
    obj_mewmew.image_index = 0;
}

// Gerson
if (!instance_exists(obj_gerson))
{
    instance_create_layer(150, 275, "Instances", obj_gerson);
}
else
{
    obj_gerson.x = -75;
    obj_gerson.y = 230;
}
if (instance_exists(obj_gerson))
{
    obj_gerson.sprite_index = spr_gerson_hammer_walkright_lantern;
    obj_gerson.image_speed = 0;
    obj_gerson.image_index = 0;
}

// Jevil
if (!instance_exists(obj_jevil))
{
    instance_create_layer(210, 225, "Instances", obj_jevil);
}
else
{
    obj_jevil.x = 155;
    obj_jevil.y = 225;
}
if (instance_exists(obj_jevil))
{
    obj_jevil.sprite_index = spr_jevil_right;
    obj_jevil.image_speed = 0;
    obj_jevil.image_index = 0;
}

// Spamton
if (!instance_exists(obj_spamton))
{
    instance_create_layer(358, 210, "Instances", obj_spamton);
}
else
{
    obj_spamton.x = -75;
    obj_spamton.y = 230;
}
if (instance_exists(obj_spamton))
{
    obj_spamton.sprite_index = spr_spamtonhands_right;
    obj_spamton.image_speed = 0;
    obj_spamton.image_index = 0;
}


// Friend
if (!instance_exists(obj_friend))
{
    instance_create_layer(800, 245, "Instances", obj_friend);
}
else
{
    obj_friend.x = -75;
    obj_friend.y = 230;
}
if (instance_exists(obj_friend))
{
    obj_friend.sprite_index = spr_friend_lookleft_tall;
    obj_friend.image_speed = 0;
    obj_friend.image_index = 0;
	obj_friend.image_xscale = 2;
	obj_friend.image_yscale = 2;
}