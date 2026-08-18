if (instance_exists(obj_battlebox))
{
    var _p = scr_room_to_gui(x, y);
    draw_sprite_ext(sprite_index, image_index, _p.x, _p.y, image_xscale * _p.sx, image_yscale * _p.sy, 0, c_white, 1);
}