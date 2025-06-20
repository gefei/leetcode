var angleClock = function(hour, minutes) {
    let hour_angle = 30*(hour % 12) + 0.5*minutes
    let min_angle = 6*minutes
    let res = hour_angle-min_angle
    if (res < 0) res = -res
    if (res > 180) res = 360-res
    return res
};