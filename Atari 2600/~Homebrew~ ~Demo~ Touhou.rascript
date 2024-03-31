// ~Homebrew~ ~Demo~ Touhou
// #ID = 29062

LivesLookup = {
    0x76: "3",
    0x56: "2",
    0x36: "1",
    0x16: "0"
}

x_coord = byte(0x0000)
y_coord = byte(0x0005)
lives = byte(0x0073)
score = low4(0x0015)
        + high4(0x0015) * 10
        + low4(0x0014) * 100
        + high4(0x0014) * 1000
        + low4(0x0013) * 10000
        + high4(0x0013) * 100000

in_game = lives != 0x00
title_screen = lives == 0x00
game_over = prev(lives) == 0x36 && lives == 0x16
first_life_lost = prev(lives) == 0x76 && lives == 0x56

function scored(num) {
    return prev(score) == num - 1 && score == num
}

// Score 10 points!
achievement(
    title = "Shrine Maiden",
    description = "Shoot down 10 ghosts!",
    points = 1,
    trigger = in_game && scored(10)
)

// Score 25 points!
achievement(
    title = "Spring Sun",
    description = "Shoot down 25 ghosts!",
    points = 1,
    trigger = in_game && scored(25)
)

// Score 50 points!
achievement(
    title = "Freewheeling and Haphazard",
    description = "Shoot down 50 ghosts!",
    points = 1,
    trigger = in_game && scored(50)
)

// Score 75 points!
achievement(
    title = "The Advocate of the Myriad Gods",
    description = "Shoot down 100 ghosts!",
    points = 1,
    trigger = in_game && scored(100)
)

// Score 100 points!
achievement(
    title = "Arcane Shrine Maiden of Barriers",
    description = "Shoot down 100 ghosts without losing a life!",
    points = 2,
    trigger = lives == 0x76 && trigger_when(scored(100))
)

// Do a wall trick!
achievement(
    title = "Illusory Shrine Maiden",
    description = "Trick the ghost into running the opposite direction of you...?",
    points = 0,
    trigger = in_game
              && prev(y_coord) <= 0x00
              && prev(y_coord) < 0x09
              && y_coord > 0xf0
              && y_coord <= 0xff
)

leaderboard(
    title = "High Score",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = prev(score)
) 

rich_presence_conditional_display(
    title_screen,
    "At the title screen"
)

rich_presence_conditional_display(
    lives == 0x16,
    "Reimu is dead!"
)

rich_presence_conditional_display(
    lives == 0x36,
    "Reimu is shooting down ghosts with 1 life left and {0} confirmed kills",
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Reimu is shooting down ghosts with {0} lives left and {1} confirmed kills",
    rich_presence_lookup("Lives", lives, LivesLookup),
    rich_presence_value("Score", score)
)
