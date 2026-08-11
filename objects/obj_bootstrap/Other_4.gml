display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

// Objects
if (!instance_exists(obj_attack_bank))
{
	if instance_exists(obj_mewmew) {
    instance_create_depth(0, 0, 0, obj_attack_bank);
	}
}

if (!instance_exists(obj_cutscenehandler_midfightattacks))
{
    instance_create_depth(0, 0, 0, obj_cutscenehandler_midfightattacks);
}

if (!instance_exists(obj_cutscenefade))
{
    instance_create_depth(0, 0, 0, obj_cutscenefade);
}

if (!instance_exists(obj_musiccontroller))
{
    instance_create_depth(0, 0, 0, obj_musiccontroller);
}

if (!instance_exists(obj_kris))
{
    instance_create_depth(0, 0, 0, obj_kris);
}

if (!instance_exists(obj_dial_invis))
{
    instance_create_depth(0, 0, 0, obj_dial_invis);
}

if (!instance_exists(obj_talkbox_dialogue))
{
    instance_create_depth(0, 0, 0, obj_talkbox_dialogue);
}

if (!instance_exists(obj_camera_controller))
{
    instance_create_depth(0, 0, 0, obj_camera_controller);
}

if (!instance_exists(obj_lighting))
{
    instance_create_depth(0, 0, 0, obj_lighting);
}

// Variables
 variable_global_set("dialogue_self", 12);
 global.song = sng_flashback;
 audio_play_sound(global.song, 1, true);

if (!variable_global_exists("fight_attack_active"))
{
    global.fight_attack_active = false;
}

if (!variable_global_exists("song"))
{
    global.song = noone;
}

if (!variable_global_exists("fight_seq_ui_done"))
{
    global.fight_seq_ui_done = false;
}

if (!variable_global_exists("ui_sequence_active"))
{
    global.ui_sequence_active = false;
}

if (!variable_global_exists("default_talkbox_dim"))
{
    global.default_talkbox_dim = 0;
}
