if (dim_phase == 1) // first time — kick off the current batch
{
    entries = batches[batch_index];
    index = 0;
    next_delay = 0;
    dim_phase = 2;
}

if (dim_phase == 2) // run dialogue
{
    if (!instance_exists(curr_box))
    {
        if (next_delay > 0)
        {
            next_delay--;
        }
        else if (index < array_length(entries))
        {
            var e = entries[index];
            var sp  = e.speaker;
            var txt = e.text;
            var ww = (variable_struct_exists(e, "wrap") ? e.wrap : default_wrap);
            var cid = sp.char_id;
            var ox  = offx[cid];
            var oy  = offy[cid];
            var fp  = flip[cid];
            var cps = default_cps;
            var _keep_anim = variable_struct_exists(e, "keep_animating") && e.keep_animating;
			var _dim = variable_struct_exists(e, "dim") ? e.dim : -1;
			var _animate = !(variable_struct_exists(e, "no_animate") && e.no_animate);
			curr_box = scr_talkbox_show(sp, txt, ww, ox, oy, fp, cps, _keep_anim, _dim, _animate);
            if (variable_struct_exists(e, "reveal") && e.reveal)
            {
                curr_box.on_destroy_reveal = true;
            }
            index += 1;
            next_delay = 60;
        }
        else
        {
            batch_index++;
            if (batch_index < array_length(batches))
            {
                dim_phase = 1; // move to next batch
            }
            else
            {
                instance_destroy(); // all batches done
            }
        }
    }
}