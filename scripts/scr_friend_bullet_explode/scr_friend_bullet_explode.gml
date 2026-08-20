function scr_friend_bullet_explode(_bullet)
{
    var _count = _bullet.shrapnel_count;
    for (var _i = 0; _i < _count; _i++)
    {
        var _dir = (360 / _count) * _i;
        instance_create_depth(_bullet.x, _bullet.y, -375, obj_friend_shrapnel, {
            move_dir: _dir,
            move_speed: _bullet.shrapnel_speed,
            lifespan: _bullet.shrapnel_lifespan
        });
    }
}