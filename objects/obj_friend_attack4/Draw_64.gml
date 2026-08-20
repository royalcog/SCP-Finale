// the tail, drawn plain — this is what shows everywhere outside the box,
// and gets covered by the tinted version wherever it's actually inside it
draw_sprite_ext(sprite_index, image_index, pivot_x, pivot_y, tail_scale, tail_scale, angle, c_white, 1);

if (!instance_exists(obj_battlebox)) exit;

var _surf_size = ceil(tail_length * 2 + 60);
if (!surface_exists(mask_surface))
{
    mask_surface = surface_create(_surf_size, _surf_size);
}

var _surf_cx = _surf_size / 2;
var _surf_cy = _surf_size / 2;

surface_set_target(mask_surface);
draw_clear_alpha(c_black, 0);

// stamp the box's own rotated interior rectangle onto this small local
// surface, positioned the same way it sits relative to the pivot in the
// real world -- this becomes our mask
var _interior = scr_get_box_interior();
var _c1 = scr_box_local_to_world(_interior.x1, _interior.y1);
var _c2 = scr_box_local_to_world(_interior.x2, _interior.y1);
var _c3 = scr_box_local_to_world(_interior.x2, _interior.y2);
var _c4 = scr_box_local_to_world(_interior.x1, _interior.y2);

draw_set_color(c_white);
draw_primitive_begin(pr_trianglefan);
draw_vertex(_surf_cx + (_c1.x - pivot_x), _surf_cy + (_c1.y - pivot_y));
draw_vertex(_surf_cx + (_c2.x - pivot_x), _surf_cy + (_c2.y - pivot_y));
draw_vertex(_surf_cx + (_c3.x - pivot_x), _surf_cy + (_c3.y - pivot_y));
draw_vertex(_surf_cx + (_c4.x - pivot_x), _surf_cy + (_c4.y - pivot_y));
draw_primitive_end();

// draw the TINTED tail on top, but only keep the parts that land where
// the mask already has alpha (i.e. only inside the box) -- a standard
// alpha-mask trick: draw wherever the destination already has alpha,
// discard everywhere else
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
var _color = (color_mode == "blue") ? color_blue : color_orange;
draw_sprite_ext(sprite_index, image_index, _surf_cx, _surf_cy, tail_scale, tail_scale, angle, _color, 1);
gpu_set_blendmode(bm_normal);

surface_reset_target();

// composite that masked-and-tinted result on top of the plain tail
// already drawn, at the correct world position
draw_surface(mask_surface, pivot_x - _surf_cx, pivot_y - _surf_cy);