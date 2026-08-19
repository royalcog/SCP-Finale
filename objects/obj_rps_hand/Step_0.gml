if (!variable_instance_exists(id, "side")) side = "left";

depth = -380;

if (chasing)
{
    // draw_angle driven externally during the scissors chase
}
else if (bouncing)
{
    bounce_progress += bounce_speed;
    draw_angle = base_angle + sin(bounce_progress) * tilt_amount;
}
else
{
    draw_angle = base_angle;
}