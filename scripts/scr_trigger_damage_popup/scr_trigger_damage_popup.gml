function scr_trigger_damage_popup(_target, _amount = 0, _color_top = c_white, _color_bottom = c_white)
{
    if (instance_exists(_target))
    {
        audio_play_sound(snd_hurt1, 5, false);

        var _dmg = instance_create_depth(_target.x, _target.y - 20, -300, obj_damage_number);
        _dmg.damage_amount = _amount;
        _dmg.color_top = _color_top;
        _dmg.color_bottom = _color_bottom;

        var _facing = scr_get_facing_dir(_target);
        var _bounce_dir = (_facing != 0) ? -_facing : choose(-1, 1); // opposite of facing, or random if unknown
        _dmg.x_vel = _bounce_dir * 2.5; // tune bounce strength here
    }
}