if !anim_loop && image_speed != 0
{
    if image_index >= image_number - 1
    {
        image_speed = 0;
        image_index = image_number - 1;
    }
}
// shadow trail phase 1
if ball_phase == 1
{
    var _s = instance_create_layer(x, y, "Instances", obj_shadow);
    _s.spr = sprite_index;
    _s.frame = image_index;
    _s.xscale = image_xscale;
    _s.yscale = image_yscale;
    _s.angle = image_angle;
    _s.alpha = 0.5;
    _s.depth = depth + 1;
}
// shadow trail phase 3 throttled
if ball_phase == 3
{
    shadow_timer++;
    if shadow_timer >= 6
    {
        shadow_timer = 0;
        var _s = instance_create_layer(x, y, "Instances", obj_shadow);
        _s.spr = sprite_index;
        _s.frame = image_index;
        _s.xscale = image_xscale;
        _s.yscale = image_yscale;
        _s.angle = image_angle;
        _s.alpha = .75;
        _s.depth = depth + 1;
        _s.drift_x = -2;
		_s.drift_y = 0;
    }
}
if ball_phase == 1
{
    x += 5;
    ball_target_x = 80;
    if x >= ball_target_x
    {
        x = ball_target_x;
        sprite_index = spr_roark_ball_to_knight;
        image_index = 0;
        image_speed = 1;
        anim_loop = false;
        ball_phase = 2;
        return;
    }
}
if ball_phase == 2
{
    if image_speed == 0
    {
        image_index = image_number - 1;
        ball_phase = 3;
        start_y = y;
        bob_angle = 0;
    }
}
if ball_phase == 3
{
    bob_angle += 0.03;
    y = start_y + sin(bob_angle) * 4;
}

if reverse_phase == 1
{
    reverse_frame -= 0.15; // reverse speed, match your forward speed
    image_index = max(0, floor(reverse_frame));
    if reverse_frame <= 0
    {
        sprite_index = spr_roark_ball;
        image_speed = 1;
        anim_loop = true;
        ball_phase = 0;
        reverse_phase = 2;
    }
}

if reverse_phase == 2
{
	image_xscale = -2;
	x -= 5;
    ball_target_x = -120;
    if x <= ball_target_x
    {
        x = ball_target_x;
		reverse_phase = 0;
        return;
    }
}


// 1. When finishing the turn animation, switch immediately to droop
if (sprite_index == spr_roark_faceaway_turning)
{
    if (image_index >= image_number - 1)
    {
        sprite_index = spr_roark_droop;
        image_index = 0;
        image_speed = 1;
        global.knight_turning = false;
    }
}
// 2. When playing droop_up, cut it off after 6 frames (index 0 to 5) and switch to sword appear
if (sprite_index == spr_roark_droop_up)
{
	audio_stop_all();
    if (image_index >= 5) // 5 is the 6th frame (0-indexed)
    {
        sprite_index = spr_roark_sword_appear_new;
        image_index = 0;
        image_speed = 1;
    }
}

// 3. Freeze sword appear animation on the last frame
if (sprite_index == spr_roark_sword_appear_new)
{
    if (!turn_sword_sound_played && floor(image_index) >= 8)
    {  
        audio_play_sound(snd_taking_out_sword, 1, false);
        turn_sword_sound_played = true;
    }

    if (image_index >= image_number - 1)
    {
        image_speed = 0;
        image_index = image_number - 1;
    }
}