// --- Mewmew ---
var _mew = instance_exists(obj_mewmew) ? obj_mewmew : instance_create_layer(470, 120, "Instances", obj_mewmew);
with (_mew)
{
    x = 470;
    y = 120;
    sprite_index = spr_invischaracter;
    image_speed = 0;
    image_index = 0;
    depth = -100; // Explicit negative depth to ensure visibility on top of backgrounds
}

// --- Gerson ---
var _ger = instance_exists(obj_gerson) ? obj_gerson : instance_create_layer(320, 100, "Instances", obj_gerson);
with (_ger)
{
    x = 320;
    y = 100;
    sprite_index = spr_invischaracter;
    image_speed = 0;
    image_index = 0;
    depth = -100;
}