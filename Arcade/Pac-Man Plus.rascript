// Pac-Man Plus
// #ID = 11919

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

ghosts_eaten = byte(0x05d0)
four_ghosts_eaten = prev(ghosts_eaten) == 3 && ghosts_eaten == 4

pellets_eaten = byte(0x060e)

food_eaten = prev(bit2(0x06bc)) == 0 && bit2(0x06bc) == 1

default_settings = starting_lives == 3 && bonus_life == 0x10

power_outage = repeated(50, dword(0x1070) == 0) && never(dword(0x1070) != 0)

function round_cleared(num) {
    return current_round == num && prev(pellets_eaten) == 243 && pellets_eaten == 244
}

// Clear round 1, Sodalicious, 2p
achievement(
    title = "Sodalicious",
    type = "progression",
    points = 2,
    description = "Clear round 1 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && round_cleared(1)
)

// Clear round 2, A Stronger Drink, 3p
achievement(
    title = "A Stronger Drink",
    type = "progression",
    points = 3,
    description = "Clear round 2 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && never(game_over)
              && never(title_screen)
)

// Clear round 4, Edamame, 5p
achievement(
    title = "Edamame",
    type = "progression",
    points = 5,
    description = "Clear round 4 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && never(game_over)
              && never(title_screen)
)

// Clear round 6, Regaining Health, 5p
achievement(
    title = "Regaining Health",
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
              && once(round_cleared(6))
              && never(game_over)
              && never(title_screen)
)

// Clear round 8, Bunches of Dots, 10p
achievement(
    title = "Bunches of Dots",
    type = "progression",
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
              && once(round_cleared(8))
              && never(game_over)
              && never(title_screen)
)

// Clear round 10, Crossover Conqueror, 10p
achievement(
    title = "Crossover Conqueror",
    type = "progression",
    points = 10,
    description = "Clear round 10 on default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && never(game_over)
              && never(title_screen)
)

// Clear round 12, Searching for Starch, 10p
achievement(
    title = "Searching for Starch",
    type = "progression",
    points = 10,
    description = "Clear round 12 on default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && once(round_cleared(11))
              && once(round_cleared(12))
              && never(game_over)
              && never(title_screen)
)

// Clear round 14, A Tasty Breakfast, 10p
achievement(
    title = "Endless Breakfast",
    type = "win_condition",
    points = 25,
    description = "Clear round 14 on default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && once(round_cleared(11))
              && once(round_cleared(12))
              && once(round_cleared(13))
              && once(round_cleared(14))
              && never(game_over)
              && never(title_screen)
)

// Drink a can of coke in round 1, Product Placement, 2p
achievement(
    title = "Product Placement",
    points = 2,
    description = "Drink a can of coke in round 1 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && current_round == 1
              && food_eaten
)

// Sip on a cocktail in round 2, 21 and Up, 3p
achievement(
    title = "21 and Up",
    points = 3,
    description = "Sip on a cocktail in round 2 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && current_round == 2
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Eat some peas in round 3 or 4, Three Dots in a Pod, 4p
achievement(
    title = "Three Dots in a Pod",
    points = 4,
    description = "Eat some peas in round 3 or 4 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && current_round >= 3
              && current_round <= 4
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Save on medical bills by eating an apple in round 5 or 6, Wakka Wakka Crunch, 5p
achievement(
    title = "Wakka Wakka Crunch",
    points = 5,
    description = "Save on medical bills by eating an apple in round 5 or 6 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && current_round >= 5
              && current_round <= 6
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Snack on some grapes in round 7 or 8, Juicy Dots, 5p
achievement(
    title = "Juicy Dots",
    points = 5,
    description = "Snack on some grapes in round 7 or 8 on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(round_cleared(1))
              && once(round_cleared(2))
              && once(round_cleared(3))
              && once(round_cleared(4))
              && once(round_cleared(5))
              && once(round_cleared(6))
              && current_round >= 7
              && current_round <= 8
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Destroy a Galaxian flagship in round 9 or 10, Ending the Cameo, 10p
achievement(
    title = "Ending the Cameo",
    points = 10,
    description = "Destroy a Galaxian flagship in round 9 or 10 on default settings",
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
              && once(round_cleared(8))
              && current_round >= 9
              && current_round <= 10
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Chew on some plain bread in round 11 or 12, 10-Dot Bread, 10p
achievement(
    title = "10-Dot Bread",
    points = 10,
    description = "Chew on some plain bread in round 11 or 12 on default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && current_round >= 11
              && current_round <= 12
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Feast on a stack of pancakes in round 13 or higher, Pac-Cake, 10p
achievement(
    title = "Pac-Cake",
    points = 10,
    description = "Feast on a stack of pancakes in round 13 or higher on default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && once(round_cleared(11))
              && once(round_cleared(12))
              && current_round >= 13
              && food_eaten
              && never(game_over)
              && never(title_screen)
)

// Reroute the power going to the lights in exchange for powering up Pac-Man, 1p, Searching in the Dark
achievement(
    title = "Searching in the Dark",
    points = 1,
    description = "Reroute the power from the lights to Pac-Man on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && power_outage
              && never(game_over)
              && never(title_screen)
)

// Consume all four ghosts under the influence of one power-up, 10p, Killtacular
achievement(
    title = "Eating Everything in Sight",
    points = 10,
    description = "Consume all four ghosts under the influence of one power-up on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && four_ghosts_eaten
)

// Clear round 1 without eating any ghosts, Ectopacifist, 5p
achievement(
    title = "Ectopacifist",
    type = "missable",
    points = 5,
    description = "Clear round 1 without eating any ghosts on default settings",
    trigger = default_settings
              && in_game
              && one_player
              && once(prev(press_start) && in_game)
              && trigger_when(round_cleared(1))
              && never(game_over)
              && never(title_screen)
              && never(ghosts_eaten > 0)
)


// Clear rounds 1 through 14 in one playthrough with the difficulty set to Hard, Pac-Man Plus Plus, 50p
achievement(
    title = "Pac-Man Plus Plus",
    points = 50,
    description = "Clear round 14 with the difficulty set to Hard and otherwise default settings",
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
              && once(round_cleared(8))
              && once(round_cleared(9))
              && once(round_cleared(10))
              && once(round_cleared(11))
              && once(round_cleared(12))
              && once(round_cleared(13))
              && once(round_cleared(14))
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
    "Round {0} • Hard Difficulty • Lives: {1} • Score: {2}",
    rich_presence_value("Number", current_round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    in_game && one_player,
    "Round {0} • Normal Difficulty • Lives: {1} • Score: {2}",
    rich_presence_value("Number", current_round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Playing Pac-Man Plus"
)
