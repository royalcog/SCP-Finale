if (!variable_instance_exists(id, "side")) side = "left";

var _interior = scr_get_box_interior();
band_y1 = _interior.y1;
band_y2 = _interior.y2;

start_x = (side == "left") ? _interior.x1 : _interior.x2;
mid_x   = lerp(_interior.x1, _interior.x2, 0.5);
pos_x   = start_x;

move_speed = 10;
alpha = 0.6;
already_hit = false;
phase = "moving";
fade_speed = 0.05;