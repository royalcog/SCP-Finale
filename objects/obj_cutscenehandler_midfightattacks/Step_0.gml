if (room == rm_two && !instance_exists(obj_mewmew)) 
{
    // If you are in the new room but Mewmew hasn't been spawned yet,
    // wait for the Room Start event to finish spawning her.
    exit; 
}


var _textbox_open = instance_exists(obj_textbox);
var _textbox_just_closed = textbox_was_open && !_textbox_open;
textbox_was_open = _textbox_open;

// If the textbox just closed this frame, automatically engage the queue trigger!
if (_textbox_just_closed)
{
    processing_queue = true;
    page_loop_objs = [];
    page_move_active = [];
}

// 1. FIRE SPRITE_QUEUE ON CURRENT PAGE
if instance_exists(obj_textbox)
{
    for (var i = array_length(sprite_queue) - 1; i >= 0; i--)
    {
        var _entry = sprite_queue[i];
        if obj_textbox.page == _entry.page
        {
            if _entry.type == "spawn"
			{
			    instance_create_layer(_entry.x, _entry.y, _entry.layer, _entry.obj);
			    if (variable_struct_exists(_entry, "snd") && _entry.snd != noone)
			    {
			        audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
			    }
			    array_delete(sprite_queue, i, 1);
			}
            else if _entry.type == "sprite" && instance_exists(_entry.obj)
			{
			    _entry.obj.sprite_index = _entry.sprite;
			    _entry.obj.anim_loop = _entry.loop;
			    _entry.obj.image_speed = _entry.loop ? 1 : 0;
			    _entry.obj.image_index = _entry.image;
			    if _entry.snd != noone
			    {
			        audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
			    }
			    array_delete(sprite_queue, i, 1);

			    if (_entry.loop)
			    {
			        array_push(page_loop_objs, { obj: _entry.obj, page: _entry.page });
			    }
			}
			else if _entry.type == "fade_special"
			{
			    trigger_fade_special_sprite(_entry.target_object, _entry.sprite, _entry.image, _entry.fade_speed);
			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "object_fade"
			{
			    trigger_object_fade(_entry.target_object, _entry.sprite, _entry.image, _entry.target_x, _entry.target_y, _entry.fade_speed);
			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "move_start"
			{
			    _entry.obj.sprite_index = _entry.sprite;
			    _entry.obj.image_index = 0;
			    _entry.obj.image_speed = _entry.loop ? 1 : 0;
			    _entry.obj.anim_loop = _entry.loop;

			    array_push(page_move_active, {
			        obj: _entry.obj,
			        dx: _entry.dx,
			        dy: _entry.dy,
			        speed: _entry.speed,
			        duration: _entry.duration,
			        timer: 0,
			        page: _entry.page
			    });

			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "set_var_page" && instance_exists(_entry.obj)
			{
			    variable_instance_set(_entry.obj, _entry.var_name, _entry.value);
			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "damage_number"
			{
			    scr_show_damage(_entry.obj, _entry.amount, _entry.color_top, _entry.color_bottom);
			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "ghost_sync" && instance_exists(_entry.obj)
			{
			    _entry.obj.start_y = _entry.obj.y; // resync bob center to wherever she actually is now
			    _entry.obj.ghosted = true;
			    array_delete(sprite_queue, i, 1);
			}
			else if _entry.type == "sound"
			{
			    audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
			    array_delete(sprite_queue, i, 1);
			}
        }
    }
}

// 1b. FIRE DELAYED SPRITE_QUEUE (only counts down while its page is active)
if instance_exists(obj_textbox)
{
    for (var i = array_length(sprite_queue_delayed) - 1; i >= 0; i--)
    {
        var _entry = sprite_queue_delayed[i];
        if (obj_textbox.page == _entry.page)
        {
            _entry.delay -= 1;
            if (_entry.delay <= 0)
            {
                if (instance_exists(_entry.obj))
				{
				    _entry.obj.sprite_index = _entry.sprite;
				    _entry.obj.image_index = _entry.image;
				    _entry.obj.image_speed = _entry.loop ? 1 : 0;
				    _entry.obj.anim_loop = _entry.loop;
				    if (_entry.snd != noone)
				    {
				        audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
				    }

				    if (_entry.loop) // <-- new
				    {
				        array_push(page_loop_objs, { obj: _entry.obj, page: _entry.page });
				    }
				}
				array_delete(sprite_queue_delayed, i, 1);
            }
        }
    }
}

if instance_exists(obj_textbox)
{
    var _typing = (obj_textbox.draw_char < obj_textbox.text_length[obj_textbox.page]);
    var _should_freeze = !_typing && obj_textbox.freeze_anim_on_finish[obj_textbox.page];

    for (var i = 0; i < array_length(page_loop_objs); i++)
    {
        var _e = page_loop_objs[i];
        if (_e.page == obj_textbox.page && instance_exists(_e.obj))
        {
            _e.obj.image_speed = _should_freeze ? 0 : 1;
        }
    }
}

// 2. TEXTBOX JUST CLOSED - PROCESS AFTER_TEXTBOX_QUEUE
if (processing_queue)
{
    if (array_length(move_queue_active) > 0)
    {
        exit;
    }

    while (array_length(after_textbox_queue) > 0)
    {
        var _entry = after_textbox_queue[0];
        array_delete(after_textbox_queue, 0, 1);

        if _entry.type == "spawn"
        {
            instance_create_layer(_entry.x, _entry.y, _entry.layer, _entry.obj);
            if _entry.snd != noone
            {
                audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
            }
        }
        else if _entry.type == "sprite" && instance_exists(_entry.obj)
        {
            _entry.obj.sprite_index = _entry.sprite;
            _entry.obj.image_index = _entry.image;
            _entry.obj.image_speed = _entry.loop ? 1 : 0;
            _entry.obj.anim_loop = _entry.loop;
            if _entry.snd != noone
            {
                audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
            }
        }
        else if _entry.type == "sound"
        {
            if _entry.snd != noone
                audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
        }
        else if _entry.type == "tenna_shake"
        {
            scr_tenna_shake(_entry.state);
        }
        else if _entry.type == "blackbox"
        {
            var _bb = instance_create_layer(_entry.x, _entry.y, _entry.layer, _entry.obj);
            obj_cutscenehandler_midfightattacks.blackbox_instance = _bb;
            if _entry.snd != noone
            {
                audio_stop_all();
                audio_play_sound(_entry.snd, 10, false, _entry.snd_gain);
            }
            else
            {
                audio_stop_all();
            }
        }
        else if _entry.type == "tenna_battle_intro"
        {
            tenna_battle_intro_state = 1;
        }
        else if _entry.type == "knight_ball"
        {
            scr_roark_ball_start();
        }
        else if _entry.type == "impact_sequence"
        {
            audio_sound_gain(global.music, 0);
            impact_seq_state = 1;
        }
        else if _entry.type == "knight_to_ball"
        {    
            audio_sound_gain(global.music, 0, 100);
            scr_knight_to_ball();
        }
        else if (_entry.type == "villains_ascend" && villains_ascending == false)
		{
		    villains_ascending = true; // This instantly locks the door behind it
    
		    if instance_exists(obj_jevil)
		    {
		        audio_play_sound(snd_sparklegem, 1, false);
		        obj_jevil.sprite_index = spr_devilsknife;
		        obj_jevil.image_index = 0;
		        obj_jevil.image_speed = 1;
		        obj_jevil.anim_loop = true;
		    }
		    if instance_exists(obj_spamton)
		    {
		        obj_spamton.sprite_index = spr_dealmaker;
		        obj_spamton.image_index = 0;
		        obj_spamton.image_speed = 1;
		        obj_spamton.anim_loop = true;
		    }
		}
		else if (_entry.type == "villains_descend" && villains_descending == false)
		{
		    villains_descending = true; // Lock the block so it only fires once

		    if (!instance_exists(obj_jevil))
		    {
		        audio_play_sound(snd_sparklegem, 1, false);
		        var _jevil = instance_create_layer(450, 140, "Instances", obj_jevil);
        
		        // Apply everything directly to the newly spawned Jevil
		        with (_jevil) {
		            in_cutscene = true; 
		            image_alpha = 0;
		            sprite_index = spr_devilsknife;
		            image_index = 0;
		            image_speed = 1;
		            anim_loop = true;
		        }
		    }
    
		    if (!instance_exists(obj_spamton))
		    {
		        var _spamton = instance_create_layer(300, 167, "Instances", obj_spamton);
        
		        // Apply everything directly to the newly spawned Spamton
		        with (_spamton) {
		            image_alpha = 0;
		            sprite_index = spr_dealmaker;
		            image_index = 0;
		            image_speed = 1;
		            anim_loop = true;
		        }
		    }
}
        else if _entry.type == "fade_out_to_black"
		{
		    if (!instance_exists(obj_cutscenefade))
		    {
		        var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
		        _fader.fade_target = 1;
		        _fader.target_room = room; 
        
		        // Optional check: if your struct has a color specified, use it!
		        if (variable_struct_exists(_entry, "fade_color"))
		        {
		            _fader.fade_color = _entry.fade_color; // Pass c_white here if desired
		        }
		    }
		    break; 
		}
        else if _entry.type == "warp_and_fade_in"
        {
            // IF SHE IS STILL WALKING, PUT IT BACK IN THE QUEUE AND WAIT!
            if (array_length(move_queue_active) > 0)
            {
                // This puts the warp back at the start of the queue so it's checked again next frame
                array_insert(after_textbox_queue, 0, _entry);
                break; 
            }
            
            // OTHERWISE, IF NO ONE IS WALKING, DO THE FADE!
            if (!instance_exists(obj_cutscenefade))
            {
                var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
                _fader.fade_target = 1;
                _fader.target_room = _entry.target_room; 
            }
            // We deleted the entry from the queue at the start of the while loop, 
            // so we don't need to do anything else here.
        }
		else if _entry.type == "orb_shake"
		{
			obj_orb.alarm[0] = 120;
		}
        else if _entry.type == "char_move"
        {
            array_push(move_queue_active, {
                obj: _entry.obj,
                sprite: _entry.sprite,
                loop: _entry.loop,
                dx: _entry.dx,
                dy: _entry.dy,
                speed: _entry.speed,
                duration: _entry.duration,
                timer: 0,
                started: false,
                fade_out: variable_struct_exists(_entry, "fade_out") ? _entry.fade_out : false,
                fade_speed: variable_struct_exists(_entry, "fade_speed") ? _entry.fade_speed : 0.05,
                fading: false 
            });
            break; 
        }
		else if _entry.type == "CTSP"
		{
			trigger_shadow_pause(_entry.target_object, _entry.sprite, _entry.wait_seconds);
		}
		else if _entry.type == "PAUSE_ONLY"
		{
		    trigger_pause_only(_entry.target_object, _entry.wait_seconds);
		}
		else if _entry.type == "RESUME_SCROLL"
		{
		    trigger_resume_scrolling(_entry.target_object);
		}
		else if _entry.type == "FADE_SPECIAL"
		{
		    trigger_fade_special_sprite(_entry.target_object, _entry.sprite, _entry.image, _entry.fade_speed);
		}
		else if _entry.type == "OBJECT_FADE"
		{
		    trigger_object_fade(_entry.target_object, _entry.sprite, _entry.image, _entry.target_x, _entry.target_y, _entry.fade_speed);
		}
		else if _entry.type == "impact_flash"
		{
		    impact_flash_target = instance_find(_entry.target_obj, 0);
		    impact_flash_silhouette_spr = _entry.silhouette_spr;
		    impact_flash_circle_speed = _entry.circle_speed;
		    impact_flash_hit_sprite = _entry.hit_sprite;
		    impact_flash_yelling_sprite = _entry.yelling_sprite;
		    impact_flash_knockback_speed = _entry.knockback_speed;
		    impact_flash_knockback_friction = _entry.knockback_friction;
		    impact_flash_next_text_id = _entry.next_text_id;
		    impact_flash_wait_duration = _entry.wait_frames;
		    impact_flash_knockback_dir = _entry.knockback_dir;
		    impact_flash_gerson_obj = _entry.gerson_obj;
		    impact_flash_gerson_speed = _entry.gerson_speed;
		    impact_flash_gerson_dir = _entry.gerson_dir;
		    impact_flash_gerson_friction = _entry.gerson_friction;
		    impact_flash_darken_alpha = 0;
		    impact_flash_circle_alpha = 0;
		    impact_flash_wait_timer = impact_flash_wait_duration;
		    impact_flash_circle_x = _entry.circle_start_x;
		    impact_flash_circle_y = _entry.circle_start_y;
		    impact_flash_spawn_obj = _entry.spawn_obj;
			impact_flash_original_sprite = _entry.original_sprite;
		    audio_stop_all(); 

		    impact_flash_state = 1;
		    break;
		}
		else if _entry.type == "set_var" && instance_exists(_entry.obj)
		{
		    variable_instance_set(_entry.obj, _entry.var_name, _entry.value);
		}
		else if _entry.type == "fade_warp_music"
		{
		    if (instance_exists(obj_cutscenefade))
		    {
		        with (obj_cutscenefade) { instance_destroy(); }
		    }

		    var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
		    _fader.fade_target = 1;
		    _fader.target_room = _entry.target_room;
		    _fader.wait_duration = _entry.wait_frames;
		    _fader.new_music_sound = _entry.new_sound;
		    _fader.new_music_gain = _entry.new_gain;
		    _fader.new_music_fade_time = _entry.fade_in_time;
		    _fader.old_music_fade_time = _entry.fade_out_time;
		    _fader.music_lead_frames = _entry.music_lead_frames;
			_fader.spawn_list = variable_struct_exists(_entry, "spawn_list") ? _entry.spawn_list : [];
			global.warp_pending = false;
		    break;
		}
		
		else if _entry.type == "damage_number" && instance_exists(_entry.obj)
		{
		    scr_show_damage(_entry.obj, _entry.amount, _entry.color_top, _entry.color_bottom);
		}
		
		else if _entry.type == "movement_group"
		{
		    array_push(movement_queue, { moves: _entry.moves });
		}
		else if (_entry.type == "fade")
		{
		    if (!instance_exists(obj_cutscenefade))
		    {
		        var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
		        _fader.fade_target = 1;
		        _fader.target_room = room; 
		        _fader.fade_color = _entry.fade_color;
		        _fader.fade_back_same_room = _entry.fade_back_same_room;
		        _fader.flash_wait_duration = _entry.wait_duration;
		    }
		}
		else if _entry.type == "spawn_fade_in"
		{
		    var _inst = instance_create_layer(_entry.x, _entry.y, _entry.layer, _entry.obj);
		    _inst.image_alpha = 0;
		    _inst.fade_in_speed = _entry.fade_speed;
		    _inst.fading_in = true;
		}
		else if _entry.type == "fist_split"
		{
		    scr_fist_slam_split(obj_fist_slam_cutscene, _entry.edge_margin, _entry.lerp_speed, _entry.fade_speed);
		}
		else if _entry.type == "sparkle_heroes"
		{
		    scr_sparkle_heroes(_entry.heroes);
		}
    }

    if (array_length(after_textbox_queue) == 0 && !instance_exists(obj_cutscenefade) && array_length(move_queue_active) == 0)
    {
        processing_queue = false;
        
        for (var i = 0; i < array_length(pending_delayed_queue); i++)
        {
            array_push(after_textbox_delayed_queue, pending_delayed_queue[i]);
        }
        pending_delayed_queue = [];
        
        if (array_length(after_textbox_delayed_queue) > 0)
        {
            after_queue_armed = true;
        }
    }
}

// 3. AMBIENT AUDIO LOGIC
if blackbox_sound_asset != noone && (blackbox_sound == noone || !audio_is_playing(blackbox_sound))
{
    blackbox_sound = audio_play_sound(blackbox_sound_asset, 10, false, 1);
}

// 4. FIRE DELAYED QUEUE
if after_queue_armed && array_length(after_textbox_delayed_queue) > 0
{
    for (var i = array_length(after_textbox_delayed_queue) - 1; i >= 0; i--)
    {
        after_textbox_delayed_queue[i].delay -= 1;
        if after_textbox_delayed_queue[i].delay <= 0
        {
            var _entry = after_textbox_delayed_queue[i];
            
            if (variable_struct_exists(_entry, "is_movement") && !variable_struct_exists(_entry, "obj"))
            {
                array_delete(after_textbox_delayed_queue, i, 1);
                continue;
            }
            
            if (variable_struct_exists(_entry, "is_sound_stop") && _entry.is_sound_stop)
            {
                if (audio_is_playing(_entry.sound_inst))
                {
                    audio_stop_sound(_entry.sound_inst);
                }
                array_delete(after_textbox_delayed_queue, i, 1);
                continue;
            }
            
            if (variable_struct_exists(_entry, "is_teleport") && _entry.is_teleport)
            {
                if (instance_exists(_entry.obj))
                {
                    _entry.obj.x = _entry.x;
                    _entry.obj.y = _entry.y;
                    if (_entry.sprite != noone)
                    {
                        _entry.obj.sprite_index = _entry.sprite;
                        _entry.obj.image_index = _entry.image_index;
                    }
                }
                array_delete(after_textbox_delayed_queue, i, 1);
                continue;
            }

            if variable_struct_exists(_entry, "wait_for_anim") && _entry.wait_for_anim
            {
                if instance_exists(_entry.obj) && _entry.obj.image_speed != 0
                {
                    continue;
                }
            }
            
            if (variable_struct_exists(_entry, "is_damage_number") && _entry.is_damage_number)
            {
                if (instance_exists(_entry.obj))
                {
                    scr_show_damage(_entry.obj, _entry.amount, _entry.color_top, _entry.color_bottom);
                }
                array_delete(after_textbox_delayed_queue, i, 1);
                continue;
            }
            
            if (variable_struct_exists(_entry, "is_custom_call") && _entry.is_custom_call)
            {
                _entry.call_func();
                array_delete(after_textbox_delayed_queue, i, 1);
                continue;
            }
            
            // ---> MOVE FADE CHECK UP HERE, BEFORE instance_exists(_entry.obj) <---
            if (variable_struct_exists(_entry, "type") && _entry.type == "fade")
			{
			    if (!instance_exists(obj_cutscenefade))
			    {
			        var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
			        _fader.fade_target = 1;
			        _fader.target_room = room; 
			        _fader.fade_color = _entry.fade_color;
			        _fader.fade_back_same_room = _entry.fade_back_same_room;
			        _fader.flash_wait_duration = _entry.wait_duration;
			    }
    
			    // Delete it immediately so the queue clears and lets you move to the next case!
			    array_delete(after_textbox_delayed_queue, i, 1);
			    continue; 
			}
            
            if instance_exists(_entry.obj)
            {
                if (_entry[$ "is_movement"] ?? false)
                {
                    array_push(move_queue_active, {
                        obj:          _entry.obj,
                        sprite:       _entry.sprite,
                        loop:         _entry.loop,
                        dx:           _entry.dx,
                        dy:           _entry.dy,
                        speed:        _entry.speed,
                        duration:     _entry.movement_duration,
                        timer:        0,
                        started:      false,
                        fade_out:     _entry[$ "fade_out"] ?? false,
                        fade_speed:   _entry[$ "fade_speed"] ?? 0.05,
                        fading:       false
                    });
                }
                else
                {
                    _entry.obj.sprite_index = _entry.sprite;
                    _entry.obj.image_index = 0;
                    _entry.obj.image_speed = _entry.loop ? 1 : 0; 
                    _entry.obj.anim_loop = _entry.loop;
                }
    
                if variable_struct_exists(_entry, "snd") && _entry.snd != noone
                {
                    audio_play_sound(_entry.snd, 1, false, _entry.snd_gain);
                }
            }
            array_delete(after_textbox_delayed_queue, i, 1);
        }
    }
    if array_length(after_textbox_delayed_queue) == 0
    {
        after_queue_armed = false;
    }
}

// 5. TENNA BATTLE INTRO STATE MACHINE
if tenna_battle_intro_state == 1 && instance_exists(obj_tenna)
{
    if obj_tenna.image_speed == 0
    {
        audio_stop_all();
        blackbox_sound_asset = noone;
        blackbox_sound = noone;
        
        obj_tenna.sprite_index = spr_tenna_snap;
        obj_tenna.image_speed = 1;
        obj_tenna.image_index = 0;
        obj_tenna.anim_loop = false;
        
        if instance_exists(obj_kris)
        {
            obj_kris.sprite_index = spr_kris_battle_intro;
            obj_kris.image_speed = 1;
            obj_kris.image_index = 0;
            obj_kris.anim_loop = false;
        }
        if instance_exists(obj_susie)
        {
            obj_susie.sprite_index = spr_susie_battle_intro;
            obj_susie.image_speed = 1;
            obj_susie.image_index = 0;
            obj_susie.anim_loop = false;
        }
        if instance_exists(obj_ralsei)
        {
            obj_ralsei.sprite_index = spr_ralsei_battle_intro;
            obj_ralsei.image_speed = 1;
            obj_ralsei.image_index = 0;
            obj_ralsei.anim_loop = false;
        }
        audio_play_sound(snd_slash, 1, false);
        tenna_battle_intro_state = 1.5;
    }
}

if tenna_battle_intro_state == 1.5
{
    if instance_exists(obj_kris) && obj_kris.image_speed == 0
    {
        tenna_battle_intro_delay = 60;
        tenna_battle_intro_state = 2;
    }
}

if tenna_battle_intro_state == 2
{
    tenna_battle_intro_delay -= 1;
    if tenna_battle_intro_delay <= 0
    {
        tenna_battle_intro_state = 3;
    }
}

if tenna_battle_intro_state == 3
{
    if instance_exists(obj_kris)
    {
        obj_kris.battle_started = true;
        obj_kris.sprite_index = spr_kris_battle_idle;
        obj_kris.image_speed = 1;
        obj_kris.image_index = 0;
        obj_kris.anim_loop = true;
        obj_kris.alarm[3] = 1;
    }
    if instance_exists(obj_susie)
    {
        obj_susie.sprite_index = spr_susie_battle_idle;
        obj_susie.image_speed = 1;
        obj_susie.image_index = 0;
        obj_susie.anim_loop = true;
    }
    if instance_exists(obj_ralsei)
    {
        obj_ralsei.sprite_index = spr_ralsei_battle_idle;
        obj_ralsei.image_speed = 1;
        obj_ralsei.image_index = 0;
        obj_ralsei.anim_loop = true;
    }
    if instance_exists(obj_tenna)
    {
        obj_tenna.use_battle_ext = true;
    }
    tenna_battle_intro_state = 0;
}

// 6. IMPACT SEQUENCE STATE MACHINE
if impact_seq_state == 1
{
    audio_play_sound(snd_impact, 1, false);
    impact_seq_timer = game_get_speed(gamespeed_fps);
    impact_seq_state = 2;
}
if impact_seq_state == 2
{
    impact_seq_timer -= 1;
    if impact_seq_timer <= 0
    {
        audio_play_sound(snd_impact, 1, false);
        impact_seq_timer = game_get_speed(gamespeed_fps);
        impact_seq_state = 3;
    }
}
if impact_seq_state == 3
{
    impact_seq_timer -= 1;
    if impact_seq_timer <= 0
    {
        audio_play_sound(snd_explosion, 1, false);
        scr_roark_ball_start();
        impact_seq_state = 0;
    }
}

// 7. VILLAINS ASCENDING LOGIC
if villains_ascending
{
    if instance_exists(obj_jevil)
    {
        obj_jevil.y -= 0.5;
        obj_jevil.image_alpha -= 0.01;
        if obj_jevil.image_alpha <= 0
        {
            obj_jevil.image_alpha = 0;
            instance_destroy(obj_jevil);
        }
    }
    if instance_exists(obj_spamton)
    {
        obj_spamton.y -= 0.5;
        obj_spamton.image_alpha -= 0.01;
        if obj_spamton.image_alpha <= 0
        {
            obj_spamton.image_alpha = 0;
            instance_destroy(obj_spamton);
        }
    }
    if !instance_exists(obj_jevil) && !instance_exists(obj_spamton)
    {
        villains_ascending = false;
    }
}

// 7. VILLAINS DESCENDING LOGIC
if (villains_descending)
{
    var _all_done = true;

    // --- Handle Jevil ---
    if (instance_exists(obj_jevil))
	{
	    // 1. Move until we reach the target height AND alpha is full
	    // We use a small buffer (e.g., 1 pixel) to account for floating/bobbing
	    if (obj_jevil.y < 280 || obj_jevil.image_alpha < 1)
	    {
	        obj_jevil.y += 0.5;
	        obj_jevil.image_alpha += 0.01;
	        _all_done = false;
	    }
	    else
	    {
	        // 2. We've arrived! Just hand back control
	        with (obj_jevil)
            {
				y = 280;
                in_cutscene = false;
                start_y = y;
                image_alpha = 1;
                sprite_index = spr_jevil_left;
                image_speed = 0; 
                image_index = 0; 
            }
		}
	}

    // --- Handle Spamton ---
    if (instance_exists(obj_spamton))
    {
        if (obj_spamton.y < 220)
        {
            obj_spamton.y += 0.5;
            obj_spamton.image_alpha += 0.01;
            _all_done = false;            // Still animating
        }
        else
        {
            obj_spamton.y = 220;
			obj_spamton.x = 300;
            obj_spamton.image_alpha = 1;
            obj_spamton.sprite_index = spr_spamton_left;
            obj_spamton.image_speed = 0;
        }
    }

    // --- Cleanup ---
    if (_all_done)
    {
        villains_descending = false;
    }
}

// 8. ACTIVE CHARACTER MOVEMENT LOGIC
for (var i = array_length(move_queue_active) - 1; i >= 0; i--)
{
    var _m = move_queue_active[i];
    if instance_exists(_m.obj)
    {
        if (!_m.started)
        {
            _m.obj.sprite_index = _m.sprite;
            _m.obj.image_index = 0;
            _m.obj.image_speed = _m.loop ? 1 : 0;
            _m.obj.anim_loop = _m.loop;
            _m.started = true;
        }

        if (!_m.fading)
	        {
	            // Initialize accumulators if they don't exist yet
	            if (!variable_struct_exists(_m, "x_acc")) _m.x_acc = 0;
	            if (!variable_struct_exists(_m, "y_acc")) _m.y_acc = 0;

	            // Add the fractional movement each frame
	            _m.x_acc += (_m.dx * _m.speed);
	            _m.y_acc += (_m.dy * _m.speed);

	            var _hit_wall = false;

	            // Process X movement whenever accumulated pixels reach at least 1 or -1
	            with (_m.obj)
	            {
	                while (abs(_m.x_acc) >= 1)
	                {
	                    var _dir = sign(_m.x_acc);
	                    if (!place_meeting(x + _dir, y, obj_wall))
	                    {
	                        x += _dir;
	                        _m.x_acc -= _dir;
	                    }
	                    else
	                    {
	                        _hit_wall = true;
	                        _m.x_acc = 0; // Clear accumulator on wall hit
	                        break;
	                    }
	                }

	                // Process Y movement
	                while (abs(_m.y_acc) >= 1)
	                {
	                    var _dir = sign(_m.y_acc);
	                    if (!place_meeting(x, y + _dir, obj_wall))
	                    {
	                        y += _dir;
	                        _m.y_acc -= _dir;
	                    }
	                    else
	                    {
	                        _hit_wall = true;
	                        _m.y_acc = 0;
	                        break;
	                    }
	                }
	            }

	            _m.timer++;

	            if (_hit_wall)
	            {
	                _m.timer = _m.duration;
	            }
	        }
        else
        {
            _m.obj.image_alpha -= _m.fade_speed;
            if (_m.obj.image_alpha <= 0)
            {
                instance_destroy(_m.obj);
                array_delete(move_queue_active, i, 1);
                continue;
            }
        }
        
        if (!_m.fading && _m.timer >= _m.duration)
        {
            if (_m.fade_out)
            {
                _m.fading = true;
            }
            else
            {
                var _has_next_move = false;
                for (var j = 0; j < array_length(move_queue_active); j++)
                {
                    if (j != i && move_queue_active[j].obj == _m.obj)
                    {
                        _has_next_move = true;
                        break;
                    }
                }
                if (!_has_next_move)
                {
                    for (var j = 0; j < array_length(after_textbox_delayed_queue); j++)
                    {
                        var _dq = after_textbox_delayed_queue[j];
                        if (variable_struct_exists(_dq, "obj") && _dq.obj == _m.obj && variable_struct_exists(_dq, "is_movement") && _dq.is_movement)
                        {
                            _has_next_move = true;
                            break;
                        }
                    }
                }

                if (!_has_next_move)
                {
                    _m.obj.image_index = 0;
                    _m.obj.image_speed = 0;
                }
                
                array_delete(move_queue_active, i, 1);
            }
        }
    }
    else
    {
        array_delete(move_queue_active, i, 1);
    }
}

// 8b. ORDERED MOVEMENT GROUP QUEUE
if (!current_movement_group_active && array_length(movement_queue) > 0)
{
    var _group = movement_queue[0];
    array_delete(movement_queue, 0, 1);

    for (var i = 0; i < array_length(_group.moves); i++)
    {
        var _mv = _group.moves[i];
        array_push(move_queue_active, {
            obj: _mv.obj,
            sprite: _mv.sprite,
            loop: _mv.loop,
            dx: _mv.dx,
            dy: _mv.dy,
            speed: _mv.speed,
            duration: variable_struct_exists(_mv, "duration") ? _mv.duration : 0,
            timer: 0,
            started: false,
            fade_out: variable_struct_exists(_mv, "fade_out") ? _mv.fade_out : false,
            fade_speed: variable_struct_exists(_mv, "fade_speed") ? _mv.fade_speed : 0.05,
            fading: false
        });
    }

    current_movement_group_active = true;
}

if (current_movement_group_active && array_length(move_queue_active) == 0)
{
    current_movement_group_active = false; // clear to start the next group
}

// IMPACT FLASH STATE MACHINE
if (impact_flash_state == 1) // darken to full black
{
    impact_flash_darken_alpha += impact_flash_darken_speed;
    if (impact_flash_darken_alpha >= impact_flash_darken_target)
    {
        impact_flash_darken_alpha = impact_flash_darken_target;
        impact_flash_state = 2;
    }
}

if (impact_flash_state == 2) // wait, then fade circle in
{
    impact_flash_wait_timer -= 1;
    var _fade_start = impact_flash_wait_duration / 2;
    if (impact_flash_wait_timer <= _fade_start)
    {
        impact_flash_circle_alpha = clamp(1 - (impact_flash_wait_timer / _fade_start), 0, 1);
    }
    if (impact_flash_wait_timer <= 0)
    {
        impact_flash_circle_alpha = 1;
        impact_flash_state = 3;
    }
}

if (impact_flash_state == 3) // circle rushes toward target
{
    impact_flash_circle_angle = point_direction(impact_flash_circle_x, impact_flash_circle_y, impact_flash_target.x, impact_flash_target.y);
    var _dist = point_distance(impact_flash_circle_x, impact_flash_circle_y, impact_flash_target.x, impact_flash_target.y);

    if (_dist <= impact_flash_circle_speed)
    {
        impact_flash_circle_x = impact_flash_target.x;
        impact_flash_circle_y = impact_flash_target.y;
        impact_flash_state = 4;

		audio_play_sound(snd_impact, 1, false);

        if (impact_flash_hit_sprite != noone)
        {
            with (impact_flash_target)
            {
                sprite_index = other.impact_flash_hit_sprite;
                image_index = 0;
                image_speed = 0;
            }
            impact_flash_freeze_timer = impact_flash_freeze_duration;
        }
        else
        {
            impact_flash_freeze_timer = 0; // no freeze frame, skip straight through
        }
    }
    else
    {
        impact_flash_circle_x += lengthdir_x(impact_flash_circle_speed, impact_flash_circle_angle);
        impact_flash_circle_y += lengthdir_y(impact_flash_circle_speed, impact_flash_circle_angle);
    }
}

if (impact_flash_state == 4) // freeze frame (if any), screen fading back in
{
    impact_flash_darken_alpha -= impact_flash_darken_speed * 2;
    if (impact_flash_darken_alpha < 0) impact_flash_darken_alpha = 0;

    impact_flash_freeze_timer -= 1;
    if (impact_flash_freeze_timer <= 0)
	{
		if (impact_flash_spawn_obj != noone)
		{
		    var _old_target = impact_flash_target;
		    mewmew_before_impact_inst = _old_target; // <-- dedicated reference to the ORIGINAL

		    if (impact_flash_original_sprite != noone)
		    {
		        _old_target.sprite_index = impact_flash_original_sprite;
		        _old_target.image_index = 0;
		        _old_target.image_speed = 0;
		    }

		    var _new_inst = instance_create_depth(_old_target.x, _old_target.y, _old_target.depth, impact_flash_spawn_obj);
		    _new_inst.image_xscale = _old_target.image_xscale;
		    _new_inst.image_yscale = _old_target.image_yscale;
		    _new_inst.image_speed = 0;
		    if (impact_flash_yelling_sprite != noone)
		    {
		        _new_inst.sprite_index = impact_flash_yelling_sprite;
		        _new_inst.image_index = 0;
		    }

		    impact_flash_target = _new_inst;
		    mewmew_after_impact_inst = _new_inst;
		}
	    else if (impact_flash_yelling_sprite != noone)
	    {
	        with (impact_flash_target)
	        {
	            sprite_index = other.impact_flash_yelling_sprite;
	            image_index = 0;
	            image_speed = 0;
	        }
	    }
	    impact_flash_state = 5;
	}
}

if (impact_flash_state == 5) // knockback + gerson reacting, screen continues fading in
{
    impact_flash_darken_alpha -= impact_flash_darken_speed * 2;
    if (impact_flash_darken_alpha < 0) impact_flash_darken_alpha = 0;

    with (impact_flash_target)
    {
        x += lengthdir_x(other.impact_flash_knockback_speed, other.impact_flash_knockback_dir);
        y += lengthdir_y(other.impact_flash_knockback_speed, other.impact_flash_knockback_dir);
    }
    impact_flash_knockback_speed -= impact_flash_knockback_friction;
    if (impact_flash_knockback_speed < 0) impact_flash_knockback_speed = 0;

    if (impact_flash_gerson_obj != noone && instance_exists(impact_flash_gerson_obj) && impact_flash_gerson_speed > 0)
    {
        with (impact_flash_gerson_obj)
        {
            x += lengthdir_x(other.impact_flash_gerson_speed, other.impact_flash_gerson_dir);
            y += lengthdir_y(other.impact_flash_gerson_speed, other.impact_flash_gerson_dir);
        }
        impact_flash_gerson_speed -= impact_flash_gerson_friction;
        if (impact_flash_gerson_speed < 0) impact_flash_gerson_speed = 0;
    }

    if (impact_flash_knockback_speed <= 0)
    {
        impact_flash_state = 6;
        impact_flash_waiting = true;
    }
}

if (impact_flash_state == 6 && impact_flash_waiting) // wait for continue
{
    if (keyboard_check_pressed(ord("Z")))
    {
        impact_flash_state = 0;
        impact_flash_waiting = false;
        impact_flash_darken_alpha = 0;

        if (impact_flash_next_text_id != noone)
        {
            create_textbox(impact_flash_next_text_id);
        }
    }
}

// GATEKEEPER:
if (waiting_for_warp && array_length(move_queue_active) == 0)
{
    if instance_exists(obj_textbox) {instance_destroy(obj_textbox)}
    
    if (!instance_exists(obj_cutscenefade))
    {
        var _fader = instance_create_depth(0, 0, -9999, obj_cutscenefade);
        _fader.fade_target = 1;
        
        // Just set the target, the fader handles the rest
        if (warp_step == 0) { _fader.target_room = rm_two; warp_step = 1; }
        else if (warp_step == 1) { _fader.target_room = rm_three; warp_step = 2; }
		else if (warp_step == 2) { _fader.target_room = rm_four; warp_step = 3; }
		else if (warp_step == 3) { _fader.target_room = rm_five; warp_step = 4; }
    }
    waiting_for_warp = false;
}

// ON-PAGE MOVEMENT (stops naturally on duration end, OR immediately if page changes/cutoff skips ahead)
for (var i = array_length(page_move_active) - 1; i >= 0; i--)
{
    var _m = page_move_active[i];

    if (!instance_exists(obj_textbox) || obj_textbox.page != _m.page)
    {
        // page changed (normal advance OR cutoff-skip) or textbox closed — stop immediately
        if (instance_exists(_m.obj))
        {
            _m.obj.image_speed = 0;
        }
        array_delete(page_move_active, i, 1);
        continue;
    }

    if (instance_exists(_m.obj))
    {
        _m.obj.x += _m.dx * _m.speed;
        _m.obj.y += _m.dy * _m.speed;
        _m.timer++;

        if (_m.timer >= _m.duration)
        {
            _m.obj.image_speed = 0;
            array_delete(page_move_active, i, 1);
        }
    }
    else
    {
        array_delete(page_move_active, i, 1);
    }
}

// N. GENERIC FADE-IN HANDLING
with (all)
{
    if (variable_instance_exists(id, "fading_in") && fading_in)
    {
        image_alpha += fade_in_speed;
        if (image_alpha >= 1)
        {
            image_alpha = 1;
            fading_in = false;
        }
    }
}