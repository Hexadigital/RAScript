// L-DIS
// #ID = 8841

stage_id = byte(0x001a1e)
score = word(0x001a0f) * 100
lives = byte(0x001a11)
weapon_power = byte(0x001a18)
arms_type = byte(0x001a19)
difficulty = byte(0x001a29)

debug_menu_activated = prev(byte(0x001e18)) == 8 && byte(0x001e18) == 9

disable_debug_menu = disable_when(debug_menu_activated)

// Clear the first stage on Normal or higher difficulty, 3p
// stage 0x02 -> 0x03
achievement(
    type = "progression",
    title = "Knight Vision",
    points = 3,
    description = "Clear the first stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 2
    && stage_id == 3
    && disable_debug_menu
)

// Clear the second stage on Normal or higher difficulty, 5p
// stage 0x03 -> 0x04
achievement(
    type = "progression",
    title = "Dual-Type",
    points = 5,
    description = "Clear the second stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 3
    && stage_id == 4
    && disable_debug_menu
)

// Clear the third stage on Normal or higher difficulty, 5p
// stage 0x04 -> 0x05
achievement(
    type = "progression",
    title = "Size Isn't Everything",
    points = 5,
    description = "Clear the third stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 4
    && stage_id == 5
    && disable_debug_menu
)

// Clear the fourth stage on Normal or higher difficulty, 10p
// stage 0x05 -> 0x06
achievement(
    type = "progression",
    title = "A Snippy Attitude",
    points = 10,
    description = "Clear the fourth stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 5
    && stage_id == 6
    && disable_debug_menu
)

// Clear the fifth stage on Normal or higher difficulty, 10p
// stage 0x06 -> 0x07
achievement(
    type = "progression",
    title = "Maze Chase",
    points = 10,
    description = "Clear the fifth stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 6
    && stage_id == 7
    && disable_debug_menu
)

// Clear the sixth stage on Normal or higher difficulty, 10p
// stage 0x07 -> 0x08
achievement(
    type = "progression",
    title = "A Tail for the Ages",
    points = 10,
    description = "Clear the sixth stage on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 7
    && stage_id == 8
    && disable_debug_menu
)

// Beat the game on Normal or higher difficulty, 25p
// stage 0x08 -> 0x09
achievement(
    type = "win_condition",
    title = "End of the Hunt",
    points = 25,
    description = "Beat the game on Normal or higher difficulty",
    trigger = difficulty >= 1
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu
)

// Beat the game on Hard difficulty, 10p
achievement(
    title = "As If It Wasn't Hard Already",
    points = 10,
    description = "Beat the game on Hard difficulty",
    trigger = difficulty == 2
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu
)

// Beat the game on Normal or higher difficulty without using a continue, 50p
achievement(
    type = "missable",
    title = "Perfect Imagination",
    points = 50,
    description = "Beat the game on Normal or higher difficulty without using a continue",
    trigger = difficulty >= 1
    && once(prev(stage_id) == 1
        && stage_id == 2
        && never(prev(lives) == 1 && lives == 0))
    && trigger_when(prev(stage_id) == 8
        && stage_id == 9)
    && disable_debug_menu
)

// Beat the game using the ARMS-A weapons on Normal or higher difficulty, 10p
achievement(
    title = "Straightforward Thinking",
    points = 10,
    description = "Beat the game using the ARMS-A weapons on Normal or higher difficulty",
    trigger = difficulty >= 1
    && arms_type == 0
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu
)

// Beat the game using the ARMS-B weapons on Normal or higher difficulty, 10p
achievement(
    title = "Creative Thinking",
    points = 10,
    description = "Beat the game using the ARMS-B weapons on Normal or higher difficulty",
    trigger = difficulty >= 1
    && arms_type == 1
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu
)

// Beat the game using the ARMS-C weapons on Normal or higher difficulty, 10p
achievement(
    title = "Thinking Outside the Box",
    points = 10,
    description = "Beat the game using the ARMS-C weapons on Normal or higher difficulty",
    trigger = difficulty >= 1
    && arms_type == 2
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu
)

// Max out your weapon's power on Normal or higher difficulty, 2p
// power 0x05 -> 0x06
achievement(
    title = "A Strong Smile",
    points = 2,
    description = "Max out your weapon's power on Normal or higher difficulty",
    trigger = difficulty >= 1
    && stage_id >= 2
    && stage_id <= 8
    && prev(weapon_power) == 5
    && weapon_power == 6
    && disable_debug_menu
)

leaderboard(
    title = "High Score: Normal ARMS-A",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 1
    && arms_type == 0
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Normal ARMS-B",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 1
    && arms_type == 1
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Normal ARMS-C",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 1
    && arms_type == 2
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Hard ARMS-A",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 2
    && arms_type == 0
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Hard ARMS-B",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 2
    && arms_type == 1
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Hard ARMS-C",
    description = "Beat the game with as high of a score as you can!",
    start = difficulty == 2
    && arms_type == 2
    && prev(stage_id) == 8
    && stage_id == 9
    && disable_debug_menu,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    once(debug_menu_activated),
    "Debug menu activated, achievements disabled!"
)

rich_presence_conditional_display(
    stage_id == 0,
    "Now loading..."
)

rich_presence_conditional_display(
    stage_id == 1,
    "At the title screen"
)

difficulty_lookup = {
    0: "Easy",
    1: "Normal",
    2: "Hard"
}

lives_lookup = {
    1: "Life"
}

rich_presence_conditional_display(
    stage_id == 8,
    "Facing the final boss • {0} Difficulty • {1} {2} Remaining • Score: {3}",
    rich_presence_lookup("Difficulty", difficulty, difficulty_lookup, fallback="Unknown"),
    rich_presence_value("Number", lives),
    rich_presence_lookup("Lives", lives, lives_lookup, fallback="Lives"),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    stage_id == 9,
    "Celebrating victory • {0} Difficulty • Score: {1}",
    rich_presence_lookup("Difficulty", difficulty, difficulty_lookup, fallback="Unknown"),
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Stage {0} • {1} Difficulty • {2} {3} Remaining • Score: {4}",
    rich_presence_value("Number", stage_id - 1),
    rich_presence_lookup("Difficulty", difficulty, difficulty_lookup, fallback="Unknown"),
    rich_presence_value("Number", lives),
    rich_presence_lookup("Lives", lives, lives_lookup, fallback="Lives"),
    rich_presence_value("Number", score)
)
