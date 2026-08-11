function scr_spawn_battlebox()
{
    var _view_w = camera_get_view_width(view_camera[0]);
    var _view_h = camera_get_view_height(view_camera[0]);

    var _box_x = (_view_w - sprite_get_width(spr_battlebox)) / 2;
    var _box_y = (_view_h * 0.35) - (sprite_get_height(spr_battlebox) / 2) + 50;

    return instance_create_depth(_box_x, _box_y, -200, obj_battlebox);
}