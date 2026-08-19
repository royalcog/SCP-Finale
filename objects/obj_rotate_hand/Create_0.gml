if (!variable_instance_exists(id, "side")) side = "left";

sprite_index = spr_friend_hand_rotate;
image_index = 0;
image_speed = 0;    // stuck on the first frame until the attack ramps the spin up
image_alpha = 0;    // fades in

hand_scale = 1.1;
image_xscale = (side == "left") ? hand_scale : -hand_scale; // mirror for the right-side grip
image_yscale = hand_scale;

depth = -380;