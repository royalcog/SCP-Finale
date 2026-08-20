phase = "dialogue";
timer = 0;

dialogue_started = false;
dialogue_inst = noone;

shake_intensity = 6;
shake_duration = 30;

flip_hold_timer = 20; // brief pause after flipping before the laugh starts

attack2_inst = noone;

// so the flipped screen doesn't also show Friend upside-down/backwards —
// matches how the other attacks hide him while their hands/props do the work
if (instance_exists(obj_friend)) { obj_friend.visible = false; }