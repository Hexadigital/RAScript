// ~Homebrew~ Hex
// #ID = 25177

ones_ascii = 0x00ff
tens_ascii = 0x00fe
hundreds_ascii = 0x00fd
thousands_ascii = 0x00fc

score = low4(ones_ascii)
      + low4(tens_ascii) * 10
      + low4(hundreds_ascii) * 100
      + low4(thousands_ascii) * 1000

high_score = low4(0x0107)
           + low4(0x0106) * 10
           + low4(0x0105) * 100
           + low4(0x0104) * 1000

title_screen = dword(0x00fc) == 0x30202020

game_over = prev(byte(tens_ascii)) >= 0x30 && prev(byte(tens_ascii)) <= 0x39 && byte(tens_ascii) == 0x20
booting = byte(tens_ascii) >= 0xF0

// new_high_score = dword(0x0104) != prev(dword(0x0104)) && prev(byte(0x0107)) == 0x30 && byte(0x0107) == 0x30

survival_mode = byte(ones_ascii) == 0x30
continue_mode = byte(ones_ascii) == 0x31

// Reach a score of 100 in any mode! 1p
achievement(
    type = "progression",
    title = "Warming Up",
    points = 1,
    description = "Reach a score of 100 in any mode!",
    trigger = low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 0
              && low4(hundreds_ascii) == 1
)

// Reach a score of 200 in Survival Mode! 2p
achievement(
    type = "progression",
    title = "Circling Around",
    points = 2,
    description = "Reach a score of 200 in Survival Mode!",
    trigger = survival_mode
              && low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 1
              && low4(hundreds_ascii) == 2
)

// Reach a score of 400 in Survival Mode! 5p
achievement(
    type = "progression",
    title = "Turn Twister",
    points = 5,
    description = "Reach a score of 400 in Survival Mode!",
    trigger = survival_mode
              && low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 3
              && low4(hundreds_ascii) == 4
)

// Reach a score of 600 in Survival Mode! 10p
achievement(
    type = "win_condition",
    title = "Hexahundred",
    points = 10,
    description = "Reach a score of 600 in Survival Mode!",
    trigger = survival_mode
              && low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 5
              && low4(hundreds_ascii) == 6
)

// Reach a score of 700 in any mode! 5p
achievement(
    title = "Seven's Cyclone",
    points = 5,
    description = "Reach a score of 700 in any mode!",
    trigger = low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 6
              && low4(hundreds_ascii) == 7
)

// Reach a score of 800 in any mode! 10p
achievement(
    title = "Infinispin",
    points = 10,
    description = "Reach a score of 800 in any mode!",
    trigger = low4(tens_ascii) == 0
              && prev(low4(hundreds_ascii)) == 7
              && low4(hundreds_ascii) == 8
)

leaderboard(
    title = "High Score: Survival Mode",
    description = "",
    start = prev(survival_mode)
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = prev(score)
)

leaderboard(
    title = "High Score: Continue Mode",
    description = "",
    start = prev(continue_mode)
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = prev(score)
)

rich_presence_conditional_display(
    booting,
    "Loading hexagons..."
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen with a high score of {0}",
    rich_presence_value("Score", high_score)
)

rich_presence_conditional_display(
    continue_mode,
    "Continue Mode • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Survival Mode • Score: {0}",
    rich_presence_value("Score", score)
)
