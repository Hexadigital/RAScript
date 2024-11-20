// Lock On
// #ID = 31423

Bets = {
    "Diamond": mbf32_le(0x00a781),
    "Spade": mbf32_le(0x00a785),
    "Club": mbf32_le(0x00a789),
    "Heart": mbf32_le(0x00a78d),
    "Star": mbf32_le(0x00a791),
    "Special": mbf32_le(0x00a795),
    "Red": mbf32_le(0x00a799),
    "Black": mbf32_le(0x00a79d)
}

game_loaded = dword(0x000009) == 0x4b434f4c // LOCK
level = mbf32_le(0x00a4b3)
money = mbf32_le(0x00a4d3)
twist = mbf32_le(0x00a4db)

//////////////////
// Achievements //
//////////////////

// Clear round 1
achievement(
    type = "progression",
    title = "Place Your Bets!",
    points = 2,
    description = "Clear round 1",
    trigger = game_loaded
              && prev(level) == 1
              && level == 2
)

// Clear round 4
achievement(
    type = "progression",
    title = "Space Lore",
    points = 3,
    description = "Clear round 4",
    trigger = game_loaded
              && prev(level) == 4
              && level == 5
)

// Clear round 9
achievement(
    type = "progression",
    title = "The Credits? Already?",
    points = 5,
    description = "Clear round 9",
    trigger = game_loaded
              && prev(level) == 9
              && level == 10
)

// Clear round 14
achievement(
    type = "progression",
    title = "Send Us Illustrations!",
    points = 10,
    description = "Clear round 14",
    trigger = game_loaded
              && prev(level) == 14
              && level == 15
)

// Clear round 20 and beat the game
achievement(
    type = "win_condition",
    title = "An Unexpected Twist",
    points = 10,
    description = "Clear round 20",
    trigger = game_loaded
              && prev(level) == 20
              && level == 21
)

// Win a 100x bet on the special flag slot
achievement(
    title = "Feeling Special",
    points = 3,
    description = "Win a 100x bet on the special flag slot",
    trigger = game_loaded
              && Bets["Special"] == 4
              && twist == prev(twist) - 100
)

//////////////////
// Leaderboards //
//////////////////

// Richest Gambler
leaderboard(
    title = "Richest Gambler",
    description = "Clear round 20 with as much money as possible",
    start = game_loaded
         && prev(level) == 20
         && level == 21,
    cancel = always_false(),
    submit = always_true(), 
    value = money
)

///////////////////
// Rich Presence //
///////////////////

rich_presence_conditional_display(
    !game_loaded || level < 1 || level > 21,
    "Now loading..."
)

rich_presence_conditional_display(
    level == 21,
    "You Win! • {0} Twist • {1} Money",
    rich_presence_value("Number", twist),
    rich_presence_value("Number", money)
)

rich_presence_display(
    "Round {0} • {1} Twist • {2} Money",
    rich_presence_value("Number", level),
    rich_presence_value("Number", twist),
    rich_presence_value("Number", money)
)
