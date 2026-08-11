if !variable_instance_exists(id, "ready") || !ready { exit; }

if speaker_shake[page]
{
    scr_char_shake_update(obj_spamton, speaker_shake_speed[page], speaker_shake_intensity[page]);
}