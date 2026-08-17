function scr_talkbox_show(_speaker, _text, _wrap_w, _offx, _offy, _fp, _cps, _keep_speaker_animating = false, _dim_alpha = -1, _animate = true)
{
    var inst = instance_create_layer(0, 0, "UI", obj_talkbox);
    with (inst) {
        speaker      = _speaker;
        quote        = _text;
        wrap_w       = _wrap_w;
        mouth_off_x  = _offx;
        mouth_off_y  = _offy;
        flip_talkbox = _fp;
        chars_per_s  = (is_real(_cps) ? _cps : 0);
        keep_speaker_animating = _keep_speaker_animating;
        dim_alpha = (_dim_alpha >= 0) ? _dim_alpha : global.default_talkbox_dim;
        animate_while_talking = _animate;
        switch (_speaker.char_id)
        {
            case CharID.Pink: speak_snd = snd_empty; snd_delay = 0; break;
			case CharID.Friend: speak_snd = snd_empty; snd_delay = 0; break;
			case CharID.Gerson: speak_snd = snd_gerson; snd_delay = 0; break;
			case CharID.Spamton: speak_snd = snd_spamton; snd_delay = 0; break;
			case CharID.Jevil: speak_snd = snd_jevil; snd_delay = 0; break;
            default:          speak_snd = noone;                     break;
        }
        speak_vol = 0.8;
        _recalc_layout();
    }
    return inst;
}