// 18 Holes Pro Golf
// #ID = 15848

game_state = byte(0x00008c)
title = game_state == 0
demo = game_state == 1
in_game = game_state == 2

lives = byte(0x000055)
strokes = byte(0x00002d)
par_target = byte(0x000053)
pattern = byte(0x00008a) + 1
hole = byte(0x00008b) + 1

score = tbyte(0x000057)
total_strokes = bcd(byte(0x0000ba))
game_over = lives == 0 && prev(in_game) && title

function hole_completed_at_or_under_par(num) {
    return in_game
     && prev(hole) == num && hole == num + 1
     && prev(strokes) >= 1
     && prev(strokes) <= prev(par_target)
}

// Complete pattern 1, hole 1, 1p
achievement(
    title = "Warming Up",
    type = "progression",
    points = 1,
    description = "Complete pattern 1, hole 1",
    trigger = in_game
           && pattern == 1
           && prev(hole) == 1
           && hole == 2
)

// Complete pattern 1, hole 3, 3p
achievement(
    title = "Getting Into the Swing of Things",
    type = "progression",
    points = 3,
    description = "Complete pattern 1, hole 3",
    trigger = in_game
           && pattern == 1
           && prev(hole) == 3
           && hole == 4
)

// Complete pattern 1, hole 6, 5p
achievement(
    title = "Putting In Effort",
    type = "progression",
    points = 5,
    description = "Complete pattern 1, hole 6",
    trigger = in_game
           && pattern == 1
           && prev(hole) == 6
           && hole == 7
)

// Complete pattern 1, hole 9 [win condition], 10p
achievement(
    title = "Where Are the Other Nine Holes?",
    type = "win_condition",
    points = 10,
    description = "Complete pattern 1, hole 9",
    trigger = in_game
           && prev(pattern) == 1
           && pattern == 2
)

// Complete pattern 2, hole 9, 10p
achievement(
    title = "This Game Lied to Me",
    points = 10,
    description = "Complete pattern 2, hole 9",
    trigger = in_game
           && prev(pattern) == 2
           && pattern == 3
)

// Complete pattern 1 with 30 strokes or less, 10p
achievement(
    title = "Golfing for Glory",
    type = "missable",
    points = 25,
    description = "Complete pattern 1 with 30 strokes or less",
    trigger = in_game
           && pattern == 1
           && hole == 9
           && total_strokes > prev(total_strokes)
           && total_strokes <= 30
)

// Score a birdie, 2p
achievement(
    title = "Taking a Shortcut",
    points = 2,
    description = "Score a birdie",
    trigger = in_game
           && hole != prev(hole)
           && prev(strokes) == prev(par_target) - 1
           && prev(strokes) != 1 // anti-hole in one
)

// Score an eagle, 3p
achievement(
    title = "Optimizing Bounces",
    points = 3,
    description = "Score an eagle",
    trigger = in_game
           && hole != prev(hole)
           && prev(strokes) == prev(par_target) - 2
           && prev(strokes) != 1 // anti-hole in one
)

// Score a hole in one, 5p
achievement(
    title = "Long Shot",
    points = 5,
    description = "Score a hole in one",
    trigger = in_game
           && hole != prev(hole)
           && prev(strokes) == 1
)

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Pattern No. 1: Total Strokes",
    description = "",
    start = in_game
       && pattern == 1
       && hole == 9
       && total_strokes > prev(total_strokes),
    cancel = always_false(),
    submit = always_true(), 
    value = total_strokes,
    lower_is_better = true
)

leaderboard(
    title = "Pattern No. 2: Total Strokes",
    description = "",
    start = in_game
       && pattern == 2
       && hole == 9
       && total_strokes > prev(total_strokes),
    cancel = always_false(),
    submit = always_true(), 
    value = total_strokes,
    lower_is_better = true
)

leaderboard(
    title = "Pattern No. 3: Total Strokes",
    description = "",
    start = in_game
       && pattern == 3
       && hole == 9
       && total_strokes > prev(total_strokes),
    cancel = always_false(),
    submit = always_true(), 
    value = total_strokes,
    lower_is_better = true
)

leaderboard(
    title = "Pattern No. 4: Total Strokes",
    description = "",
    start = in_game
       && pattern == 4
       && hole == 9
       && total_strokes > prev(total_strokes),
    cancel = always_false(),
    submit = always_true(), 
    value = total_strokes,
    lower_is_better = true
)

rich_presence_conditional_display(
    title,
    "At the title screen"
)

rich_presence_conditional_display(
    demo,
    "Watching a demo"
)

rich_presence_conditional_display(
    strokes == 1 && total_strokes == 1,
    "Pattern {0}, Hole {1} • {2} Stroke on Hole • {3} Stroke on Pattern • Score: {4}",
    rich_presence_value("Number", pattern),
    rich_presence_value("Number", hole),
    rich_presence_value("Number", strokes),
    rich_presence_value("Number", total_strokes),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    strokes == 1,
    "Pattern {0}, Hole {1} • {2} Stroke on Hole • {3} Strokes on Pattern • Score: {4}",
    rich_presence_value("Number", pattern),
    rich_presence_value("Number", hole),
    rich_presence_value("Number", strokes),
    rich_presence_value("Number", total_strokes),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    total_strokes == 1,
    "Pattern {0}, Hole {1} • {2} Strokes on Hole • {3} Stroke on Pattern • Score: {4}",
    rich_presence_value("Number", pattern),
    rich_presence_value("Number", hole),
    rich_presence_value("Number", strokes),
    rich_presence_value("Number", total_strokes),
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Pattern {0}, Hole {1} • {2} Strokes on Hole • {3} Strokes on Pattern • Score: {4}",
    rich_presence_value("Number", pattern),
    rich_presence_value("Number", hole),
    rich_presence_value("Number", strokes),
    rich_presence_value("Number", total_strokes),
    rich_presence_value("Number", score)
)
