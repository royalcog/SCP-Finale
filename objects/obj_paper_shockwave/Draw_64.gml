if (instance_exists(obj_battlebox))
{
    var _p1 = scr_room_to_gui(min(start_x, pos_x), band_y1);
    var _p2 = scr_room_to_gui(max(start_x, pos_x), band_y2);

    draw_set_alpha(alpha);
    draw_set_color(c_white);
    draw_rectangle(_p1.x, _p1.y, _p2.x, _p2.y, false);
    draw_set_alpha(1);
}