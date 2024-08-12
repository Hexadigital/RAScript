// ~Homebrew~ Mooncat's Trio
// #ID = 24331

Heroes = {
    0x00: "Frog",
    0x01: "Cat",
    0x02: "Chipmunk"
}

// $2A7C: Score [32-bit]
score = dword(0x002A7C)

// $2A80: Selected Hero [8-bit]
//        0x00 = Frog
//        0x01 = Cat
//        0x02 = Chipmunk
selected_hero = byte(0x002A80)

// $3438: Current Level [8-bit]
//        End of First Location: 0x04 -> 0x05
//        End of Second Location: 0x09 -> 0x0A
//        End of Third Location: 0x0E -> 0x0F
//        End of Fourth Location: 0x13 -> 0x14
//        End of Game: 0x24 -> 0x00
current_level = byte(0x003438) + 1

balls_left = byte(0x003444)
paused = byte(0x002a8d) == 0x01 && byte(0x002a8f) == 0x01

function level_completed(num) {
    return prev(current_level) == num && current_level == num + 1
}

function game_clear() {
    return score > 0 && prev(current_level) == 25 && current_level == 1
}

// Clear level 1 as any hero
achievement(
    type = "progression",
    title = "Ball Bouncer",
    points = 1,
    description = "Clear level 1 as any hero without pressing the right shoulder button",
    trigger = level_completed(1) && disable_when(once(paused))
)

// Clear level 5 as any hero
achievement(
    type = "progression",
    title = "Block Breaker",
    points = 2,
    description = "Clear level 5 as any hero without pressing the right shoulder button",
    trigger = level_completed(5) && disable_when(once(paused))
)

// Clear level 10 as any hero
achievement(
    type = "progression",
    title = "Earth Shaker",
    points = 4,
    description = "Clear level 10 as any hero without pressing the right shoulder button",
    trigger = level_completed(10) && disable_when(once(paused))
)

// Clear level 15 as any hero
achievement(
    type = "progression",
    title = "Ice Cruncher",
    points = 5,
    description = "Clear level 15 as any hero without pressing the right shoulder button",
    trigger = level_completed(15) && disable_when(once(paused))
)

// Clear level 20 as any hero
achievement(
    type = "progression",
    title = "Heart Stopper",
    points = 5,
    description = "Clear level 20 as any hero without pressing the right shoulder button",
    trigger = level_completed(20) && disable_when(once(paused))
)

// Clear the game as the Frog
achievement(
    type = "win_condition",
    title = "Frogtastic",
    points = 10,
    description = "Clear the game as the Frog without pressing the right shoulder button",
    trigger = selected_hero == 0x00 && game_clear() && disable_when(once(paused))
)

// Clear the game as the Cat
achievement(
    type = "win_condition",
    title = "Purrfect",
    points = 10,
    description = "Clear the game as the Cat without pressing the right shoulder button",
    trigger = selected_hero == 0x01 && game_clear() && disable_when(once(paused))
)

// Clear the game as the Chipmunk
achievement(
    type = "win_condition",
    title = "Chewing Through",
    points = 10,
    description = "Clear the game as the Chipmunk without pressing the right shoulder button",
    trigger = selected_hero == 0x02 && game_clear() && disable_when(once(paused))
)

// High Score Leaderboard
leaderboard(
    title = "High Score",
    description = "",
    start = game_clear() && disable_when(once(paused)),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// Rich Presence
rich_presence_conditional_display(
    once(paused),
    "Right shoulder button detected, achievements disabled."
)

rich_presence_conditional_display(
    score == 0,
    "Preparing to break some blocks..."
)

rich_presence_display(
    "{0} • Level {1} • Balls: {2} • Score: {3}",
    rich_presence_lookup("Hero", selected_hero, Heroes, fallback="Unknown"),
    rich_presence_value("Number", current_level),
    rich_presence_value("Number", balls_left),
    rich_presence_value("Number", score)
)
