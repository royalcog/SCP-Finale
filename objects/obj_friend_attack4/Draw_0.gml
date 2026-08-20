// spr_friend_tail's actual pixels are opaque black, so ordinary
// image_blend tinting can't recolor it (tinting is multiplicative —
// black * any color is still black). Instead: draw the real sprite into
// a small local surface centered on the pivot, then use a blend-mode
// pass to replace its black pixels with our tint while keeping its
// original alpha shape, then stamp that result onto the screen. Net
// effect: the actual tail artwork, correctly colored, no asset edits.
var _color = (color_mode == "blue") ? color_blue : color_orange;

if (!surface_exists(tail_surf))
{
    tail_surf = surface_create(tail_surf_size, tail_surf_size);
}

var _surf_origin_x = pivot_x - tail_surf_size / 2;
var _surf_origin_y = pivot_y - tail_surf_size / 2;

surface_set_target(tail_surf);
draw_clear_alpha(0, 0);

// draw exactly like a normal draw_sprite_ext call — GameMaker still
// handles the sprite's own origin and rotation automatically, we're just
// drawing into a local window centered on the pivot instead of straight
// to the screen
draw_sprite_ext(
    sprite_index, image_index,
    tail_surf_size / 2, tail_surf_size / 2,
    tail_scale, tail_scale,
    angle,
    c_white, 1
);

// recolor pass: wherever the sprite left alpha behind, replace its
// (black) color with our tint, using that alpha as a mask
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
draw_rectangle_color(0, 0, tail_surf_size, tail_surf_size, _color, _color, _color, _color, false);
gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(tail_surf, _surf_origin_x, _surf_origin_y);