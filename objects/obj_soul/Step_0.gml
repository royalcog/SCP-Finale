var _hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
var _vdir = keyboard_check(vk_down) - keyboard_check(vk_up);

x += _hdir * move_speed;
y += _vdir * move_speed;

// clamp inside the battlebox bounds
if (instance_exists(obj_battlebox))
{
    var _bb = obj_battlebox;
    var _soul_margin_x = sprite_width / 2;
    var _soul_margin_y = sprite_height / 2;

    // tune these two independently to match the VISIBLE box, not the sprite canvas
    var _box_pad_x = 23; // try adjusting this until horizontal clamp feels right
    var _box_pad_y = 7.5;

    var _min_x = _bb.x + _box_pad_x + _soul_margin_x;
    var _max_x = _bb.x + _bb.sprite_width - _box_pad_x - _soul_margin_x;
    var _min_y = _bb.y + _box_pad_y + _soul_margin_y;
    var _max_y = _bb.y + _bb.sprite_height - _box_pad_y - _soul_margin_y;

    x = clamp(x, _min_x, _max_x);
    y = clamp(y, _min_y, _max_y);
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