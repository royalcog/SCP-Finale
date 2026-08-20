// tint the WHOLE tail with the current color — simpler and far more
// reliable than trying to recolor just the portion inside the box. That
// approach (surfaces + blend-mode masking) turned out to be a persistent
// source of bugs (wrong draw event category, a masking-order bug leaving
// a solid white box, and possibly a mismatch between the displayed color
// and the actual color_mode used for hit detection) that were hard to
// verify without live testing. This guarantees what you see always
// matches what's actually being checked for damage.
var _color = (color_mode == "blue") ? color_blue : color_orange;
draw_sprite_ext(sprite_index, image_index, pivot_x, pivot_y, tail_scale, tail_scale, angle, _color, 1);