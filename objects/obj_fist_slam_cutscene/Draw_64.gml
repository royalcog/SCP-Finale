var _cam = view_camera[0];
var _gui_scale_x = display_get_gui_width() / camera_get_view_width(_cam);
var _gui_scale_y = display_get_gui_height() / camera_get_view_height(_cam);

if (darken_alpha > 0)
{
    draw_set_alpha(darken_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}

if (phase == "rush" || phase == "impact" || phase == "flyoff")
{
    var _gui_x = (fist_room_x - camera_get_view_x(_cam)) * _gui_scale_x;
    var _gui_y = (fist_room_y - camera_get_view_y(_cam)) * _gui_scale_y;
    var _tint = (phase == "rush") ? c_black : c_white; // c_black = silhouette, c_white = normal/untinted
    draw_sprite_ext(fist_sprite, 0, _gui_x, _gui_y, _gui_scale_x, _gui_scale_y, 0, _tint, 1);
}