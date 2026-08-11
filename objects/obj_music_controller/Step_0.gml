if (global.song != undefined && global.song != noone)
{
    var _time = (current_time - global.song_start) / 1000;
    _time -= global.offset;

    var _beat_length = 60 / 120;

    global.beat = _time / _beat_length;

    // Use a fixed max beat limit (or remove this block if your songs loop automatically)
    if (global.beat >= 9999) 
    {
        audio_stop_sound(global.music);

        // global.song IS the sound, so pass global.song directly instead of global.song.sound
        global.music = audio_play_sound(global.song, 1, false, 0); 
        audio_sound_gain(global.music, 1, 3000);

        global.song_start = current_time;
    }
}