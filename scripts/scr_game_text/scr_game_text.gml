// scr_text_shake(23, 28); -> Shake the letters between (and indcluding) x and y
// scr_text_color(23, 28, color, color, color, color); -> Turn the letters between (and indcluding) x and y different colors
// scr_text_face_spr(LEFT, spr_noelle_left_happy); -> Turning a sprite a direction (4-directional only)
// scr_obj_spawn_after_textbox(obj_desscircle, 680, 215, "Instances"); -> Spawning an object after the full textbox is done
// scr_obj_sprite_after_textbox(obj_dess, spr_dess_intro_body, false, snd_appear, 0.7); -> Sprite animation after textbox is done
// scr_obj_sprite_after_textbox_delayed(obj_dess, spr_dess_drool, true, 60); -> Same as above, but with a delay
// scr_text_speaker_shake(.5, 1); -> Shake the speaker during the line of text
// scr_text_cutoff_slow(11, 11, 0.1); -> Slows down the text, and cuts it off at letter x

/// @param text_id
function scr_game_text(_text_id)
{
	switch (_text_id)
	{
		case "self_1":
			scr_text("* Where... are we???", "mewmewghost", noone, noone, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* Here, let me just...", "gerson");
				scr_set_dim_left(.99);
				scr_set_dim_right(.9);
				scr_fade_warp_with_music(rm_one, 120, sng_empty);				
		break;
			
		case "self_2":
			scr_text("* Hold on...", "gerson");
			scr_snd_after_textbox(snd_mercyadd, 1.1);
			scr_custom_call_after_textbox_delayed(scr_gerson_lantern_on, 30);
		break;
			
		case "self_3":
			obj_mewmew.corrupted = true;
			scr_text("* What happened???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* We were outplayed, it seems.", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right_idle, false);
			scr_text("* Guess the hypnosis wasn't as strong as we thought it was.", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_wistful, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_closed_eyes_left, false);
			scr_text("* I TRIED MY BEST, BEST.|* ALAS, SOME THINGS ARE IMMUNE TO THE FREEDOMS OF CHAOS, CHAOS.", "jevil");
			scr_text("* But wait, what happened to my body???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* Is she okay???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* Is she", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
				scr_text_cutoff_skip(8);
			scr_text("* Pink, you gotta relax for a second.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_right, false);
			scr_text("* As much as I distrust Friend, I do think they truly vacated your body.", "gerson");
			scr_text("* SO WHERE IS SHE???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
			scr_text("* I'm not sure, Pink.|* But she can't be too far away", "gerson");
				scr_text_cutoff_skip(51);
			scr_text("* Hello...? Is someone there...?", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_left, true);
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* BODY??? IS THAT YOU???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* It's me... mew...", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left_idle, false);
				scr_portrait_on_page(spr_mewmewspeaker_talkhappy_corrupted);
		break;
		
		case "self_4":
			scr_set_dim_left(.95, 0.02);
			scr_text("* WHERE ARE YOU???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* I'm not sure...", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left_idle, false);
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* She must be in the cell right next to us.", "gerson");
			scr_text("* WHY W0ULD [Friend Outside You] PUT A [Choose Your Vessel] 1N A CAGE?", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_tired_talk, false);
			scr_text("* D0ESN'T [Seam] V3RY FITT1NG.", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_left_dark, false);
			scr_text("* I assume it thinks the corruption is too far to be removed,", "gerson");
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookup_right, false);
			scr_text("* but not enough that it'd let her roam freely around the Bunker.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
			scr_text("* BODY!!! WE'RE GONNA GET YOU OUT OF THERE!!!", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left, true);
				scr_portrait_on_page(spr_pinkghost_yelling);
				scr_portrait_tail_off();
			scr_text("* Please... do... mew...", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_left_idle, false);
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* The better question to start with is how are WE getting out of here?", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
			scr_text("* THE ANSWER IS QUITE SIMPLE, SIMPLE!", "jevil");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookup_left, false);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_walkup, false);
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, false);
			scr_text("* LET ME TELEPORT OUT OF HERE AND FREE US FROM THE OUTSIDE!", "jevil"); 
				scr_obj_sprite_after_textbox(obj_jevil, spr_jevil_right, true);
				scr_snd_after_textbox(snd_jevillaugh, 1);
				scr_obj_sprite_after_textbox_delayed(obj_jevil, spr_jevil_right, false, 120);
		break;
		
		case "self_5":
		   scr_text("* ...Jevil?", "gerson");
		   scr_text("* I'M TRYING, I'M TRYING!", "jevil"); 
		break;
		
		case "self_6":
			scr_text("* [Can Can Sale] Y0U HURRY 1T UP???", "spamton");
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_tired, false);
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_left, false);
			scr_text("* I CAN'T SEEM TO GET FREE, FREE!", "jevil"); 
			scr_text("* Must've had your magic diminished when Friend used your spades against us.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_closed_eyes_left, false);
			scr_text("* How does that work???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* Good question.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
			scr_text("* Spamton, you got anything?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_back_up, false);
			scr_text("* I H4VE N0 [Pipis].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, false);
			scr_text("* Not helpful.", "gerson");
			scr_text("* Pink?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
			scr_text("* Can't I just...", "mewmewghost");
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, false);
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_left, false);
				scr_portrait_on_page(spr_pinkghost_concerned);
				scr_set_var_after_textbox(obj_mewmew, "ghosted", false);
				scr_char_move_after_textbox(obj_mewmew, spr_ghost_walkdown, true, 0, 6, .5, 60);
		break;
		
		case "self_7":
			scr_text("* Damn it! Damn it!!! DAMN IT!!!!!!!", "mewmewghost", noone, noone, true);
				scr_ghost_on_page(obj_mewmew);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
			scr_text("* Easy now. Let's think of an alternate strategy.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down_left, false);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right_idle, false);
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, false);
			scr_text("* 1S THER3 ANY [Nitrophilic Moss]?", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_left, false);
			scr_text("* What good would moss do us?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_back_up, false);
			scr_text("* [Tasty].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, false);
			scr_text("* ...", "gerson");
			scr_text("* Okay, I think I may have something.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookup_left, false);
			scr_text("* A little far-fetched, but it's worth a try.", "gerson");
			scr_text("* Pink, try to combine with your body again.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down_left, false);
				scr_obj_sprite_on_page_delayed(obj_mewmew, spr_ghost_shocked_up_right, false, 0, 60);
			scr_text("* BUT THERE'S A WALL IN THE WAY???", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_left, false);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_up_right, true);
			scr_text("* Correct.", "gerson");
			scr_text("* ????????", "mewmewghost", noone, noone, true);
				scr_portrait_on_page(spr_pinkghost_shocked);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_up_right, true);
			scr_text("* If you somehow connect, your new permanent status might phase you through the wall.", "gerson");
			scr_text("* WHAT DOES THAT EVEN MEAN???", "mewmewghost", noone, noone, true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_up_right, true);
			scr_text("* No clue! I told you it was far-fetched.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_laugh_lantern_left, true);
			scr_text("* ...", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down_left, false);
				scr_portrait_on_page(spr_pinkghost_concerned_lookaway);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
			scr_text("* I guess there's nothing to lose???", "mewmewghost", noone, noone, true);
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* That's the spirit.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_closed_eyes_left, false);
				scr_set_var_on_page(obj_mewmew, "ghosted", false);
				scr_char_move_on_page(obj_mewmew, spr_ghost_walkup, true, 0, -5, .2, 90);
			scr_text("* Body? Did you hear what we're gonna try?", "mewmewghost", noone, noone, true);
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_left, false);
				scr_ghost_on_page(obj_mewmew);
				scr_portrait_on_page(spr_pinkghost_concerned);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleleft, false);
			scr_text("* Yeah...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_obj_sprite_on_page(obj_othermewmew, spr_mewmew_wistful_corrupted, false);
				scr_portrait_tail_off();
			scr_text("* Let's try our best!", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_talkhappy_corrupted);
				scr_obj_sprite_on_page(obj_othermewmew, spr_mewmew_peace_corrupted, false);
			scr_text("* Be careful.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
			scr_text("* Remember, once you combine, you might experience whatever corruption is inside her.", "gerson");
			scr_text("* I don't care, I need to do this.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
			scr_text("* Go for it, then.", "gerson");
			scr_text("* Ready, body?", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleleft, false);
			scr_text("* I'm ready, mew...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_talkhappy_corrupted);
				scr_obj_sprite_on_page(obj_othermewmew, spr_mewmew_walkright_corrupted, false);
				scr_set_var_on_page(obj_mewmew, "ghosted", false);
				scr_snd_after_textbox(snd_fade, 1.1);
				scr_fade_after_textbox(c_white, true, 240); 
				scr_queue_movement_group_after_textbox([
				    { obj: obj_mewmew, sprite: spr_ghost_walkleft, loop: true, dx: -3.3, dy: 0, speed: .2, duration: 120 },
				    { obj: obj_othermewmew, sprite: spr_mewmew_walkright_corrupted, loop: true, dx: 8, dy: 0, speed: .2, duration: 120 }
				]);
		break;

		case "self_8":
			instance_destroy(obj_mewmew);
			instance_destroy(obj_othermewmew);
			instance_create_layer(440, 400, "Instances", obj_mewmew);
			audio_play_sound(snd_boost, 1, false);
			obj_gerson.sprite_index = spr_gerson_hammer_idle_lantern_down_left;
			obj_mewmew.ghosted = false;
			obj_mewmew.sprite_index = spr_mewmew_shocked_right_corrupted;
			obj_mewmew.light_on = true;
			obj_mewmew.light_radius = 150;
			obj_mewmew.depth = -102;
		    var _cam = view_camera[0];
		    var _cur_x = camera_get_view_x(_cam);
		    var _cur_y = camera_get_view_y(_cam);
    
		    // Shift the camera down by 40 pixels instantly
		    camera_set_view_pos(_cam, _cur_x, _cur_y + 80);			
		break;

		case "self_9":
			
			scr_text("* ...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_shocked);
				scr_portrait_tail_off();
				scr_obj_spawn_on_page(obj_wall, 400, 210, "Walls");
				scr_obj_spawn_on_page(obj_wall, 440, 210, "Walls");
			scr_text("* BODY!!!", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_relieved);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_overjoyed_corrupted, true);
			scr_text("* I'M SO HAPPY TO BE WITH YOU AGAIN!!!", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_relieved);
				scr_portrait_tail_off();
			scr_text("* Me too, mew!", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_talkhappy_corrupted);
			scr_text("* I've missed you so much...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_relieved_corrupted);
				scr_portrait_tail_off();
			scr_text("* That evil creature was torturing me, and I", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_wistful_corrupted, false);
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
				scr_text_cutoff_skip(44);
			scr_text("* Please don't worry about it anymore.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* We're gonna fix this.|* You and I. ", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_nya);
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_peace_corrupted, false);
			scr_text("* This corruption will NOT stand between us.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* We'll stand together and break free", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned_smirk);
				scr_text_cutoff_skip(37);
			scr_text("* Sorry to break up the reunion, but mind letting us out of here?", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_shocked_backwards_corrupted, false);
			scr_text("* Oh, sorry.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_shocked);
				scr_portrait_tail_off();
				scr_char_move_after_textbox(obj_mewmew, spr_mewmew_walkup_corrupted, true, 0, -10, .5, 60);
				scr_snd_after_textbox_delayed(snd_buttonpress, 1.1, 180);
				scr_snd_after_textbox_delayed(snd_buttonpress, 1.1, 300);
				scr_snd_after_textbox_delayed(snd_buttonpress, 1.1, 480);
				scr_snd_after_textbox_delayed(snd_impact, 1, 600);
		break;
		
		case "self_10":
			scr_text("* Well then.", "gerson");
			scr_set_var_after_textbox(obj_jevil, "in_cutscene", true);
			scr_queue_movement_group_after_textbox([
				    { obj: obj_gerson, sprite: spr_gerson_hammer_walkleft_lantern, loop: true, dx: 0, dy: 8, speed: .3, duration: 90 },
				    { obj: obj_spamton, sprite: spr_spamton_left, loop: false, dx: 0, dy: 9, speed: .5, duration: 90 },
					{ obj: obj_jevil, sprite: spr_jevil_left, loop: false, dx: 0, dy: 9, speed: .5, duration: 90 },
				]);
		break;
		
		case "self_11":
			scr_text("* S0.", "spamton");
				scr_set_var_on_page(obj_jevil, "in_cutscene", false);
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, false);
			scr_text("* NOW [Zillyhoo, Zillywut, n' Zillywigh]?", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_left, false);
			scr_text("* I think I know where... Friend might be...", "mewmew");
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_wistful_corrupted, false);
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* Then I guess we know where we're going next!", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_walkright_corrupted, false);
			scr_text("* Lead the way, Pink.", "gerson");
		break;
		
		case "self_12":
			scr_fade_warp_with_music(rm_two, 400, sng_flashback, 1, 1500, 2000, 180);
			global.song = sng_flashback;
			scr_set_dim_left(0);
			scr_set_dim_right(0);
		break;

		case "self_13":	
			scr_text("* It's... funny.", "mewmew");	
				scr_spawn_fade_in(obj_mewmew, 426.5, 150, "Instances", 0.03);
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_walkdown_silhouette, false);
				scr_set_var_on_page(obj_mewmew, "ghosted", false);
				scr_set_var_on_page(obj_mewmew, "light_on", false);
				scr_set_var_on_page(obj_gerson, "visible", false);
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* I didn't expect to be cornered by Friend, but...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* It was just... unexpected, mew...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I didn't know what the crystal really was at the time, but", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
				scr_text_cutoff_skip(60);
			scr_text("* None of us really know what it is still, Pink.", "gerson");
			scr_text("* That's not something to be upset about.", "gerson");
			scr_text("* I just...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
		break;
		
		case "self_14":
			scr_text("* ...", "mewmew");
				scr_spawn_fade_in(obj_othermewmew, 380, 150, "Instances", 0.03);
				scr_obj_sprite_on_page(obj_othermewmew, spr_ghost_walkright_silhouette, false);
				scr_set_var_on_page(obj_othermewmew, "ghosted", true);
				scr_set_var_on_page(obj_othermewmew, "visible", true);
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* Body, what is it?", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Do you ever wish that...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* You could be... like someone?", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* To have some sort of... model...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Someone you can base your life around.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Someone that, no matter what happens, will always stick by your side, regardless of the cost.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Before I... fused with you...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_walkleft_silhouette, false);
			scr_text("* That's what Friend promised to be.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* A friend.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* If I knew just how wrong that was...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Maybe, just maybe, I could have warned all of you in advance.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* But ever since we've been together...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* All I've felt is... guilt.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Love, and guilt.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Why didn't you feel like you could talk to me about this?", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I didn't want to put you in harm's way, mew...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I want to be with you so much, SO much...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I didn't think it would be fair for either of us if I told you about it.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* ...", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I know how you feel.|* In some capacity, at least.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* I've... lost out on helping others due to my emotions, too.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* And, well, you know how my emotions can spike.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* That I do, mew.", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Just...", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Know that I'm always there for you.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* And I will always be there for you as well.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Do you know that?", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Yes, mew...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* Good.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* ...", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* You're mine, body.|* And I'm yours.", "mewmewghost");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(noone);
				scr_portrait_tail_off();
		break;
		
		case "self_15":
		      scr_music_quiet(2);
		      scr_set_dim_left(.9);
		      scr_set_dim_right(.9);
		      scr_fade_out_character(obj_mewmew, 60);
		      scr_fade_out_character(obj_othermewmew, 60);
		      scr_fade_warp_with_music(rm_three, 400, sng_empty, , , , , [
		          scr_make_warp_spawn(obj_mewmew, 426.5, 450, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  ghosted = false;
		                  sprite_index = spr_mewmew_walkup_corrupted;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          })),
		          scr_make_warp_spawn(obj_gerson, 280, 260, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_gerson_hammer_idle_lantern_down_right;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  lantern_on = true;
						  light_on = true;
		              }
		          })),
				  scr_make_warp_spawn(obj_spamton, 560, 260, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_spamtonhands_left;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          })),
				  scr_make_warp_spawn(obj_jevil, 300, 350, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_jevil_right;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          }))
		      ]);
		break;
  
		case "self_16":    
			obj_mewmew.corrupted = true;
			scr_text("* Is this the place, Pink?", "gerson");
				scr_obj_spawn_on_page(obj_gerson, 280, 260, "Instances");
		        obj_gerson.image_speed = 0;
		        obj_gerson.image_index = 0;
		        obj_gerson.visible = true;
		        with (obj_gerson) {
				    lantern_on = true; 
				    light_on = true;
				}
			scr_text("* It must be, mew...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_concerned_corrupted);
			scr_text("* They went in here... when they were...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* Body, it's okay.|* We're here for you now.|* I'M here for you now.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* I know, I just...|* The corruption, it...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* Stand strong, Pink.", "gerson");
			scr_text("* We'll free you from whatever's going on once we clear our foremost issue.", "gerson");
			scr_text("* TIME TO DELIVER THE PAIN, PAIN!", "jevil");
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, true);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down, false);
			scr_text("* 1'M GONNA [Beat The Living Crap] 0UT OF TH4T [You're Not My Friend Anymore].", "spamton");
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
			scr_text("* All of us need to be very careful.", "gerson");
			scr_text("* Aside from waiting for the two of you to come last time,", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_closed_eyes_right, false);
			scr_text("* I stalled by trying to think of a way we can actually defeat this thing.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
			scr_text("* But they said that you would beat them easily???", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* Yeah, well.|* Wasn't remotely true.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down_right, false);
			scr_text("* It was just to tempt me to strike first.", "gerson");
			scr_text("* Plus, without our magic, it'll be especially difficult.", "gerson");
			scr_text("* WHY N0T JU5T GO [Dragon Blazers] ON [You're An A$$]?", "spamton");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
			scr_text("* Melee? Have you SEEN who's on our team?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_laugh_lantern_right, true);
			scr_text("* I'm an old man for crying out loud. I can't beat someone up with my hands.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
			scr_text("* Isn't a hammer considered melee too?", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* Not how I use it.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_laugh_lantern_right, true);
			scr_text("* WE MUST TRY OUR BEST, BEST!", "jevil");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down, false);
			scr_text("* IF WE DO NOT SUCCEED, IT IS BETTER THAN IF WE HAD NEVER TRIED AT ALL!", "jevil");
			scr_text("* That's some motivational logic you got there, Jevil.", "gerson");
			scr_text("* SO MUCH FREE TIME TO THINK WHEN YOU'RE FREE, FREE!", "jevil");
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, true);
			scr_text("* So.", "gerson");
				scr_obj_sprite_on_page(obj_jevil, spr_jevil_right, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_closed_eyes_right, false);
			scr_text("* Are we ready to dominate this sucker?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_down_right, false);
			scr_text("* HELL YEAH!!!", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
			scr_text("* Let's get 'em.", "gerson");
		break;
		
		case "self_17":
			scr_set_dim_left(.75);
		    scr_set_dim_right(.75);
			scr_fade_warp_with_music(rm_four, 600, sng_knightappear, .45, , , , [
					scr_make_warp_spawn(obj_knight, 340.5, 96, "Instances", method(undefined, function(_inst) {
					    with (_inst) {
					        visible = true;
					        sprite_index = spr_roark_faceaway; 
					        image_index = 8;
					        image_speed = 0;
        
					        // Skip straight to Phase 3 (bobbing + throttled shadows)
					        ball_phase = 3;
					        start_y = y;
					        bob_angle = 0;
					        shadow_timer = 0;
					    }
					})),
					scr_make_warp_spawn(obj_mewmew, 366, 350, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  ghosted = false;
		                  sprite_index = spr_mewmew_walkup_corrupted;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          })),
		          scr_make_warp_spawn(obj_gerson, 486, 325, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_gerson_hammer_idle_lantern_back_right;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  lantern_on = true;
						  light_on = true;
		              }
		          })),
				  scr_make_warp_spawn(obj_spamton, 246, 350, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_spamton_lookup;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          })),
				  scr_make_warp_spawn(obj_jevil, 606, 350, "Instances", method(undefined, function(_inst) {
		              with (_inst) {
		                  sprite_index = spr_jevil_back;
		                  image_speed = 0;
		                  image_index = 0;
		                  visible = true;
		                  light_on = true;
		              }
		          }))
		      ]);
			  global.song = sng_knightappear;
		break;
		
		case "self_18":
			scr_text("* So THAT'S how you hellbringers have been spying on us.", "gerson");
			scr_text("* I'd ask how a connection was set up between different Dark Worlds, but...", "gerson");
			scr_text("* I'd prefer you just terminate it in general.", "gerson");
			scr_text("* TH1S I5 A [Please Read The Terms And Conditions]!!!", "spamton");
			scr_text("* AND TO THINK, I WAS ALONE IN MY FREEDOM, FREEDOM!", "jevil");
			scr_text("* Were you watching us when...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_concerned_corrupted);
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* Why didn't you help us, Knight?", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* That's a darn good question, Pink.", "gerson");
			scr_text("* Got an answer, coward?", "gerson");
			scr_text("* Or you wanna keep breaching privacy laws with your orbs", "gerson");
				scr_text_cutoff(57);
		break;
		
		case "self_19":
		    scr_text("* Why are you here...", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
		    global.knight_turning = true;
		    with (obj_knight)
		    {
		        visible = true;
		        sprite_index = spr_roark_faceaway_turning;
		        image_index = 0;
		        image_speed = 1;
		    }
			scr_text("* We're not looking for a fight, Knight.|* You don't want to do this.", "gerson");
			scr_text("* I told you to be wary, old man.", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* You did nothing of the sort.", "gerson");
			scr_text("* You come late to the meeting, and then what?", "gerson");
			scr_text("* You go back here to spy on us?|* What's wrong with you?", "gerson");
			scr_text("* Your judgement is skewed.", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* I may be going senile, but my judgement is as sharp as ever, thank you very much.", "gerson");
			scr_text("* We don't have time for this.", "gerson");
			scr_text("* Be on your guards, people.", "gerson");
		break;
		
		case "self_20":
			with (obj_knight)
			   {
			       sprite_index = spr_roark_droop_up;
			       image_index = 0;
			       image_speed = 1;
			   }
			scr_text("* So be it.", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
		break;
		
		case "self_21":
			instance_create_depth(0, 0, -5000, obj_UI);
			global.song = { sound: sng_blackknife, beats: 9999 };
		    global.music = audio_play_sound(sng_blackknife, 1, true, .9);
		    global.song_start = current_time;
		break;
		
		case "self_22":
			
		break;
		
		case "self_23":
			scr_text("* ???????", "mewmewghost", , , true);
				scr_portrait_on_page(spr_pinkghost_shocked);
				scr_portrait_tail_off();
			scr_text("* Whatever we're looking for has clearly found us first.", "gerson");
			scr_text("* Let me tell you the plan", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
				scr_text_cutoff_skip(26);
			scr_text("* So, who ratted me out?", "friend");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookback_left, false);
				scr_obj_sprite_after_textbox(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
				scr_obj_spawn_after_textbox(obj_friend, 865, 255, "Instances");
				scr_set_var_after_textbox(obj_friend, "image_xscale", 2);
				scr_set_var_after_textbox(obj_friend, "image_yscale", 2);
				scr_queue_movement_group_after_textbox([
				    { obj: obj_friend, sprite: spr_friendmew_norm_walkleft, loop: true, dx: -10, dy: 0, speed: .2, duration: 75 },
				    { obj: obj_friend, sprite: spr_friendmew_norm_walkleft, loop: false, dx: 0, dy: 0, speed: 0, duration: 0 }
				]);
		break;
		
		case "self_24":
			global.song = { sound: sng_darkpink, beats: 9999 };
		    global.music = audio_play_sound(sng_darkpink, 1, true, .9);
		    global.song_start = current_time;
			scr_text("* And why would I tell you that?", "gerson");
			scr_text("* Only a select few know where this bunker is, and less know the code.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* I take it neither of you NEEDED the code, however, but alas.", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
			scr_text("* What I am truly interested in is, well...", "friend");
				scr_portrait_on_page(spr_friendmew_talk_look_left);
			scr_text("* Why?", "friend");
				scr_portrait_on_page(spr_friendmew_questioning);
			scr_text("* Both of you... or... at least ONE of you knows the dangers of arriving here.", "friend");
				scr_portrait_on_page(spr_friendmew_talk_look_left);
			scr_text("* You even claimed to know my superiors, Gerson.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* So why venture here?", "friend");
				scr_portrait_on_page(spr_friendmew_questioning);
			scr_text("* FOR MY BODY, YOU JERK!!!", "mewmewghost", , , true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_tail_off();
			scr_text("* Ah, Pink.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* You would not want it back even if I handed it to you on a silver platter.", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
			scr_text("* WHAT DID YOU DO TO HER???", "mewmewghost", , , true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_tail_off();
			scr_text("* Nothing that wasn't already in process before|  I got here.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* The 'corruption', as you call it, is already spreading through it.", "friend");
				scr_portrait_on_page(spr_friendmew_talk_look_left);
			scr_text("* I wish you the best in trying to relieve it of its curse.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* You're a monster, you know that?", "gerson");
			scr_text("* Aren't we all, Hammer?", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
			scr_text("* ...", "gerson");
			scr_text("* Pink, are you ready to fight this thing?", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookback_right, false);
			scr_text("* I'M SO", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_tail_off();
				scr_text_cutoff_skip(8);
			scr_text("* Listen, if you TRULY wish to squabble with me...", "friend");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_left, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
				scr_portrait_on_page(spr_friendmew_questioning);
			scr_text("* I will not strike you until your first attack.", "friend");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right_idle, true);
				scr_portrait_on_page(spr_friendmew_talk_look_left);
			scr_text("* I may be 'corrupt', but I know where your true desire in this lies, Gerson.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* Let's see your 'pure' justice shine through YOUR wanted outcome!", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
			scr_text("* ...", "gerson");
				scr_obj_sprite_after_textbox(obj_friend, spr_friendmew_laugh, true);
				scr_call_after_textbox(function() { audio_stop_sound(global.music); }, 0);
				scr_snd_after_textbox(snd_friendlaugh, 1);
		break;
		
		case "self_25":
			scr_snd_after_textbox(snd_taking_out_sword, 1);
			scr_obj_sprite_after_textbox(obj_mewmew, spr_ghost_battle_right, true);
		break;
		
		case "self_26":
			global.song = { sound: sng_cmmmbutdestroyed, beats: 9999 };
		    global.music = audio_play_sound(sng_cmmmbutdestroyed, 1, true);
		    global.song_start = current_time;
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
			obj_friend.sprite_index = spr_friendmew_battleidle;
			var pink = obj_mewmew;
			var gerson = obj_gerson;
			var friend = obj_friend;
			var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [
			    {
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_3, delay: 30 },
			            { sprite: spr_UI_SCP_1, snd: snd_select_reverb, delay: 30 },
			            { sprite: spr_UI_SCP_2, snd: snd_select_reverb, delay: 30 }
			        ]
			    },
		        { type: "talk", batch: [ { speaker: friend, text: "Come on Gerson, where's your moxy at?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "You know you can beat me easily.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "So strike me down!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "I..." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "WHAT ARE WE WAITING FOR???" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right_idle },
				{ type: "sprite", target: obj_gerson, new_sprite: spr_gerson_hammer_idle_lantern_lookback_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "Not yet, Pink." } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "..." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_battle_right },
				{ type: "sprite", target: obj_gerson, new_sprite: spr_gerson_hammer_idle_lantern_right },
		        { type: "attack", kind: "custom", start_func: scr_start_friend_laugh_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_3, delay: 30 },
			            { sprite: spr_UI_SCP_1, snd: snd_select_reverb, delay: 30 },
			            { sprite: spr_UI_SCP_2, snd: snd_select_reverb, delay: 30 }
			        ]
			    },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "talk", batch: [ { speaker: friend, text: "I sense some hesitation.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Is it fear of harming my vessel?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "There is nothing to worry about, my friend. This body is invulnerable to physical damage.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "But I have a feeling you knew that already.", keep_animating: true } ] },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_laugh_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_3, delay: 30 },
			            { sprite: spr_UI_SCP_1, snd: snd_select_reverb, delay: 30 },
			            { sprite: spr_UI_SCP_2, snd: snd_select_reverb, delay: 30 }
			        ]
			    },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "Seriously, Gerson, why are we just standing here???" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "My body is corrupting further while we're doing zilch about it!!!" } ] },
				{ type: "sprite", target: obj_gerson, new_sprite: spr_gerson_hammer_idle_lantern_closed_eyes_left },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right_idle },
				{ type: "talk", batch: [ { speaker: gerson, text: "Quiet, Pink." } ] },
				{ type: "sprite", target: obj_gerson, new_sprite: spr_gerson_hammer_idle_lantern_lookback_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "I'm concentrating." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "ON??????????" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right_idle },
				{ type: "talk", batch: [ { speaker: gerson, text: "Just wait a little bit longer." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_battle_right },
				{ type: "sprite", target: obj_gerson, new_sprite: spr_gerson_hammer_idle_lantern_right },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_laugh_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_3, delay: 30 },
			            { sprite: spr_UI_SCP_1, snd: snd_select_reverb, delay: 30 },
			            { sprite: spr_UI_SCP_2, snd: snd_select_reverb, delay: 30 }
			        ]
			    },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "talk", batch: [ { speaker: friend, text: "I'm beginning to grow tired of this standing around.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "No patience, huh?" } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_laugh },
				{ type: "talk", batch: [ { speaker: friend, text: "You could say that.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "talk", batch: [ { speaker: gerson, text: "Why don't you strike first, then? You don't seem to be in any capacity to receive damage, so why not deal?" } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "As I told you before, Hammer, this is not a battle I wish to partake in.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "We both know this will end in a stalemate before anyone makes a move.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Is this truly worth either of our whiles?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "If you give Pink's body back, I'd be more than obliged to call it quits now." } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_laugh },
				{ type: "talk", batch: [ { speaker: friend, text: "Oh, how you love to humor me, Gerson!", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "talk", batch: [ { speaker: friend, text: "As stated earlier, this body is mostly at its peak 'corrupted' state already.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Why would you want this souvenir of darkness back? Is it really worth that much in familial value to you?", keep_animating: true } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "SHE'S MINE, YOU IDIOT!!!" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right_idle },
				{ type: "talk", batch: [ { speaker: friend, text: "Yours, mine, it's all just a title. She's really just a vessel to share.", keep_animating: true } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "YOU SAID THAT BEFORE ALREADY!!! AND IT'S NOT TRUE!!!" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right_idle },
				{ type: "talk", batch: [ { speaker: friend, text: "So you say, Pink. So you say.", keep_animating: true } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_battle_right },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_laugh_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_3, delay: 30 },
			            { sprite: spr_UI_SCP_1, snd: snd_select_reverb, delay: 30 },
			            { sprite: spr_UI_SCP_2, snd: snd_select_reverb, delay: 30 }
			        ]
			    },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friendmew_battleidle },
				{ type: "talk", batch: [ { speaker: friend, text: "Listen, if we don't mind, I have other important matters to return to.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "This battle is not progressing anywhere, so...", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Adieu yet again, my friends.", keep_animating: true } ] },
		        // add more talk/attack pairs as you write more dialogue/attacks
		    ];		
		break;
		
		case "self_27":
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* WE'RE NOT LETTING YOU GET AWAY!!!", "mewmewghost", , , true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_tail_off();
				scr_obj_sprite_on_page(obj_friend, spr_friendmew_norm_walkleft, false);
			scr_text("* So be it! I'll be further down the hall when you need me.", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
				scr_char_move_after_textbox(obj_friend, spr_friendmew_norm_walkright, true, 7, 0, .15, 60);
		break;
		
		case "self_28":
			scr_text("* H3Y! YOU [Cutie_Mew_Mew_Magic.mp3]!", "spamton");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_left, false);
				scr_char_move_on_page(obj_friend, spr_friendmew_norm_walkright, false, 0, 0, 0, 0);
			scr_text("* Hmm?", "friend");
				scr_obj_sprite_after_textbox(obj_friend, spr_friendmew_norm_walkleft, false);
				scr_obj_spawn_after_textbox(obj_spamton, -110, 210, "Instances");
				scr_char_move_after_textbox(obj_spamton, spr_spamton_right, false, 13, 0, .3, 120);
		break;
		
		case "self_29":
			scr_text("* Spamton? I thought you were hiding from me?", "friend");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
			scr_text("* I'M N0T SCARED OF YOUR [cat and mouse] ROUTINE ANY[Neverland].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, false);
			scr_text("* ALS0, [these here hooligans] BLACKMA1LED ME TO H3LP.", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonlaughright, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_shocked_left, false);
			scr_text("* We WHAT???", "mewmewghost", , , true);
				scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_left, true);
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_yelling_right, true);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
			scr_text("* Don't worry about it, Pink.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_lookback_right, false);
			scr_text("* ANYWAYS.", "spamton");
				scr_obj_sprite_on_page(obj_mewmew, spr_ghost_idleright, false);
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_right, false);
			scr_text("* 1 HAVE A F3W cHOICE WORDS FOR YOU, Y0U [Scallywag].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, true);
			scr_text("* YOU'RE A [Hyperlink Blocked].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, true);
			scr_text("* YOUR A [Hyperlink Blocked].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, true);
				scr_text_speaker_shake(.6, 1.5);
			scr_text("* YOU. L1TTLE. [Hyperlink Blocked].", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right_dark, true);
				scr_text_speaker_shake(.8, 1.5);
			scr_text("* Shame on you, Spamton.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
			scr_text("* Didn't your mother ever tell you not to use hyperlinks in public?", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
				scr_obj_sprite_after_textbox(obj_friend, spr_friendmew_laugh, true);
				scr_snd_after_textbox(snd_friendlaugh, 1);
		break;
			
		case "self_30":
		    scr_text("* ...", "spamton");
		    scr_text("* I [Burned The House Down].", "spamton");
		        scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, false);
		    scr_text("* ...", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
		        scr_obj_sprite_on_page(obj_friend, spr_friendmew_laugh, false);
		    scr_text("* What?", "friend");
				scr_portrait_on_page(spr_friendmew_questioning);
		        scr_obj_sprite_on_page(obj_friend, spr_friendmew_norm_walkleft, false);
		    scr_text("* THE [Don't Commit Arson] W4S [Take It Away From Me].", "spamton");
		    scr_text("* What are you saying?", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
		    scr_text("* Y0U [Liar Liar, Pants on Fire] COMM1TTED [Kitchen Gun].", "spamton");
		        scr_obj_sprite_on_page(obj_spamton, spr_spamtonhands_right, false);
		    scr_text("* You aren't making too much sense here, Spamton.", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
		    scr_text("* That is expected, of course.|* But still.", "friend");
				scr_portrait_on_page(spr_friendmew_smiley);
		    scr_text("* [Joe Mama] IS [!$?#].", "spamton");
		    scr_text("* Insults? That's what we're resorting to?", "friend");
				scr_portrait_on_page(spr_friendmew_questioning);
		    scr_text("* N0PE.", "spamton");
		    scr_text("* JU5T A [Distraction Dance].", "spamton");
		        scr_obj_sprite_on_page(obj_spamton, spr_spamtonlaughright, true);
		    scr_text("* Hm?", "friend");
				scr_portrait_on_page(spr_friendmew_talk);
		        scr_obj_sprite_on_page(obj_spamton, spr_spamton_armsout_right, false);
		    scr_text("* Check your meter, Friend.", "gerson");
		        scr_custom_call_after_textbox_delayed(scr_doki_bar_show, 0);
				scr_obj_sprite_after_textbox_delayed(obj_friend, spr_friendmew_norm_walkright, false, 90);
		break;
		
		case "self_31":
			scr_text("* ...How?", "friend");
				scr_portrait_on_page(spr_friendmew_questioning);
			scr_text("* Some pre-planning.", "gerson");
		break;
		
		case "self_32":
			scr_fade_warp_with_music(rm_four, 60, sng_empty);
		break;
		
		case "self_33":
			audio_stop_all();
			global.song = { sound: sng_cmmmbutdestroyed, beats: 9999 };
		    global.music = audio_play_sound(sng_cmmmbutdestroyed, 1, true, 1, 0, 1.225);
		    global.song_start = current_time;
			scr_text("* What the hell...?", "friend");
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* Do you really think this will work on me?", "friend");
			scr_text("* It's worth a shot.", "gerson");
			scr_text("* Pink, try to connect with your body in some way.|* Kick the evil out of it.", "gerson");
			scr_text("* I...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_sad)
				scr_portrait_tail_off();
			scr_text("* Body, please...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_sad)
				scr_portrait_tail_off();
			scr_text("* I know you're still in there..", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned)
				scr_portrait_tail_off();
			scr_text("* I need you...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_sad)
				scr_portrait_tail_off();
			scr_text("* ...mew...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_sad)
				scr_portrait_tail_off();
			scr_text("* Grovelling will not get you anywhere, Pink.|* This body is mine.", "friend");
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_talk);
			scr_text("* Heh.", "gerson");
			scr_text("* Can I help you, Hammer?", "friend");
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_questioning);
			scr_text("* Yeah. Try not to get TOO tired.", "gerson");
			scr_text("* Hm?", "friend");
				
		break;
		
		case "self_34":
			audio_stop_all();
			scr_snd_on_textbox(snd_hypnosis, 1);
			scr_text("* Thanks, Jevil.", "gerson");
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_talk);
			scr_text("* OF COURSE! MY PLEASURE, PLEASURE!", "jevil");
			scr_text("* I...", "friend");
			scr_text("* Was that a whiff of hypnosis?", "friend");
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_talk_look_left);
			scr_text("* How did you...", "friend");
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_talk);
			scr_text("* You shouldn't all be here.", "friend");
			scr_text("* Alas.", "friend");
			scr_text("* Alas?", "gerson");
			scr_text("* If this is truly what you all want, who am I to stand in your way?", "friend");
				scr_set_var_on_page(obj_datingsim_inverted, "portrait", spr_friendmew_smiley);
		break;
		
		case "self_35":
			instance_deactivate_layer("Instances");
			audio_play_sound(snd_impact, 1, false);
			scr_fade_warp_with_music(rm_five, 60, sng_empty);
			
		break;
		
		case "self_36":
			obj_textbox.hide_box_sprite = false;
			instance_activate_layer("Instances");
			scr_text("* IT WAS THAT EASY???", "mewmewghost");		
				scr_portrait_on_page(spr_pinkghost_angry)
				scr_portrait_tail_off();
			scr_text("* Better I don't fall asleep out of boredom then risk losing this vessel.", "friend");
			scr_text("* BODY!!! ARE YOU OKAY???", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_yelling)
				scr_portrait_tail_off();
			scr_text("* I've... felt better... mew...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* I applaud all of you for your coordination.|* Very impressive.", "friend");
			scr_text("* You would all do very well on the side of good.", "friend");
			scr_text("* Good?", "gerson");
			scr_text("* Let me tell you something about 'good', Friend.", "gerson");
			scr_text("* 'Good' is when the world is changed for the positive from a string of actions.", "gerson");
			scr_text("* If your version of 'good' is to follow the prophecy, you may do so on your own time.", "gerson");
			scr_text("* But if the path you choose is one of violence,", "gerson");
			scr_text("* You will be heartily mistaken on your definition of 'good'.", "gerson");
			scr_text("* Very intellectual, Hammer.|* Thank you for those brilliant words.", "friend");
			scr_text("* One more thing, though.", "friend");
			scr_text("* I assume none of you were ever told that Shadow Crystals allow us here to use others' magic attacks?", "friend");
				scr_custom_call_after_textbox_delayed(scr_spadechunk_show, 0);
				scr_obj_sprite_after_textbox_delayed(obj_spamton, spr_spamton_hurt, false, 60);
				scr_obj_sprite_after_textbox_delayed(obj_jevil, spr_jevil_right_neutral, false, 60);
		break;
		
		case "self_37":
			with (obj_textbox)
				{
				    hide_box_sprite = false;
				}		
			scr_text("* Have fun in hell, the four of you.", "friend");
			scr_fade_out_to_black();
		break;
		
		case "self_38":
			scr_snd_after_textbox(snd_hurt1, 1);
		break;
		
		case "self_39":
			scr_snd_after_textbox(snd_hurt1, 1);
		break;
		
		case "self_40":
			scr_snd_after_textbox(snd_hurt1, 1);
		break;
		
		case "self_41":
			scr_snd_after_textbox(snd_hurt1, 1);
		break;
	}
		/*array_push(obj_cutscenehandler_midfightattacks.after_textbox_queue, {
			type: "tenna_battle_intro"
			});*/
				
	
		/* Warp Code:
		if (instance_exists(obj_cutscenehandler_midfightattacks))
			    {
			        obj_cutscenehandler_midfightattacks.waiting_for_warp = true;
			    }
		*/
		
		/* Pitching Music:
			global.song = { sound: sng_?, bpm: ?, beats: ? };
			global.music = audio_play_sound(sng_?, 1, true);
			audio_sound_pitch(global.music, 0.7);
			global.song_start = current_time;
		*/
		/* Summoning UI (Not in battle):
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    audio_stop_all();
		    global.song = { sound: sng_cmmm, bpm: 130, beats: 9999 };
			global.music = audio_play_sound(sng_cmmm, 1, true);
			audio_sound_pitch(global.music, 1.25);
			global.song_start = current_time;
		*/
		
		/* Movement Queue:
			scr_queue_movement_group_after_textbox([
				   { obj: obj_gerson, sprite: spr_gerson_hammer_walkright_lantern, loop: true, dx: 15, dy: 3, speed: .2, duration: 75 },
				   { obj: obj_mewmew, sprite: spr_ghost_shocked_left, loop: false, dx: 0, dy: -10, speed: .2, duration: 75 }
			]);
		*/
		
		// Battle Example:
		/* case "self_18":
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    obj_UI.sprite_index = spr_UI_Pink;
			obj_mewmew.sprite_index = spr_ghost_shocked_left;
		    var pink = obj_mewmew;
		    var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "Hey! Hey!!! HEY!!!"} ] },
				{ type: "talk", batch: [ { speaker: pink, text: "GERSON!!! I'M ON YOUR SIDE!!!" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHAT'S GOING ON???" } ] },
		        { type: "attack", attacker: obj_sound_of_justice, data: global.atk_sound_of_justice_hammers },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "DIDN'T WE PLAN TO DO THIS???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHY ARE YOU ATTACKING ME???" } ] },
		        { type: "attack", kind: "custom", start_func: scr_start_giant_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "talk", batch: [ { speaker: pink, text: "You know I can't take damage... right???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So... quit it!!!" } ] },
				{ type: "attack", kind: "custom", start_func: scr_start_falling_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "We need to... find my body..." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "Damn it, Gerson, don't you double-cross me too!!!" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_shocked_left },
				{ type: "attack", kind: "custom", start_func: scr_start_gavel_slam_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "Come on, Gerson. I don't want to fight you." } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So stop fighting me..." } ] },
		        // add more talk/attack pairs as you write more dialogue/attacks
		    ];		
		break;
		
		case "self_19":
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* Please...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_scared);
	        scr_portrait_tail_off();
	        scr_snd_after_textbox(snd_sojlaugh, 1);
	        scr_obj_sprite_after_textbox(obj_sound_of_justice, spr_sound_of_justice_laugh, true);
	        scr_custom_call_after_textbox_delayed(scr_spawn_soj_hit_hammer, 113); // mid-laugh hammer hit
			scr_obj_sprite_after_textbox_delayed(obj_mewmew, spr_ghost_shocked_left, false, 120);
	        scr_custom_call_after_textbox_delayed(scr_start_pan_and_reveal_left, 150); // shortly after the hit
		break;
	*/
}