// Hustle
// #ID = 15113

score = low4(0x011f)
      + low4(0x011e) * 10
      + low4(0x011d) * 100
      + low4(0x011c) * 1000
      + low4(0x011b) * 10000

penalty = low4(0x0104)
        + low4(0x0103) * 10
        + low4(0x0102) * 100
        + low4(0x0101) * 1000
        + low4(0x0100) * 10000

timer = low4(0x0110)
      + low4(0x010f) * 10

single_player = dword(0x0106) == 0x202c222e
multi_player = dword(0x0106) == 0x00040706 && timer != 90

function game_ended() {
    return penalty == 0
        && timer == 0
        && repeated(10, score > 0)
        && never(score == 0)
}

// Finish a game with at least 2000 points! 1p
achievement(
    title = "An Easy Start",
    type = "progression",
    points = 1,
    description = "Finish a single-player game with at least 2000 points!",
    trigger = game_ended() && score >= 2000
)

// Finish a game with at least 5000 points! 2p
achievement(
    title = "A Third of the Way There",
    type = "progression",
    points = 2,
    description = "Finish a single-player game with at least 5000 points!",
    trigger = game_ended() && score >= 5000
)

// Finish a game with at least 10000 points! 4p
achievement(
    title = "Toiling for Ten",
    type = "progression",
    points = 3,
    description = "Finish a single-player game with at least 10000 points!",
    trigger = game_ended() && score >= 10000
)
 
// Score 10000 points without adding to your penalty! 5p
achievement(
    title = "Watching the Walls",
    type = "missable",
    points = 4,
    description = "Score 10000 points without a penalty in a single-player game!",
    trigger = timer > 0 && repeated(10, score >= 10000) && penalty == 0 && never(score == 0)
)

// Finish a game with at least 15000 points! 10p
achievement(
    title = "Hunting for Secrets",
    type = "win_condition",
    points = 5,
    description = "Finish a single-player game with at least 15000 points!",
    trigger = game_ended() && score >= 15000
)

// Finish a game with at least 19000 points! 25p
achievement(
    title = "Reaching for the Sky",
    points = 10,
    description = "Finish a single-player game with at least 19000 points!",
    trigger = game_ended() && score >= 19000
)

leaderboard(
    title = "High Score",
    description = "",
    start = game_ended(),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    single_player,
    "Playing single-player • Score: {0} • Penalty: {1} • Time: {2}",
    rich_presence_value("Number", score),
    rich_presence_value("Number", penalty),
    rich_presence_value("Number", timer)
)

rich_presence_conditional_display(
    multi_player,
    "Playing multi-player"
)

rich_presence_display(
    "Preparing to hustle..."
)
