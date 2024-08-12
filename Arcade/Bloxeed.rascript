// Bloxeed
// #ID = 12004

Powers = {
    "4 Lines": 0x00,
    "Flicky": 0x01,
    "Satellite": 0x02,
    "16-Ton Weight": 0x03,
    "Bomb": 0x04,
}

default_settings = byte(0x003020) == 0x02

game_state = byte(0x003041)
title = bit7(0x003041) == 1 && bit0(0x003041) == 0
in_game = game_state == 0x01
results = game_state == 0x81

game_over = in_game && dword(0x01463a) == 0x00410047 && dword(0x01463e) == 0x0045004d

score = word(0x003322) + (byte(0x003320) * 65536)
lines = word(0x00332a)
level = byte(0x003332)

last_powerup = byte(0x003374)

good_desune = dword(0x0144ba) == 0x00450044
&& dword(0x0144be) == 0x00550053
&& dword(0x0144c2) == 0x0045004e

function scored(num) {
    return prev(score) < num && score >= num && score < num + 100000
}

function cleared(num) {
    return prev(lines) >= num - 10 && prev(lines) < num && lines >= num && lines < num + 10
}

function power_activated(name) {
    return last_powerup != Powers[name] && last_powerup == Powers[name]
}

// As P1, score 20,000 points on default settings
achievement(
    title = "Starting to Score",
    type = "progression",
    points = 2,
    description = "As P1, score 20,000 points on default settings",
    trigger = default_settings
              && in_game
              && scored(20000)
)

// As P1, score 45,000 points on default settings
achievement(
    title = "Twice and a Little More",
    type = "progression",
    points = 4,
    description = "As P1, score 45,000 points on default settings",
    trigger = default_settings
              && in_game
              && scored(45000)
)

// As P1, score 70,000 points on default settings
achievement(
    title = "Racking Up Points",
    type = "progression",
    points = 5,
    description = "As P1, score 70,000 points on default settings",
    trigger = default_settings
              && in_game
              && scored(70000)
)

// As P1, score 100,000 points on default settings
achievement(
    title = "Climbing the Leaderboard",
    type = "progression",
    points = 10,
    description = "As P1, score 100,000 points on default settings",
    trigger = default_settings
              && in_game
              && scored(100000)
)

// As P1, score 200,000 points on default settings
achievement(
    title = "High Score Destroyer",
    type = "win_condition",
    points = 25,
    description = "As P1, score 200,000 points on default settings",
    trigger = default_settings
              && in_game
              && scored(200000)
)

// As P1, clear 20 lines on default settings, Warming Up
achievement(
    title = "Warming Up",
    points = 3,
    description = "As P1, clear 20 lines on default settings",
    trigger = default_settings
              && in_game
              && cleared(20)
)

// As P1, clear 40 lines on default settings, Steady Pace
achievement(
    title = "Steady Pace",
    points = 5,
    description = "As P1, clear 40 lines on default settings",
    trigger = default_settings
              && in_game
              && cleared(40)
)

// As P1, clear 70 lines on default settings, Going Strong
achievement(
    title = "Going Strong",
    points = 5,
    description = "As P1, clear 70 lines on default settings",
    trigger = default_settings
              && in_game
              && cleared(70)
)

// As P1, clear 100 lines on default settings, Putting Up a Challenge
achievement(
    title = "Putting Up a Challenge",
    points = 10,
    description = "As P1, clear 100 lines on default settings",
    trigger = default_settings
              && in_game
              && cleared(100)
)

// As P1, clear 150 lines on default settings, Sprinting to Survive
achievement(
    title = "Sprinting to Survive",
    points = 25,
    description = "As P1, clear 150 lines on default settings",
    trigger = default_settings
              && in_game
              && cleared(150)
)

// As P1, activate the Flicky power block on default settings
achievement(
    title = "Feathered Friend",
    points = 1,
    description = "As P1, activate the Flicky power block on default settings",
    trigger = default_settings
              && in_game
              && power_activated("Flicky")
)

// As P1, activate the Shot/Satellite power block on default settings
achievement(
    title = "Strategic Defense Initiative",
    points = 1,
    description = "As P1, activate the Shot/Satellite power block on default settings",
    trigger = default_settings
              && in_game
              && power_activated("Satellite")
)

// As P1, get a Good Desune bonus on default settings
achievement(
    title = "All Clear!",
    points = 2,
    description = "As P1, get a Good Desune bonus on default settings",
    trigger = default_settings
              && in_game
              && good_desune
)

// As P1, activate the 16-Ton power block on default settings
achievement(
    title = "Crushing Columns",
    points = 1,
    description = "As P1, activate the 16-Ton power block on default settings",
    trigger = default_settings
              && in_game
              && power_activated("16-Ton Weight")
)

// AS P1, activate the Bomb power block on default settings
achievement(
    title = "Holey Help",
    points = 1,
    description = "As P1, activate the Bomb power block on default settings",
    trigger = default_settings
              && in_game
              && power_activated("Bomb")
)

leaderboard(
    title = "High Score",
    description = "",
    start = default_settings
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Most Lines Cleared",
    description = "",
    start = default_settings
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = lines
)

leaderboard(
    title = "Highest Level",
    description = "",
    start = default_settings
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = level
)

rich_presence_conditional_display(
    !default_settings,
    "Altered settings, achievements disabled!"
)

rich_presence_conditional_display(
    title,
    "At the title screen"
)

rich_presence_conditional_display(
    results,
    "Looking at the results with a score of {0}",
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Score: {0} • Lines: {1} • Level: {2}",
    rich_presence_value("Number", score),
    rich_presence_value("Number", lines),
    rich_presence_value("Number", level)
)
