// Puzz Loop
// #ID = 12267

ModeLookup = {
    0x01: "Stage Mode",
    0x02: "Panic Mode",
    0x03: "VS Mode"
}

ModeToID = {}
for key in ModeLookup {
    ModeToID[ModeLookup[key]] = key
}

DifficultyLookup = {
    0x00: "Easiest",
    0x01: "Very Easy",
    0x02: "Easy",
    0x03: "Normal",
    0x04: "Normal Plus",
    0x05: "Difficult",
    0x06: "Very Difficult",
    0x07: "Most Difficult",
}

DifficultyToID = {}
for key in DifficultyLookup {
    DifficultyToID[DifficultyLookup[key]] = key
}

credits = byte(0x165987)
panic_mode_difficulty = byte(0x01002a)
stage_mode_difficulty = byte(0x01002b)

game_mode = byte(0x0dd7d8)
in_menu = game_mode == 0
panic_mode_level = byte(0x13b4b4)

stage_mode_stage = byte(0x0dd7dd) + 1
stage_mode_level = byte(0x0dd7dc) + 1
chain = byte(0x13b26c)

score = dword(0x13b220)

function cleared_panic_mode_level(num) {
    return prev(panic_mode_level) == num && panic_mode_level == num + 1
}

continued = credits < prev(credits)
continues_disabled = bit6(0x01002f) == 0
free_play_disabled = bit7(0x01002f) == 0
not_demo = bit0(0x0dd7c6) == 1

// Clear Stage 1-1 in Stage Mode on any difficulty! 1p
achievement(
    title = "First Pops",
    points = 1,
    description = "Clear Stage 1-1 in Stage Mode on any difficulty!",
    trigger = free_play_disabled
           && not_demo
           && game_mode == ModeToID["Stage Mode"]
           && stage_mode_stage == 1
           && prev(stage_mode_level) == 1
           && stage_mode_level == 2
)

// Clear Stage 1-5 in Stage Mode on Normal or higher difficulty! 2p
achievement(
    title = "Warming Up",
    points = 2,
    description = "Clear Stage 1-5 in Stage Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty >= DifficultyToID["Normal"]
           && stage_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && prev(stage_mode_stage) == 1
           && stage_mode_stage == 2
)

// Clear Stage 2-5 in Stage Mode on Normal or higher difficulty! 4p
achievement(
    title = "A Bit Loopy",
    points = 4,
    description = "Clear Stage 2-5 in Stage Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty >= DifficultyToID["Normal"]
           && stage_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && prev(stage_mode_stage) == 2
           && stage_mode_stage == 3
)

// Clear Stage 3-5 in Stage Mode on Normal or higher difficulty! 5p
achievement(
    title = "Spiraling Down",
    points = 5,
    description = "Clear Stage 3-5 in Stage Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty >= DifficultyToID["Normal"]
           && stage_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && prev(stage_mode_stage) == 3
           && stage_mode_stage == 4
)

// Clear Stage 4-5 in Stage Mode on Normal or higher difficulty! 10p
achievement(
    title = "Just Like a Rollercoaster",
    points = 10,
    description = "Clear Stage 4-5 in Stage Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty >= DifficultyToID["Normal"]
           && stage_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && prev(stage_mode_stage) == 4
           && stage_mode_stage == 5
)

// Clear Stage 5-5 in Stage Mode on Normal or higher difficulty! 25p
achievement(
    title = "Looptastic",
    type = "win_condition",
    points = 25,
    description = "Clear Stage 5-5 in Stage Mode on Normal or higher difficulty to see the credits!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty >= DifficultyToID["Normal"]
           && stage_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && prev(stage_mode_stage) == 5
           && stage_mode_stage == 6
)

// Clear Stage 5-5 in Stage Mode on Most Difficult difficulty! 50p
achievement(
    title = "Strategist",
    points = 50,
    description = "Clear Stage 5-5 in Stage Mode on Most Difficult difficulty!",
    trigger = free_play_disabled
           && not_demo
           && stage_mode_difficulty == DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Stage Mode"]
           && trigger_when(prev(stage_mode_stage) == 5
           && stage_mode_stage == 6)
)

// Clear Level 10 in Panic Mode on Normal or higher difficulty! 2p
achievement(
    title = "Welcome to the Timer",
    points = 2,
    description = "Clear Level 10 in Panic Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty >= DifficultyToID["Normal"]
           && panic_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(10)
)

// Clear Level 20 in Panic Mode on Normal or higher difficulty! 4p
achievement(
    title = "Now It Gets Tough",
    points = 5,
    description = "Clear Level 20 in Panic Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty >= DifficultyToID["Normal"]
           && panic_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(20)
)

// Clear Level 30 in Panic Mode on Normal or higher difficulty! 5p
achievement(
    title = "Beating the Clock",
    points = 10,
    description = "Clear Level 30 in Panic Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty >= DifficultyToID["Normal"]
           && panic_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(30)
)
// Clear Level 50 in Panic Mode on Normal or higher difficulty! 25p
achievement(
    title = "Half Way to Freedom",
    points = 10,
    description = "Clear Level 50 in Panic Mode on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty >= DifficultyToID["Normal"]
           && panic_mode_difficulty <= DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(50)
)

