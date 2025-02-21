// Abscam
// #ID = 13523

score = low4(0x0680)
+ high4(0x0680) * 10
+ low4(0x0681) * 100
+ high4(0x0681) * 1000
+ low4(0x0682) * 10000
+ high4(0x0682) * 100000

game_state = byte(0x0600)
title_screen = game_state == 1
press_start = game_state == 2
in_game = game_state == 3

game_mode = byte(0x0670)
one_player = game_mode == 0
two_player = game_mode == 1

current_round = byte(0x0613) + 1

starting_lives = byte(0x066f)
bonus_life = byte(0x0671)
lives = byte(0x0614)
game_over = prev(lives) == 1 && lives == 0
hard_mode = bit4(0x0673) == 1

cash_bags_grabbed = byte(0x05d0)
four_bags_grabbed = prev(cash_bags_grabbed) == 3 && measured(cash_bags_grabbed == 4)

cash_collected = byte(0x060e)

briefcase_grabbed = prev(bit2(0x06bc)) == 0 && bit2(0x06bc) == 1

default_settings = starting_lives == 3 && bonus_life == 0x10

function round_cleared(num) {
    return current_round == num && prev(cash_collected) == 243 && cash_collected == 244
}

// Clear round x
achievement(
    title = "Escaping the Law",
    type = "progression",
    points = 2,
    description = "Clear round 1 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && round_cleared(1)
)

achievement(
    title = "Good, Good, Good",
    type = "progression",
    points = 5,
    description = "Clear round 2 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && round_cleared(2)
              && never(game_over)
              && never(title_screen)
)

achievement(
    title = "Fantastic",
    type = "progression",
    points = 5,
    description = "Clear round 4 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && round_cleared(4)
              && never(game_over)
              && never(title_screen)
)

achievement(
    title = "Far Far Out",
    type = "progression",
    points = 5,
    description = "Clear round 6 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && once(round_cleared(5))
              && round_cleared(6)
              && never(game_over)
              && never(title_screen)
)

achievement(
    title = "Even Further Out",
    type = "win_condition",
    points = 10,
    description = "Clear round 8 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && once(round_cleared(5))
              && once(round_cleared(6))
              && once(round_cleared(7))
              && round_cleared(8)
              && never(game_over)
              && never(title_screen)
)

// Grab a briefcase full of cash, 2p
achievement(
    title = "Finders Keepers",
    points = 2,
    description = "Grab a briefcase full of cash",
    trigger = default_settings
              && in_game
              && one_player
              && briefcase_grabbed
)

// Collect four bags of cash before running out of influence, 10p
achievement(
    title = "I'll Take the FBI's Money as Well",
    points = 10,
    description = "Use your influence to steal four bags of cash from the FBI at once",
    trigger = default_settings
              && in_game
              && one_player
              && four_bags_grabbed
)

// Clear round 8 with the difficulty set to Hard and otherwise default settings
achievement(
    title = "Fighting for Every Dollar",
    points = 25,
    description = "Clear round 8 with the difficulty set to Hard and otherwise default settings",
    trigger = default_settings
              && in_game
              && one_player
              && hard_mode
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && once(round_cleared(5))
              && once(round_cleared(6))
              && once(round_cleared(7))
              && round_cleared(8)
              && never(game_over)
              && never(title_screen)
)

leaderboard(
    title = "High Score",
    description = "",
    start = default_settings
              && in_game
              && one_player
              && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Hard Difficulty",
    description = "",
    start = default_settings
              && hard_mode
              && in_game
              && one_player
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
    title_screen,
    "At the title screen"
)

rich_presence_conditional_display(
    press_start,
    "Waiting to start"
)

rich_presence_conditional_display(
    in_game && two_player,
    "Playing in 2P Mode"
)

rich_presence_conditional_display(
    in_game && one_player && hard_mode,
    "Round {0} • Hard Difficulty • Lives: {1} • Score: {2}$",
    rich_presence_value("Number", current_round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    in_game && one_player,
    "Round {0} • Normal Difficulty • Lives: {1} • Score: {2}$",
    rich_presence_value("Number", current_round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Avoiding a sting operation"
)
