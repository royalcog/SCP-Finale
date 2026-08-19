if (instance_exists(obj_battlebox))
{
    var _p = scr_room_to_gui(x, y);
    // Remember to center your sprite origins (Middle Centre) to avoid offset math!
    draw_sprite_ext(sprite_index, 0, _p.x, _p.y, image_xscale * _p.sx, image_yscale * _p.sy, draw_angle, c_white, 1);
}