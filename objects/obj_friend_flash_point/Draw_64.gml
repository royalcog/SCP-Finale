if (instance_exists(obj_battlebox))
{
    var _p = scr_room_to_gui(world_x, world_y);
    var _half = (size * _p.sx) / 2;

    draw_set_alpha(alpha * 0.6);
    draw_set_color(c_red);
    draw_rectangle(_p.x - _half, _p.y - _half, _p.x + _half, _p.y + _half, false);
    draw_set_alpha(1);
}