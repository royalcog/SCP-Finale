if (phase == "gap") exit;

var _tip_offset = scr_rotate_point(0, tail_length, angle);
var _tip_x = pivot_x + _tip_offset.x;
var _tip_y = pivot_y + _tip_offset.y;

var _color = (color_mode == "blue") ? color_blue : color_orange;

if (!instance_exists(obj_battlebox))
{
    draw_sprite_ext(sprite_index, image_index, pivot_x, pivot_y, tail_scale, tail_scale, angle, c_white, 1);
    exit;
}

var _pivot_local = scr_world_to_box_local(pivot_x, pivot_y);
var _tip_local = scr_world_to_box_local(_tip_x, _tip_y);
var _interior = scr_get_box_interior();
var _clip = scr_clip_segment_to_box(_pivot_local.x, _pivot_local.y, _tip_local.x, _tip_local.y, _interior.x1, _interior.x2, _interior.y1, _interior.y2);

if (is_undefined(_clip))
{
    draw_sprite_ext(sprite_index, image_index, pivot_x, pivot_y, tail_scale, tail_scale, angle, c_white, 1);
    exit;
}

var _t0 = _clip.t0;
var _t1 = _clip.t1;

if (_t0 > 0)
{
    var _seg_offset = scr_rotate_point(0, tail_raw_height * _t0 * tail_scale, angle);
    var _seg_x = pivot_x + _seg_offset.x;
    var _seg_y = pivot_y + _seg_offset.y;
    draw_sprite_general(sprite_index, image_index, 0, 0, tail_raw_width, tail_raw_height * _t0, _seg_x, _seg_y, tail_scale, tail_scale, angle, c_white, c_white, c_white, c_white, 1);
}

var _mid_offset = scr_rotate_point(0, tail_raw_height * _t0 * tail_scale, angle);
var _mid_x = pivot_x + _mid_offset.x;
var _mid_y = pivot_y + _mid_offset.y;
draw_sprite_general(sprite_index, image_index, 0, tail_raw_height * _t0, tail_raw_width, tail_raw_height * (_t1 - _t0), _mid_x, _mid_y, tail_scale, tail_scale, angle, _color, _color, _color, _color, 1);

if (_t1 < 1)
{
    var _end_offset = scr_rotate_point(0, tail_raw_height * _t1 * tail_scale, angle);
    var _end_x = pivot_x + _end_offset.x;
    var _end_y = pivot_y + _end_offset.y;
    draw_sprite_general(sprite_index, image_index, 0, tail_raw_height * _t1, tail_raw_width, tail_raw_height * (1 - _t1), _end_x, _end_y, tail_scale, tail_scale, angle, c_white, c_white, c_white, c_white, 1);
}