obj_kris.face = RIGHT;
obj_kris.image_speed = 0;

// Mewmew
if (!instance_exists(obj_mewmew))
{
    instance_create_layer(560, 190, "Instances", obj_mewmew);
}

if (instance_exists(obj_mewmew))
{
    obj_mewmew.sprite_index = spr_ghost_shocked_backwards_left;
    obj_mewmew.image_speed = 0;
    obj_mewmew.image_index = 1;
}

// MewmewCorrupt
if (instance_exists(obj_othermewmew))
{
	obj_othermewmew.visible = true;
	obj_othermewmew.ghosted = false;
}

// Gerson
if (!instance_exists(obj_gerson))
{
    instance_create_layer(780, 180, "Instances", obj_gerson);
}

if (instance_exists(obj_gerson))
{
    obj_gerson.sprite_index = spr_gerson_hammer_idle_lantern_closed_eyes_left;
    obj_gerson.image_speed = 0;
    obj_gerson.image_index = 0;
}

// Jevil
if (!instance_exists(obj_jevil))
{
    instance_create_layer(640, 100, "Instances", obj_jevil);
}

if (instance_exists(obj_jevil))
{
    obj_jevil.sprite_index = spr_jevil_tired;
    obj_jevil.image_speed = 0;
    obj_jevil.image_index = 1;
}

// Spamton
if (!instance_exists(obj_spamton))
{
    instance_create_layer(800, 80, "Instances", obj_spamton);
}

if (instance_exists(obj_spamton))
{
    obj_spamton.sprite_index = spr_spamton_tired_glassedover;
    obj_spamton.image_speed = 0;
    obj_spamton.image_index = 0;
}