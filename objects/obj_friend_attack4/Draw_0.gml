// draw a solid colored bar instead of tinting the sprite — the tail's
// actual artwork is essentially black, and GameMaker's sprite tinting is
// MULTIPLICATIVE (result = texture_color * tint_color). Multiplying black
// (~0,0,0) by any tint still gives black, so no color could ever show up
// this way, no matter how the drawing/masking around it was structured.
// A plain primitive line just draws pure color directly, so it can't
// have that problem — trading the actual tail artwork for a guaranteed,
// unambiguous color indicator.
var _color = (color_mode == "blue") ? color_blue : color_orange;

var _tip_offset = scr_rotate_point(0, tail_length, angle);
var _tip_x = pivot_x + _tip_offset.x;
var _tip_y = pivot_y + _tip_offset.y;

draw_set_color(_color);
draw_set_alpha(1);
draw_line_width(pivot_x, pivot_y, _tip_x, _tip_y, tail_half_width * 2);
draw_set_color(c_white);