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
			scr_text("* Pink, seeing as you can't take physical damage, you're our best bet on recieving it.", "gerson");
			scr_text("* Is that alright?", "gerson");
			scr_text("* All good with us, mew!", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_talkhappy_corrupted);
			scr_text("* Alright.", "gerson");
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
			scr_text("* AND I THOUGHT I WAS ALONE IN MY FREEDOM, FREEDOM!", "jevil");
			scr_text("* Were you watching us when...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_concerned_corrupted);
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_sad_corrupted);
				scr_portrait_tail_off();
			scr_text("* Why didn't you help us, Knight?", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned);
			scr_text("* That's a darn good question, Pink.", "gerson");
			scr_text("* Got an answer, coward?", "gerson");
			scr_text("* Or you wanna keep breaching privacy laws with your orbs?", "gerson");
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
		    global.fight_seq_starting = true;
		    global.song = { sound: sng_blackknife, beats: 9999 };
		    global.music = audio_play_sound(sng_blackknife, 1, true, .9, 0, .8);
		    global.song_start = current_time;
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    obj_UI.sprite_index = spr_UI_SCP_full_1;
			obj_mewmew.sprite_index = spr_mewmew_walkup_corrupted;
		    var pink = obj_mewmew;
			var gerson = obj_gerson;
			var spamton = obj_spamton;
			var jevil = obj_jevil;
			var friend = obj_friend;
		    var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: gerson, text: "Let's give it all we got.", no_animate: true} ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Oh no you don't, my friend.", no_animate: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "This is MY encounter.", no_animate: true } ] },
				{ type: "fist_slam", target: obj_knight },
		    ];		
		break;
		
		case "self_22":
			obj_mewmew.sprite_index = spr_mewmew_shocked_backwards_corrupted;
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* WHAT THE...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_shocked);
				scr_portrait_tail_off();
			scr_text("* What, you think I didn't PLAN for this?", "friend");
				scr_call_trigger_object_fade_on_page(obj_friend, spr_friend_lookforward, 1, 416.5, 79, 0.02);
				scr_snd_after_textbox(snd_friendlaugh, 1);
				scr_obj_sprite_after_textbox(obj_friend, spr_friend_laugh, true);
		break;
		
		case "self_23":
			global.friend_theme = audio_play_sound(sng_friends, 1, false, 0);
			audio_sound_gain(global.friend_theme, 0, 0);
			audio_sound_gain(global.friend_theme, 1, 2000);
			scr_song_loop_track(global.friend_theme, 0, 38.4);
			scr_text("* You are all highly intelligent beings.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown, false);
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_walkup_corrupted, false);
			scr_text("* I figured you would find your way out of those cells one way or another.", "friend");
			scr_text("* How did you do it without magic, I wonder?", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* Clipping, perchance?", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_left, false);
			scr_text("* So, you've been watching us too, huh?", "gerson");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* Oh, come on, Hammer.", "friend");
			scr_text("* You know I wouldn't just LET you wander around here on your own free will.", "friend");
			scr_text("* Who knows what secrets you might uncover!", "friend");
			scr_text("* To your own detriment, of course.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_smiley, false);
			scr_text("* All I know is that you need the walloping of your life, Friend.", "gerson");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* ...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned_lookaway);
			scr_text("* Oh, it's their name", "mewmewghost");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_left, false);
				scr_portrait_on_page(spr_pinkghost_concerned);
				scr_text_cutoff_skip(21);
			scr_text("* Me? Fight with you?", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* Didn't we try this already, Gerson?", "friend");
			scr_text("* You had an unfair advantage.", "gerson");
			scr_text("* It didn't seem worth my time to attack something knowing it'd be a", "gerson");
				scr_text_cutoff_skip(68);
			scr_text("* I'm sorry, did you just say UNFAIR?", "friend");
			scr_text("* Aren't you, by your own definition, the Hammer of JUSTICE?", "friend");
			scr_text("* Unfairness is something you should be verily used to by now.", "friend");
			scr_text("* How self-deprecating can you be that your own purpose can so easily be tossed to the side at whim?", "friend");
			scr_text("* Who are you to tell me about my purpose?", "gerson");
			scr_text("* My GOAL is to act as the Ink, allowing others to write their stories how THEY want them to be.", "gerson");
			scr_text("* YOU, on the other hand, are the opposite.", "gerson");
			scr_text("* You are an eraser, a smudge, the correction tape used to destroy innocent peoples' tales.", "gerson");
			scr_text("* And for what gain?", "gerson");
			scr_text("* Do you enjoy harming others?", "gerson");
			scr_text("* Is it all just a game to you?", "gerson");
			scr_text("* Hammer, we both know that this is truly just a", "friend");
				scr_text_cutoff_skip(48);
			scr_text("* I'm not done, you bastard.", "gerson");
				scr_obj_sprite_on_page_delayed(obj_mewmew, spr_mewmew_shocked_backwards_corrupted, false, 0, 60);
			scr_text("* ...", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_shocked_corrupted);
				scr_portrait_tail_off();
			scr_text("* Ouch.", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_concerned_smirk);
			scr_text("* I don't know what they paid you with to take this job, but clearly you fit in perfectly here.", "gerson");
				scr_obj_sprite_on_page(obj_mewmew, spr_mewmew_walkup_corrupted, false);
			scr_text("* You and all these other... bringers of hell.", "gerson");	
		break;
		
		case "self_24":
			if (variable_global_exists("friend_theme") && audio_is_playing(global.friend_theme))
			{
			    audio_sound_gain(global.friend_theme, 0, 1000);
			    call_later(1, time_source_units_seconds, method({ _snd: global.friend_theme }, function() {
			        if (audio_is_playing(_snd)) { audio_stop_sound(_snd); }
			    }));
			}
		    scr_fade_out_to_black(c_black, true, 0);
		break;
		
		case "self_25":
			scr_text("* ...", "gerson");
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* I remember the Knight when they lived in the Light World, normally.", "gerson");
			scr_text("* I didn't really see them around, especially because I kicked the bucket prior, but...", "gerson");
			scr_text("* They would plant flowers by the graves sometimes.|* Mine and others.", "gerson");
			scr_text("* At least, that's what my son wrote to me in his letters that I read when my Dark World was created.", "gerson");
			scr_text("* They were... normal.|* A good person.", "gerson");
		break;
		
		case "self_26":
			global.friend_theme = audio_play_sound(sng_friends, 1, false, 0);
			audio_sound_gain(global.friend_theme, 0, 0);
			audio_sound_gain(global.friend_theme, 1, 2000);
			scr_song_loop_track(global.friend_theme, 0, 38.4);
		    if (instance_exists(obj_cutscenefade))
		    {
		        obj_cutscenefade.fade_target = 0;
		    }
		break;
		
		case "self_27":
			scr_text("* But YOU.", "gerson");
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", false);
			scr_text("* You and your side of 'good' turned them into THAT.", "gerson");
			scr_text("* [Hey, Old Man], AR3 WE GONNA FIGHT thIS [Catastrophe] OR N0T???", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_right, false);
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_far_left, false);
			scr_text("* What is your point in all of this, Hammer?", "friend");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_lookup, false);
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* I give up trying to prove that you don't know what 'good' really is.", "gerson");
			scr_text("* But to define MY purpose?|* That is not how the Prophecy treats our situation at hand.", "gerson");
			scr_text("* Fate is fickle, Hammer, but it can be easily rewritten.", "friend");
			scr_text("* Or at least edited.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_smiley, false);
			scr_text("* Editing is one thing.|* Deleting is another.", "gerson");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* You bore me, my friend.", "friend");
			scr_text("* If you wish to quarrel, let us do so.", "friend");
			scr_text("* In fact, if you think it is STILL unfair...", "friend");
			scr_text("* I will gladly bestow all of your magic back.", "friend");
			scr_text("* Just so the complaints cease.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_smiley, false);
				scr_obj_sprite_after_textbox(obj_friend, spr_friend_lookforward, false);
				scr_sparkle_heroes_after_textbox([obj_gerson, obj_mewmew, obj_spamton, obj_jevil]);
		break;
		
		case "self_28":
			scr_text("* THIS SEEMS LIKE A TRICK, TRICK!", "jevil");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_far_right, false);
			scr_text("* HOW DO WE KNOW THAT IT WON'T BECOME UNBESTOWED AT A CRUCIAL MOMENT?", "jevil");
			scr_text("* Alas, you will just have to trust me, my friends.", "friend");
			scr_text("* Trust is something you earn, not something you request.", "gerson");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_right, false);
			scr_text("* And what a valid point that is, Hammer!", "friend");
			scr_text("* But don't you worry, Jevil.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_far_right, false);
			scr_text("* I have other tricks coursing through me.|* Your magic will not deter those.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_smiley, false);
			scr_text("* I bid you all the best of luck.", "friend");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookforward, false, 1);
			scr_text("* SHUT IT!!!", "mewmewghost");
				scr_obj_sprite_on_page(obj_friend, spr_friend_lookdown_left, false);
				scr_portrait_on_page(spr_pinkghost_angry);
				scr_portrait_tail_off();
			scr_text("* If you say so, Pink.|* If you say so.", "friend");
		break;
		
		case "self_29":
			scr_snd_after_textbox(snd_friendlaugh, 1);
			scr_obj_sprite_after_textbox(obj_friend, spr_friend_laugh, true);
			scr_fist_split_after_textbox(120, , );
			scr_audio_fade_out(global.friend_theme, 300);
		break;
		
		case "self_30":
		    global.song = { sound: sng_wnf, beats: 9999 };
		    global.music = audio_play_sound(sng_wnf, 1, false, 1.225);
		    global.song_start = current_time;
		    scr_song_loop_track(global.music, 0, 155.13);
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
			obj_friend.sprite_index = spr_friend_lookdown_animated;
			var pink = obj_mewmew;
			var gerson = obj_gerson;
			var friend = obj_friend;
			var jevil = obj_jevil;
			var spamton = obj_spamton;
			var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [

			// ATTACK 1
			    {
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
		        { type: "talk", batch: [ { speaker: friend, text: "So you finally choose to meet your demise.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Officially, that is.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "I'm proud of all of you for standing up for what you truly believe in.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "talk", batch: [ { speaker: friend, text: "But I can't help but wonder why you're so against battling the Prophecy.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "None of you are the Prince. None of you need to follow your strict paths.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "These crystals were meant to enlighten you, not turn you away from carving a new direction.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "If this is how you wish to repay me, however, so be it.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
		        { type: "attack", kind: "custom", start_func: scr_start_friend_attack1 },
							
				// ATTACK 2
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "Repayment is not the correct word to describe this.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "Probably something more like...", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Revenge?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "I was going more for justice, but if that's what you wanna call it.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack2 },
				
				// ATTACK 3
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "THIS RE4LLY IS JUST ALL A [Fun for the whole family] T0 YOU.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "And why shouldn't it be? ", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "Breaking the rules should at least allow for a little fun in our lives, so why not jump on the opportunity?", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "Your perspective on all of this is deranged.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Good luck trying to convince me otherwise, Hammer.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "The fun is just getting started!", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack3 },
				
				// ATTACK 4
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_right },
				{ type: "talk", batch: [ { speaker: jevil, text: "WHY PROMISE FREEDOM WHEN ALL YOU DELIVER IS A CELL, CELL?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Good question, Jevil.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Take our nightmarish friend for example.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "[Nuh Uh]!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "...", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_right },
				{ type: "talk", batch: [ { speaker: friend, text: "He was given true freedom, and what does he use it for?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "To battle the Cage in a pixelated world of doom?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "I had to make sure they didn't screw up too much, and yet alas, the human was easily able to defeat them and acquire the Shadow Mantle.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Some choose to express their freedom in ways others can't begin to perceive. ", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "You should know that, Jevil.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: jevil, text: "THAT IS NOT THE ANSWER TO MY QUERY, QUERY!", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "Not the answer you want, perhaps. But the answer you need.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack4 },
				
				// ATTACK 5
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "Y0U KEEP D1GGING FOR [Rosen Graves], BUT YOUR SUCH A [Shmoes and Daves] THAT YOU KEEP [You Get An F].", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "WHY DO Y0U KEEP [do it again]?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "I don't see any of this as failing, Spamton.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "In fact, while we're battling here, those from Castle Town are off in their own mess as we speak.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "What did you do?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Do not fret, Hammer. I assume you'll hear about it from your protege soon enough.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "...", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack5 },
				
				// ATTACK 6
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: friend, text: "You know what my 'employer' said to me before all of this, Gerson?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "They said that this was all for good, and that life would become exponentially better from all of this. For everyone.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "And do you know why I believe them?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "These worlds are hopeless. The Roaring is something that we either can or cannot control, but there is no true way of us knowing that.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "In order to push for it, the Knight was then hired to effectively create an active situation involving the so-called 'heroes' to intervene.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "But they weren't needed. None of us are truly NEEDED here.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Well, I might be, but that's besides the point.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_left },
				{ type: "talk", batch: [ { speaker: pink, text: "What a narcissist...", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Just honest, Pink. Just honest.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack6 },
				
				// ATTACK 7
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "talk", batch: [ { speaker: friend, text: "Do you think I'm even engaging with all of you for the sake of pleasure?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "As stated infinitely times over by now, I do not wish to fight you.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_left },
				{ type: "talk", batch: [ { speaker: pink, text: "What, you think WE started this???", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "YOU were the one who STOLE my BODY from me!!!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "So many victim cards!", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "Maybe some of you weren't such a good fit for our group.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "NO 0NE WANT5 TO HE4R ABOUT YOUR [Brilliant Scheme] 0R YOU'RE [Backseat Driver] PLANS.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "JUST ST0P BE1NG [There's Gum On My Shoe] AND TRY T0 BE A little MORE [I'm Your Dad's Best Friend].", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "For what purpose? You clearly have no interest being on the side of...", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "Well. You know.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "IF U EVEN [Utter The Words] GOOD AGAIN I WILL [www.howtohireahitman.com]", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Very funny, Spamton.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Touchy subject, I see.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "You could say that again.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "So cranky, Gerson. Does the old coot need a nap?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "...", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack7 },
				
				// ATTACK 8
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "talk", batch: [ { speaker: friend, text: "Be realistic, my friends. None of you as 'uncorrupted' as you say you are.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_right },
				{ type: "talk", batch: [ { speaker: friend, text: "Jevil, for example, accepted the crystal without any hesitation whatsoever.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: jevil, text: "FOR THE PROMISE OF FREEDOM, WHO WAS I TO ARGUE, ARGUE?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: jevil, text: "SADLY, I DID NOT REALIZE THAT THE PRICE OF FREEDOM WAS YOUR IDEA OF CHANGE!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "And that means?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: jevil, text: "YOUR TACTICS ARE FLAWED, FLAWED!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: jevil, text: "CHAOS FOR FUN IS ONE THING, BUT TO SEVER TIES WITH YOUR OWN GOALS IS FOOLISH!", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Interesting point you have there, Jevil.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "I'll try to remember that the next time I give out my crystals.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack2 },
				
				// ATTACK 9
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: friend, text: "Spamton, the calls you received were a complete option for you to pick up on.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "You chose this path of freedom to grow big, but in the end you tore yourself down making others feel small.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "I D1D [nothing of the sort].", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "MY [IT'S TV TIME!!!] AND 1 WER3N'T GOING TO [Here's My Workout Routine].", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "I D1D WHAT I C0ULD TO [Fixer Upper] MY SITUATION", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "IT'S NOT MY FAULT", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "IT'S NOT", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "IT'S [You].", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Victim card yet again, Spamton.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "I DIDN'T WANT TO [Help! Someone! Please! I'm drowning! Please!].", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "And look where that got you, my friend.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack3 },
				
				// ATTACK 10
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_left },
				{ type: "talk", batch: [ { speaker: pink, text: "I still don't understand why I even had the crystal in the first place...", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "Do you really want answers from this thing?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Now now, Gerson. My fellow cat deserves her answers.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_left },
				{ type: "talk", batch: [ { speaker: friend, text: "You see, Pink, the crystals are a means of strengthening those who wield it to unthinkable powers.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "In the form of the Twisted Sword, it could become unstoppable.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "But even their power alone can make an individual stronger than they could ever imagine.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So why me?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Why NOT you?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "What does that mean???", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "The recipients needed to be individuals they would least expect them to be, hence why the four of you were chosen.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "Who's... they?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Oh, how the plot thickens!", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack10 },
				
				// ATTACK 11
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: friend, text: "And you, Hammer.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "What about me?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Oh, you know.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "Spit it out.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "You don't think the Sound of Justice was preordained?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "I don't get what you mean.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Why else would an old scholar have giant statues that resemble themselves in their study?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "For decor???", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack4 },
				
				// ATTACK 12
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_right },
				{ type: "talk", batch: [ { speaker: gerson, text: "I'm sorry, are you accusing me of unleashing that thing on the heroes?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "I know you didn't do that. I'm merely suggesting you had a hand in creating it.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "And how was I supposed to know that Susie would make another fountain?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "You're a smart monster, you could have easily thought it out.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "Your opinion is unwelcome, Friend.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_smiley },
				{ type: "talk", batch: [ { speaker: friend, text: "Now you sound like Spamton.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_far_left },
				{ type: "talk", batch: [ { speaker: spamton, text: "YOUR A [Donkey].", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack9 },
				
				// ATTACK 13
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "talk", batch: [ { speaker: friend, text: "The point of the matter is that your false sense of 'pure' heroism is not enough to cover the cost of your past actions.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "OUR actions???", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "Don't forget, Friend. You were the one who brought this on yourself when you stole Pink's body.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: gerson, text: "Could've avoided a lot of reproach.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Who said I needed your accreditation, Hammer?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "I am well aware of my actions, and I do not regret any of them.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: spamton, text: "YOUR [When the demon heart] IS [Come to confess]?", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Confessions aren't necessary here, Spamton. My actions are self-justified.", keep_animating: true } ] },
				{ type: "sprite", target: obj_friend, new_sprite: spr_friend_lookdown_animated },
				{ type: "attack", kind: "custom", start_func: scr_start_friend_attack8 },

				// END OF BATTLE
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_SCP_full_1, delay: 30 },
			            { sprite: spr_UI_SCP_full_2, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_3, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_4, snd: snd_select_reverb, delay: 30 },
						{ sprite: spr_UI_SCP_full_5, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "barrage", data: scr_make_barrage_sequence(
				    obj_friend, 20,
				    [
				        scr_make_throw(obj_spamton, spr_pipis, 65, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_mewmew, spr_pinkbomb, 84, c_yellow, c_fuchsia, false, {
						    mode: "straight",
						    travel_time: 120,
						    pre_delay: 6,
						    anticipation_frames: 10,
						    travel_sound: snd_bombfall,
						    travel_sound_gap: 30,
						    impact_sound: snd_bomb,
						    beep_flash_sprite: spr_pinkbomb_white,
						    beep_flash_duration: 10,
						    after_obj: obj_barrage_cross_fx,
						    after_sprite: spr_pinkbomb_explosion
						}),
				        scr_make_throw(obj_gerson, spr_hammer_barrage, 75, c_yellow, c_fuchsia, true, {
				            mode: "straight",
				            scale: 2,
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				        scr_make_throw(obj_jevil, spr_spade, 40, c_yellow, c_fuchsia, false, {
				            mode: "straight",
				            travel_time: 30,
				            pre_delay: 6,
				            anticipation_frames: 10,
				            after_obj: obj_barrage_impact_fx,
				        }),
				    ]
				)},
				{ type: "talk", batch: [ { speaker: friend, text: "None of you understand the full statutes of this plan.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "Then again, there are still more chapters of life to go before it comes into fruition.", keep_animating: true } ] },
				{ type: "talk", batch: [ { speaker: friend, text: "So, I think it is due time for a final attack of sorts.", keep_animating: true } ] },
				{ type: "custom_cutscene", start_func: scr_start_friend_final_cutscene },
		    ];		
		break;

		case "self_31":
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* Thanks, Knight.", "gerson");
				scr_obj_sprite_on_page(obj_gerson, spr_gerson_hammer_idle_lantern_left, false);
			scr_text("* Maybe you're not as terrible as we thought.", "gerson");
			scr_text("* I do not need your compliments, Gerson.", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* All of you...", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* Leave...", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* Now...", "knight");
				scr_snd_on_page(snd_knight_phone_call, 1);
				scr_text_slow(0.175);
				scr_text_shake(0, 9999);
			scr_text("* ...", "gerson");
			scr_text("* Try to come earlier for the next meeting.", "gerson");
			scr_text("* [Let's jet, guys]!", "spamton");
				scr_obj_sprite_on_page(obj_spamton, spr_spamton_left, false);
		break;
		
		case "self_32":
			scr_fade_warp_with_music(rm_two, 400, sng_empty);
			global.song = sng_flashback;
			scr_set_dim_left(0);
			scr_set_dim_right(0);
		break;
		
		case "self_33":
			scr_text("* So... now what?", "mewmew");
				scr_portrait_on_page(spr_mewmewspeaker_concerned_corrupted);
				scr_set_var_on_page(obj_textbox, "hide_box_sprite", true);
			scr_text("* I need to figure out what's going on in Castle Town.", "gerson");
			scr_text("* All of you need to come with me right now.", "gerson");
			scr_text("* I have a feeling I'm gonna need all the help I can get.", "gerson");
			scr_text("* ...", "spamton");
			scr_text("* WELL SHI", "spamton");
				scr_text_cutoff_skip(10);
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