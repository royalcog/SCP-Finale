var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

if (!surface_exists(light_surface))
{
    light_surface = surface_create(_gui_w, _gui_h);
}

surface_set_target(light_surface);

// CRITICAL FIX: Clear surface every frame so alpha rendering works properly
draw_clear_alpha(c_black, 0);

var _mid_x = _gui_w / 2;

// Draw left darkness
if (darkness_alpha_left > 0)
{
    draw_set_alpha(darkness_alpha_left);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _mid_x, _gui_h, false);
}

// Draw right darkness
if (darkness_alpha_right > 0)
{
    draw_set_alpha(darkness_alpha_right);
    draw_set_color(c_black);
    draw_rectangle(_mid_x, 0, _gui_w, _gui_h, false);
}

draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _scale_x = _gui_w / _vw;
var _scale_y = _gui_h / camera_get_view_height(view_camera[0]);

// Draw light source cutouts
for (var i = 0; i < array_length(lights); i++)
{
    var _l = lights[i];
    var _lx = (_l.x - _vx) * _scale_x;
    var _ly = (_l.y - _vy) * _scale_y;
    var _r = _l.radius * _scale_x;

    var _steps = 16;
    for (var j = _steps; j > 0; j--)
    {
        var _t = j / _steps;
        draw_set_alpha(power(1 - _t, 2) * _l.strength);
        draw_circle(_lx, _ly, _r * _t, false);
    }
}

// Full-brightness cutouts for battlebox, UI, and hammers
if (instance_exists(obj_battlebox))
{
    with (obj_battlebox)
    {
        var _sx = (x - _vx) * _scale_x;
        var _sy = (y - _vy) * _scale_y;
        draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
    }
}

with (obj_hammer)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

if (variable_global_exists("fight_attack_active") && global.fight_attack_active)
{
    if (instance_exists(obj_UI))
    {
        with (obj_UI)
        {
            var _sx = (x - _vx) * _scale_x;
            var _sy = (y - _vy) * _scale_y;
            draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
        }
    }
}

with (obj_giant_hammer)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

with (obj_falling_hammer)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

with (obj_soj_hit_hammer)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

with (obj_gavel_hammer)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

with (obj_bar_int)
{
    var _sx = (x - _vx) * _scale_x;
    var _sy = (y - _vy) * _scale_y;
    draw_sprite_ext(sprite_index, image_index, _sx, _sy, image_xscale * _scale_x, image_yscale * _scale_y, image_angle, c_white, 1);
}

// Reset settings
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
surface_reset_target();

// Draw surface over the GUI layer
draw_surface(light_surface, 0, 0);