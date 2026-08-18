if (instance_exists(obj_battlebox))
{
    var _p = scr_room_to_gui(x, y);

    // Because the sprite origin is now perfectly centered, 
    // it will rotate flawlessly without needing offset math.
    draw_sprite_ext(sprite_index, image_index, _p.x, _p.y, image_xscale * _p.sx, image_yscale * _p.sy, image_angle, c_white, 1);
}