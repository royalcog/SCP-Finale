// Draw the chant text
if (chant_text != "")
{
    draw_set_font(fnt_greaterdetermination); // Replace with your font
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
    // Draw in the middle of the screen (assuming standard 640x480 Undertale resolution)
    // Change these coordinates if your room size is different!
    draw_text(426, 100, chant_text);
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}