// Clear Level 75 in Panic Mode on any difficulty! 25p
achievement(
    title = "The Struggle",
    points = 25,
    description = "Clear Level 75 in Panic Mode on any difficulty!",
    trigger = free_play_disabled
           && not_demo
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(75)
)

achievement(
    title = "Survivor",
    type = "win_condition",
    points = 100,
    description = "Reach Level 100 in Panic Mode on any difficulty to see the credits!",
    trigger = free_play_disabled
           && not_demo
           && game_mode == ModeToID["Panic Mode"]
           && cleared_panic_mode_level(99)
)

// Clear Level 50 in Panic Mode on Most Difficult difficulty! 50p
achievement(
    title = "The Tightest Deadline",
    points = 50,
    description = "Clear Level 50 in Panic Mode on Most Difficult difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty == DifficultyToID["Most Difficult"]
           && game_mode == ModeToID["Panic Mode"]
           && trigger_when(cleared_panic_mode_level(50))
)

// Get a chain / combo of 10 or more on Normal or higher difficulty! 3p
achievement(
    title = "Back It Up",
    points = 3,
    description = "Get a chain / combo of 10 or more on Normal or higher difficulty!",
    trigger = free_play_disabled
           && not_demo
           && panic_mode_difficulty >= DifficultyToID["Normal"]
           && panic_mode_difficulty <= DifficultyToID["Most Difficult"]
           && prev(chain) == 9
           && chain == 10
)

// Clear Stage Mode on Normal or higher difficulty with continues disabled! 50p
achievement(
    title = "Planning a Budget",
    points = 50,
    description = "Clear Stage 5-5 in Stage Mode on any difficulty with continues disabled!",
    trigger = free_play_disabled
           && not_demo
           && continues_disabled
           && game_mode == ModeToID["Stage Mode"]
           && trigger_when(prev(stage_mode_stage) == 5
           && stage_mode_stage == 6)
)

// Clear Level 50 in Panic Mode on Normal or higher difficulty with continues disabled! 50p
achievement(
    title = "Budgeting in a Hurry",
    points = 50,
    description = "Clear Level 100 in Panic Mode on any difficulty with continues disabled!",
    trigger = free_play_disabled
           && not_demo
           && continues_disabled
           && game_mode == ModeToID["Panic Mode"]
           && trigger_when(cleared_panic_mode_level(99))
)

for d in DifficultyLookup {
        leaderboard(
        title = format("Stage Mode: {0} High Score", DifficultyLookup[d]),
        description = "Clear Stage 5-5 with as high of a score as possible!",
        start = free_play_disabled
           && not_demo
           && stage_mode_difficulty == d
           && game_mode == ModeToID["Stage Mode"]
           && once(prev(stage_mode_stage) == 5
           && stage_mode_stage == 6)
           && repeated(120, stage_mode_stage == 6)
           && never(stage_mode_stage < 5),
        cancel = always_false(),
        submit = always_true(), 
        value = score
    )
}

for d in DifficultyLookup {
        leaderboard(
        title = format("Panic Mode: {0} High Score", DifficultyLookup[d]),
        description = "Clear Level 100 with as high of a score as possible!",
        start = free_play_disabled
           && not_demo
           && panic_mode_difficulty == d
           && game_mode == ModeToID["Panic Mode"]
           && once(cleared_panic_mode_level(99))
           && repeated(120, panic_mode_level == 100)
           && never(panic_mode_level < 99),
        cancel = always_false(),
        submit = always_true(), 
        value = score
    )
}

rich_presence_conditional_display(
    !free_play_disabled,
    "Free Play enabled! Achievements have been disabled. "
)

rich_presence_conditional_display(
    !in_menu && !not_demo,
    "Watching a demo"
)

rich_presence_conditional_display(
    in_menu,
    "In a menu"
)

rich_presence_conditional_display(
    game_mode == ModeToID["Panic Mode"],
    "Panic Mode • {0} • Level {1} • Score: {2}",
    rich_presence_lookup("Difficulty", panic_mode_difficulty, DifficultyLookup, fallback="Unknown Difficulty"),
    rich_presence_value("Number", panic_mode_level),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    game_mode == ModeToID["Stage Mode"],
    "Stage Mode • {0} • Level {1}-{2} • Score: {3}",
    rich_presence_lookup("Difficulty", stage_mode_difficulty, DifficultyLookup, fallback="Unknown Difficulty"),
    rich_presence_value("Number", stage_mode_stage),
    rich_presence_value("Number", stage_mode_level),
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    game_mode == ModeToID["VS Mode"],
    "VS Mode"
)

rich_presence_display(
    "Now loading..."
)

temp_score = low4(0x8a2d)
+ high4(0x8a2d) * 10
+ low4(0x8a2c) * 100
+ high4(0x8a2c) * 1000
+ low4(0x8a2b) * 10000
+ high4(0x8a2b) * 100000
+ low4(0x8a2a) * 1000000
