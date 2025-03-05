// Driving Force
// #ID = 15061

time_remaining = low4(0x017a) + (high4(0x017a) * 10) + (low4(0x0179) * 100) + (high4(0x0179) * 1000)
raw_miles = tbyte_be(0x01e1)
miles = (low4(0x01e3) * 10) + (high4(0x01e3) * 100) + (low4(0x01e2) * 1000) + (high4(0x01e2) * 10000) + (low4(0x01e1) * 100000) + (high4(0x01e1) * 1000000)
speed = low4(0x02e4) + (high4(0x02e4) * 10) + (low4(0x02e3) * 100)
cars_passed = low4(0x02f2) + (high4(0x02f2) * 10) + (low4(0x02f3) * 100) + (high4(0x02f3) * 1000)
crashed = prev(byte(0x019d)) == 0 && byte(0x019d) == 1

time_up = prev(time_remaining) == 1 && time_remaining == 9900
game_over = time_remaining == 9900 && prev(cars_passed) == 1 && cars_passed == 0

game_start = miles == 0 && speed == 0 && cars_passed == 0 && time_remaining == 80

// Gain a time extension by driving for 4,000 miles
achievement(
    type = "progression",
    title = "First Checkpoint",
    points = 4,
    description = "Gain a time extension by driving for 4,000 miles",
    trigger = time_remaining > 0 && time_remaining != 9900 && prev(miles) == 3990 && miles == 4000
)

// Gain a second time extension by driving for 8,000 miles
achievement(
    type = "progression",
    title = "Half-Way Marker",
    points = 5,
    description = "Gain a time extension by driving for 8,000 miles",
    trigger = time_remaining > 0 && time_remaining != 9900 && prev(miles) == 7990 && miles == 8000
)

// Drive for more than 10,000 miles, guaranteeing a spot on the in-game leaderboard
achievement(
    type = "win_condition",
    title = "Certified Driver",
    points = 5,
    description = "Drive for more than 10,000 miles, guaranteeing a spot on the in-game leaderboard",
    trigger = time_remaining > 0 && time_remaining != 9900 && prev(miles) == 9990 && miles == 10000
)

// Pass 100 cars
achievement(
    title = "Pass On By",
    points = 1,
    description = "Pass 100 cars",
    trigger = time_remaining > 0 && time_remaining != 9900 && prev(cars_passed) == 99 && cars_passed == 100
)

// Maintain full speed (300 MPH) for 500 miles without slowing down
achievement(
    title = "Speed Racer",
    points = 3,
    description = "Maintain full speed (300 MPH) for 500 miles without slowing down",
    trigger = time_remaining > 0 && time_remaining != 9900 && speed == 300 && measured(repeated(50, raw_miles > prev(raw_miles)), format="percent") && never(speed != 300)
)

// Reach the checkpoint at 4,000 miles without crashing
achievement(
    type = "missable",
    title = "Steady Wheel",
    points = 10,
    description = "Reach the checkpoint at 4,000 miles without crashing",
    trigger = once(game_start) && time_remaining > 0 && trigger_when(prev(raw_miles) == 0x3990 && raw_miles == 0x4000) && never(time_up) && never(crashed)
)


// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = miles
)

// Most Cars Passed
leaderboard(
    title = "Most Cars Passed",
    description = "",
    start = time_up,
    cancel = always_false(),
    submit = always_true(), 
    value = cars_passed
)

rich_presence_conditional_display(
    time_remaining == 0 && miles == 0,
    "Ready to race!"
)

rich_presence_conditional_display(
    time_remaining == 0 || time_remaining == 9900,
    "Resting up • {0} Miles Driven",
    rich_presence_value("Miles", miles)
)

rich_presence_display(
    "Racing • {0} Seconds Left • {1} MPH • {2} Cars Passed • {3} Miles Driven",
    rich_presence_value("Seconds", time_remaining),
    rich_presence_value("Speed", speed),
    rich_presence_value("CarsPassed", cars_passed),
    rich_presence_value("Miles", miles)
)

// Gain a third time extension by scoring 12,000 points

// Gain a final time extension by scoring 16,000 points
