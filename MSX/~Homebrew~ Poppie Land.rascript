// ~Homebrew~ Poppie Land
// #ID = 33900

function addr_offset() => ~bit0(0x00FC48) * 0x004000

game_state = byte(0x0072ae + addr_offset())
stage = byte(0x0072ab + addr_offset()) + 1
power = byte(0x0072b5 + addr_offset())
score = byte(0x0072b7 + addr_offset()) * 10

game_start = prev(game_state) == 0 && game_state == 1
game_over = prev(game_state) == 1 && game_state == 2 && power == 0
stage_clear = prev(game_state) == 1 && game_state == 3 && power > 0

// Clear Stage 1, 2p
achievement(
    type = "progression",
    title = "Blue Cubes",
    points = 2,
    description = "Clear Stage 1",
    trigger = stage == 1 && stage_clear
)

// Clear Stage 2, 3p
achievement(
    type = "progression",
    title = "Checkered Climb",
    points = 3,
    description = "Clear Stage 2",
    trigger = stage == 2 && stage_clear
)

// Clear Stage 3, 4p
achievement(
    type = "progression",
    title = "Green Power",
    points = 4,
    description = "Clear Stage 3",
    trigger = stage == 3 && stage_clear
)

// Clear Stage 4, 5p
achievement(
    type = "progression",
    title = "Missing Texture",
    points = 5,
    description = "Clear Stage 4",
    trigger = stage == 4 && stage_clear
)

// Clear Stage 5, 5p
achievement(
    type = "progression",
    title = "Iced Up",
    points = 5,
    description = "Clear Stage 5",
    trigger = stage == 5 && stage_clear
)

// Clear Stage 6, 5p
achievement(
    type = "progression",
    title = "Breaking Boundaries",
    points = 5,
    description = "Clear Stage 6",
    trigger = stage == 6 && stage_clear
)

// Clear Stage 7, 10p
achievement(
    type = "progression",
    title = "Hardware Access",
    points = 10,
    description = "Clear Stage 7",
    trigger = stage == 7 && stage_clear
)

// Clear Stage 8, finishing the first loop, 10p
achievement(
    type = "win_condition",
    title = "The Red Room",
    points = 10,
    description = "Clear Stage 8, finishing the first loop",
    trigger = stage == 8 && stage_clear
)

achievement(
    title = "Immortal Climber",
    points = 25,
    description = "Clear Stage 16, finishing the second loop",
    trigger = stage == 16 && stage_clear
)

// Clear Stage 1 without taking damage, 10p
achievement(
    type = "missable",
    title = "Bouncing Blind",
    points = 10,
    description = "Clear Stage 1 without taking damage",
    trigger = once(game_start && power == 3)
    && trigger_when(stage_clear)
    && never(stage != 1)
    && never(power < prev(power))
    && never(game_state == 0)
)

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// Highest Stage
leaderboard(
    title = "Highest Stage",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = stage
)

// Rich Presence
rich_presence_conditional_display(
    game_state == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    game_state == 1,
    "On Stage {0} • {1} Power Remaining • Score: {2}",
    rich_presence_value("Stage", stage),
    rich_presence_value("Power", power),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    game_state == 2,
    "On Stage {0} • Game Over! • Score: {1}",
    rich_presence_value("Stage", stage),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    game_state == 3,
    "Cleared Stage {0}! • {1} Power Remaining • Score: {2}",
    rich_presence_value("Stage", stage),
    rich_presence_value("Power", power),
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Loading..."
)
