var _tip_offset = scr_rotate_point(0, tail_length, angle);
var _tip_x = pivot_x + _tip_offset.x;
var _tip_y = pivot_y + _tip_offset.y;

draw_sprite_ext(sprite_index, image_index, pivot_x, pivot_y, tail_scale, tail_scale, angle, c_white, 1);

if (!instance_exists(obj_battlebox)) exit;

var _pivot_local = scr_world_to_box_local(pivot_x, pivot_y);
var _tip_local = scr_world_to_box_local(_tip_x, _tip_y);
var _interior = scr_get_box_interior();
var _clip = scr_clip_segment_to_box(_pivot_local.x, _pivot_local.y, _tip_local.x, _tip_local.y, _interior.x1, _interior.x2, _interior.y1, _interior.y2);

if (is_undefined(_clip)) exit;

var _color = (color_mode == "blue") ? color_blue : color_orange;

var _start_offset = scr_rotate_point(0, tail_length * _clip.t0, angle);
var _end_offset = scr_rotate_point(0, tail_length * _clip.t1, angle);

var _seg_x0 = pivot_x + _start_offset.x;
var _seg_y0 = pivot_y + _start_offset.y;
var _seg_x1 = pivot_x + _end_offset.x;
var _seg_y1 = pivot_y + _end_offset.y;

draw_set_alpha(0.75);
draw_set_color(_color);
draw_line_width(_seg_x0, _seg_y0, _seg_x1, _seg_y1, tail_half_width * 2);
draw_set_alpha(1);
draw_set_color(c_white);