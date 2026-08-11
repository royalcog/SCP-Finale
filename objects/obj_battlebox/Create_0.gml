image_speed = 0;
rise_speed = 0.5; // lower = slower rise. Try 0.2–0.5 to taste
image_index = 0;
depth = -200; // adjust so it's above background but you can decide vs soul/hammers later

state = "rising"; // rising -> idle -> closing -> done
on_open_callback_done = false;