var _hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
var _vdir = keyboard_check(vk_down) - keyboard_check(vk_up);

x += _hdir * move_speed;
y += _vdir * move_speed;

if (instance_exists(obj_battlebox))
{
    var _bb = obj_battlebox;
    var _soul_margin_x = sprite_width / 2;
    var _soul_margin_y = sprite_height / 2;

    var _box_pad_x = 23;
    var _box_pad_y = 7.5;

    var _min_x = _bb.x + (_box_pad_x * _bb.image_xscale) + _soul_margin_x;
    var _max_x = _bb.x + (_bb.sprite_width * _bb.image_xscale) - (_box_pad_x * _bb.image_xscale) - _soul_margin_x;
    var _min_y = _bb.y + (_box_pad_y * _bb.image_yscale) + _soul_margin_y;
    var _max_y = _bb.y + (_bb.sprite_height * _bb.image_yscale) - (_box_pad_y * _bb.image_yscale) - _soul_margin_y;

    // When the box is squeezed thinner than the soul's own margin (e.g. mid
    // rock/paper squeeze), min can end up greater than max on that axis,
    // which made clamp() lock the soul in place on BOTH axes instead of
    // just restricting movement on the squeezed one.
    if (_min_x > _max_x) { var _mid_x = (_min_x + _max_x) / 2; _min_x = _mid_x; _max_x = _mid_x; }
    if (_min_y > _max_y) { var _mid_y = (_min_y + _max_y) / 2; _min_y = _mid_y; _max_y = _mid_y; }

    var _push_speed = move_speed * 2;
	var _wall_x = clamp(x, _min_x, _max_x);
	var _wall_y = clamp(y, _min_y, _max_y);
	x += clamp(_wall_x - x, -_push_speed, _push_speed);
	y += clamp(_wall_y - y, -_push_speed, _push_speed);
}



if (invulnerable)
{
    invuln_timer--;
    flash_timer--;
    if (flash_timer <= 0)
    {
        flash_visible = !flash_visible;
        flash_timer = flash_interval;
    }

    if (invuln_timer <= 0)
    {
        invulnerable = false;
        flash_visible = true;
    }
}
else
{
    flash_visible = true;
}

image_blend = flash_visible ? c_white : c_red;

if (invulnerable)
{
    show_debug_message("flash_visible: " + string(flash_visible) + " | flash_timer: " + string(flash_timer));
}