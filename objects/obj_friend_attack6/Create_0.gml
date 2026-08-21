phase = "dialogue";
timer = 0;

dialogue_started = false;
dialogue_inst = noone;

shake_intensity = 6;
shake_duration = 30;

flip_duration = 40; // frames for the screen to fluidly flip over (and back)

laugh_started = false;

attack2_inst = noone;

// shrink the box down (height only) right away so Friend and the rest of
// the party are a bit more visible below it for the whole attack
box_shrink_scale_y = 0.6;
if (instance_exists(obj_battlebox)) obj_battlebox.target_scale_y = box_shrink_scale_y;

// NOTE: unlike the other Friend attacks, we do NOT hide obj_friend here —
// he needs to stay visible so his laugh (obj_friend_laugh_attack, which
// drives his sprite directly) is actually seen. obj_friend_attack2 still
// hides/restores him itself when it's spawned below, same as always.