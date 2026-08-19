if (!variable_instance_exists(id, "side")) side = "left";

sprite_index = spr_friend_hand_rock; // Always start as rock
image_xscale = 1.1;
image_yscale = 1.1;
depth = -380;

// Set base directions
base_angle = (side == "left") ? 0 : 180;
image_angle = base_angle;
draw_angle = image_angle;

// Animation variables
bouncing = false;
bounce_progress = 0;
bounce_speed = 0.08; // Adjust to make the bounce faster/slower
tilt_amount = (side == "left") ? 45 : -45; // Left tilts up (+), Right tilts up (-)