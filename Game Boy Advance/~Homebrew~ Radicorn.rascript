// ~Homebrew~ Radicorn
// #ID = 28941

state = byte(0x007ea8)
player = byte(0x007e94)
score = dword(0x007eac)

title_screen = state == 0x00
game_started = prev(state) == 0x01 && state == 0x02
in_game = state == 0x02
not_paused = state != 0x03
died = prev(state) == 0x02 && state == 0x04

in_air = player == 0x01 || player == 0x02
ducked = prev(player) == 0x00 && player == 0x03

function scored(num) {
    return prev(score) == num - 1
    && score == num
}

// Score 10 points!
achievement(
    id = 407054,
    badge = "460848",
    title = "Vis10nary",
    description = "Score 10 points!",
    points = 1,
    trigger = in_game && scored(10)
)

// Score 30 points!
achievement(
    id = 407055,
    badge = "460849",
    title = "Gorg30us",
    description = "Score 30 points!",
    points = 3,
    trigger = in_game && scored(30)
)

// Score 50 points!
achievement(
    id = 407056,
    badge = "460850",
    title = "Re50nant",
    description = "Score 50 points!",
    points = 5,
    trigger = in_game && scored(50)
)

// Score 100 points!
achievement(
    id = 407057,
    badge = "460851",
    title = "Everb100ming",
    description = "Score 100 points!",
    points = 10,
    trigger = in_game && scored(100)
)

// Accumulate 55 seconds of airtime in one run!
achievement(
    id = 407058,
    badge = "460852",
    title = "Air Pre55ure",
    description = "Accumulate 55 seconds of airtime in one run!",
    points = 5,
    trigger = repeated(55*60, in_game && in_air && not_paused) && never(died)
)

// Duck more than 100 times in one run!
achievement(
    id = 407059,
    badge = "460853",
    title = "100k Down",
    description = "Duck more than 100 times in one run!",
    points = 5,
    trigger = repeated(100, ducked) && never(died)
)

// Score 50 or more points for three games in a row!
achievement(
    id = 407060,
    badge = "460854",
    title = "Ab50lutely Awe50me",
    description = "Score 50 or more points for three games in a row!",
    points = 10,
    trigger = repeated(3, died && score >= 50) && never(died && score < 50)
)

leaderboard(
    id = 91891,
    title = "High Score",
    description = "",
    start = died,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    id = 91892,
    title = "Radical Air",
    description = "Get as much air time as you can in one run!",
    start = game_started,
    cancel = title_screen,
    submit = died, 
    value = measured(tally(0, in_air && not_paused)),
    format = "FRAMES"
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen with a score of {0}",
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Skating radically with a score of {0}",
    rich_presence_value("Score", score)
)
