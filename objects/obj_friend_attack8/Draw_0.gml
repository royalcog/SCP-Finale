if (phase == "tear")
{
    var _t = clamp(timer / tear_duration, 0, 1);
    var _split = lerp(0, 220, _t); // how far each half slides outward
    var _fade  = 1 - _t;           // fades out as it finishes separating

    var _half_w = tear_raw_w / 2;

    // left half — left side of the sprite, sliding further left
    draw_sprite_part_ext(
        tear_sprite, tear_image_index,
        0, 0, _half_w, tear_raw_h,
        tear_base_x - _split, tear_base_y,
        tear_xscale, tear_yscale,
        c_white, _fade
    );

    // right half — right side of the sprite, sliding further right
    draw_sprite_part_ext(
        tear_sprite, tear_image_index,
        _half_w, 0, tear_raw_w - _half_w, tear_raw_h,
        tear_base_x + _half_w * tear_xscale + _split, tear_base_y,
        tear_xscale, tear_yscale,
        c_white, _fade
    );
}