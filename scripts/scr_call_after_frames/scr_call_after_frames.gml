function scr_call_after_frames(_func, _frames)
{
    var _inst = instance_create_depth(0, 0, 0, obj_delayed_caller);
    _inst.call_func = _func;
    _inst.frames_left = _frames;
    _inst.mode = "immediate";
    return _inst;
}

function scr_call_on_page(_func, _frames, _page)
{
    var _inst = instance_create_depth(0, 0, 0, obj_delayed_caller);
    _inst.call_func = _func;
    _inst.frames_left = _frames;
    _inst.mode = "on_page";
    _inst.target_page = _page;
    return _inst;
}

function scr_call_after_textbox(_func, _frames)
{
    var _inst = instance_create_depth(0, 0, 0, obj_delayed_caller);
    _inst.call_func = _func;
    _inst.frames_left = _frames;
    _inst.mode = "after_textbox";
    return _inst;
}