timer++;

if (timer >= attack_duration)
{
    if (instance_exists(left_hand))  instance_destroy(left_hand);
    if (instance_exists(right_hand)) instance_destroy(right_hand);
    instance_destroy();
}