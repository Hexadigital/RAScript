// Radar Scope
// #ID = 11952

score = low4(0x00a2) + (high4(0x00a2) * 10)
+ (low4(0x00a3) * 100) + (high4(0x00a3) * 1000)
+ (low4(0x00a4) * 10000) + (high4(0x00a4) * 100000)

wave = byte(0x021c)
lives = byte(0x021d)
game_over = prev(lives) == 1 && lives == 0

demo_check = byte(0x0006)
in_demo = demo_check == 0
in_game = demo_check == 1

game_mode = byte(0x000e)
one_player = game_mode == 0
two_player = game_mode == 1

starting_lives = byte(0x0020)
bonus_lives = byte(0x0021)

default_settings = starting_lives == 3 && bonus_lives == 7

// Score more than 1000 points! 1p
achievement(
    title = "Spaceport Trainee",
    points = 1,
    description = "In one-player mode, score more than 1000 points!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(score) >= 250
              && prev(score) < 1000
              && score >= 1000
              && score < 3000
)

// Score more than 3000 points! 3p
achievement(
    title = "Spaceport Pilot",
    points = 3,
    description = "In one-player mode, score more than 3000 points!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(score) >= 1000
              && prev(score) < 3000
              && score >= 3000
              && score < 5000
)

// Beat the default high score of 7650! 5p
achievement(
    title = "Spaceport Expert",
    points = 5,
    description = "In one-player mode, beat the default high score of 7650!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(score) >= 5000
              && prev(score) < 7650
              && score >= 7650
              && score < 10000
)

// Score more than 15000 points! 10p
achievement(
    title = "Spaceport Master",
    points = 10,
    description = "In one-player mode, score more than 15000 points!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(score) >= 10000
              && prev(score) < 15000
              && score >= 15000
              && score < 20000
)

// Score more than 30000 points! 25p
achievement(
    title = "Spaceport Legend",
    points = 25,
    description = "In one-player mode, score more than 30000 points!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(score) >= 25000
              && prev(score) < 30000
              && score >= 30000
              && score < 35000
)

// Clear the first attack mission! 4p
achievement(
    title = "Gamma Breaker",
    type = "progression",
    points = 2,
    description = "In one-player mode, clear the first attack mission!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(wave) == 1
              && wave == 2
)

// Clear the second attack mission! 5p
achievement(
    title = "Gamma Destroyer",
    type = "progression",
    points = 4,
    description = "In one-player mode, clear the second attack mission!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(wave) == 2
              && wave == 3
)

// Clear the third attack mission! 10p
achievement(
    title = "Gamma Obliterator",
    type = "win_condition",
    points = 10,
    description = "In one-player mode, clear the third attack mission!",
    trigger = default_settings
              && in_game
              && lives > 0
              && prev(wave) == 3
              && wave == 4
)

// Score 5000 points without losing a life! 10p
achievement(
    title = "Curved Vectors",
    type = "missable",
    points = 10,
    description = "In one-player mode, score 5000 points without losing a life!",
    trigger = default_settings
              && in_game
              && lives == 3
              && trigger_when(prev(score) >= 3000
              && prev(score) < 5000
              && score >= 5000
              && score < 7000)
)

leaderboard(
    title = "High Score",
    description = "",
    start = default_settings
         && in_game
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    !default_settings,
    "Altered settings, achievements disabled!"
)

rich_presence_conditional_display(
    in_demo,
    "At the title screen"
)

rich_presence_conditional_display(
    in_game && two_player,
    "In two-player mode"
)

rich_presence_conditional_display(
    in_game && one_player && lives == 1,
    "In one-player mode • 1 Life Remaining • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    in_game && one_player,
    "In one-player mode • {0} Lives Remaining • Score: {1}",
    rich_presence_value("Lives", lives),
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Now loading..."
)
