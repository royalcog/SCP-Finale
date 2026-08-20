// travel: small orb heading to its locked point, plus a target reticle
// at the destination so the player can see it coming; the reticle goes
// away the moment it arrives — the blink itself becomes the final tell
if (phase == "travel")
{
    draw_set_alpha(1);
    draw_set_color(c_orange);
    draw_circle(x, y, 6, false);

    draw_set_alpha(0.6);
    draw_circle(target_x, target_y, 10, true);
    draw_set_alpha(1);
}
else if (phase == "blink")
{
    if (blink_visible)
    {
        draw_set_color(c_yellow);
        draw_circle(x, y, 8, false);
    }
}

draw_set_color(c_white);