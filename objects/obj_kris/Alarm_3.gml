if (instance_exists(obj_UI))
{
	instance_destroy(obj_UI);
}
instance_create_depth(0, 0, -100000000, obj_UI);
// instance_create_depth(0, 0, -20001, obj_tedandfish);
// obj_tedandfish.image_speed = 0;
audio_sound_pitch(sng_cmmm, 2);
music_started = true;
