// Puzzle Kana?
// #ID = 19755
mode_check = dword(0x8c)
title_screen = mode_check == 0x6c746974
continue_screen = mode_check == 0x65766f22
in_game = mode_check == 0x494e49f5
ufo_minigame = mode_check == 0x4c4c4142
roulette_minigame = mode_check == 0x28432c29
bios = dword(0x008c) == 0

// $86B2: Lives [8-bit]
lives = byte(0x0086B2)
ufo_lives = byte(0x008666)
roulette_lives = byte(0x00864e)

// $86B8: Stage [8-bit]
stage = byte(0x0086B8)
game_start = prev(stage) == 0 && stage == 1

// $86FB: Balls Remaining [8-bit]
balls_remaining = byte(0x0086FB)

function stage_start(num) {
    return prev(stage) == num - 1 && stage == num
}

function stage_complete(num) {
    return stage == num && prev(balls_remaining) == 1 && balls_remaining == 0
}

function stage_complete_2(num) {
    return prev(stage) == num && stage == num + 1
}

// Complete stage 1
achievement(
    type = "progression",
    title = "I am Kana",
    points = 1,
    description = "Complete stage 1",
    trigger = in_game && stage_complete_2(1)
)

// Complete stage 5 (get password: nekomi)
achievement(
    type = "progression",
    title = "Red Runner",
    points = 2,
    description = "Complete stage 5",
    trigger = in_game && stage_complete_2(5)
)

// Complete stage 10 (get password: paokun)
achievement(
    type = "progression",
    title = "Sokoban Slider",
    points = 4,
    description = "Complete stage 10",
    trigger = in_game && stage_complete_2(10)
)

// Complete stage 15 (get password: gomada)
achievement(
    type = "progression",
    title = "Throw Them Up High",
    points = 5,
    description = "Complete stage 15",
    trigger = in_game && stage_complete_2(15)
)

// Complete stage 20 (get password: y2dayo)
achievement(
    type = "progression",
    title = "Ballistic Brilliance",
    points = 5,
    description = "Complete stage 20",
    trigger = in_game && stage_complete_2(20)
)

// Complete stage 25 (get password: kanayo)
achievement(
    type = "progression",
    title = "Test Your Luck",
    points = 5,
    description = "Complete stage 25",
    trigger = in_game && stage_complete_2(25)
)

// Complete stage 30 and beat the game (credits)
achievement(
    type = "win_condition",
    title = "Rolling with Style",
    points = 10,
    description = "Complete stage 30 and beat the game",
    trigger = in_game && stage_complete(30)
)

// Complete stages 1 through 5 without losing a life
achievement(
    type = "missable",
    title = "Red Perfectionist",
    points = 10,
    description = "Complete stages 1 through 5 without losing a life",
    trigger = prev(stage) > 0
    && prev(stage) <= 5
    && trigger_when(once(stage_complete(1))
    && once(stage_complete(2))
    && once(stage_complete(3))
    && once(stage_complete(4))
    && once(stage_complete(5)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Complete stages 6 through 10 without losing a life
achievement(
    type = "missable",
    title = "On the Sunny Slide",
    points = 10,
    description = "Complete stages 6 through 10 without losing a life",
    trigger = prev(stage) > 5
    && prev(stage) <= 10
    && trigger_when(once(stage_complete(6))
    && once(stage_complete(7))
    && once(stage_complete(8))
    && once(stage_complete(9))
    && once(stage_complete(10)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Complete stages 11 through 15 without losing a life
achievement(
    type = "missable",
    title = "A Perfect Throw",
    points = 10,
    description = "Complete stages 11 through 15 without losing a life",
    trigger = prev(stage) > 10
    && prev(stage) <= 15
    && trigger_when(once(stage_complete(11))
    && once(stage_complete(12))
    && once(stage_complete(13))
    && once(stage_complete(14))
    && once(stage_complete(15)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Complete stages 16 through 20 without losing a life
achievement(
    type = "missable",
    title = "Brilliant Mind",
    points = 10,
    description = "Complete stages 16 through 20 without losing a life",
    trigger = prev(stage) > 15
    && prev(stage) <= 20
    && trigger_when(once(stage_complete(16))
    && once(stage_complete(17))
    && once(stage_complete(18))
    && once(stage_complete(19))
    && once(stage_complete(20)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Complete stages 21 through 25 without losing a life
achievement(
    type = "missable",
    title = "Ready to Gamble",
    points = 10,
    description = "Complete stages 21 through 25 without losing a life",
    trigger = prev(stage) > 20
    && prev(stage) <= 25
    && trigger_when(once(stage_complete(21))
    && once(stage_complete(22))
    && once(stage_complete(23))
    && once(stage_complete(24))
    && once(stage_complete(25)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Complete stages 26 through 30 without losing a life
achievement(
    type = "missable",
    title = "Thank You for Playing!",
    points = 10,
    description = "Complete stages 26 through 30 without losing a life",
    trigger = prev(stage) > 25
    && prev(stage) <= 30
    && trigger_when(once(stage_complete(26))
    && once(stage_complete(27))
    && once(stage_complete(28))
    && once(stage_complete(29))
    && once(stage_complete(30)))
    && disable_when(in_game && prev(in_game) && lives < prev(lives))
    && (always_false() || never(title_screen || stage < prev(stage)))
)

// Get an extra life on the UFO shooter bonus stage! (16, lives += 1)
achievement(
    type = "missable",
    title = "UFO Destroyer",
    points = 1,
    description = "Get an extra life on the UFO shooter bonus stage",
    trigger = ufo_minigame
    && ufo_lives == prev(ufo_lives) + 1
)

// Get four extra lives on the UFO shooter bonus stage! (16, lives += 1, 4 hits)
achievement(
    type = "missable",
    title = "UFO Obliterator",
    points = 3,
    description = "Get four extra lives on the UFO shooter bonus stage",
    trigger = ufo_minigame
    && repeated(4, ufo_lives == prev(ufo_lives) + 1)
    && never(!ufo_minigame)
)

// Get an extra life on the roulette bonus stage! (26, lives += 1)
achievement(
    type = "missable",
    title = "Lucky Spin",
    points = 2,
    description = "Get an extra life on the roulette bonus stage",
    trigger = roulette_minigame
    && roulette_lives == prev(roulette_lives) + 1
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen"
)

rich_presence_conditional_display(
    continue_screen,
    "Continue?"
)

rich_presence_conditional_display(
    ufo_minigame,
    "Aiming at the UFO"
)

rich_presence_conditional_display(
    roulette_minigame,
    "Testing her luck"
)

BallTextLookup = {1: "Ball"}
LifeTextLookup = {1: "Life"}

rich_presence_conditional_display(
    in_game,
    "Stage {0} • {1} {2} • {3} {4} Remaining",
    rich_presence_value("Number", stage),
    rich_presence_value("Number", balls_remaining),
    rich_presence_lookup("Balls", balls_remaining, BallTextLookup, fallback="Balls"),
    rich_presence_value("Number", lives),
    rich_presence_lookup("Lives", lives, LifeTextLookup, fallback="Lives")
)

rich_presence_display(
    "Now loading..."
)
