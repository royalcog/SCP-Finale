if (room != rm_one && room != rm_zero)
{
    instance_destroy();
    exit;
}

light_surface = -1;
lights = [];

// Start completely transparent so nothing dims automatically
darkness_alpha_left = 0.0;
darkness_alpha_right = 0.0;
darkness_target_left = 0.0;
darkness_target_right = 0.0;
darkness_lerp_speed = 0.02;