function scr_soul_take_hit(_amount, _color_top, _color_bottom)
{
    if (instance_exists(obj_soul) && !obj_soul.invulnerable)
    {
        // spawn the popup at the SOUL, not obj_mewmew — mewmew's sprite is
        // hidden/parked off to the side during these box attacks (only the
        // soul is visible and being controlled), so anchoring the popup to
        // mewmew meant it was appearing somewhere the player wasn't looking
        scr_trigger_damage_popup(obj_soul, _amount, _color_top, _color_bottom);
        obj_soul.invulnerable = true;
        obj_soul.invuln_timer = obj_soul.invuln_duration;
    }
}