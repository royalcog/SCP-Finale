var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _view_w = camera_get_view_width(view_camera[0]);
var _view_h = camera_get_view_height(view_camera[0]);
var _scale_x = _gui_w / _view_w;
var _scale_y = _gui_h / _view_h;

var _sx = (x - _vx) * _scale_x;
var _sy = (y - _vy) * _scale_y;
draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);