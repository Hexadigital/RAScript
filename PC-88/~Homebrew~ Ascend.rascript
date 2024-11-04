// ~Homebrew~ Ascend
// #ID = 31315

function get_high_score() => word(0xbc02) * 10
function get_lives() => byte(0xbc04)
function get_raw_score() => word(0xbc00)
function get_score() => word(0xbc00) * 10
function get_stage() => byte(0xbc05) + 1
function get_time() => byte(0xbc06)

game_start = get_lives() == 3 && get_stage() == 1 && get_time() == 160

// Clear stage 1
achievement(
    type = "progression",
    title = "Every Climb Starts Somewhere",
    description = "Clear stage 1",
    points = 1,
    trigger = get_lives() > 0 && prev(get_stage()) == 1 && get_stage() == 2
)

// Clear stage 2
achievement(
    type = "progression",
    title = "Gentle Incline",
    description = "Clear stage 2",
    points = 2,
    trigger = get_lives() > 0 && prev(get_stage()) == 2 && get_stage() == 3
)

// Clear stage 4
achievement(
    type = "progression",
    title = "Climbing Four Glory",
    description = "Clear stage 4",
    points = 4,
    trigger = get_lives() > 0 && prev(get_stage()) == 4 && get_stage() == 5
)

// Clear stage 6
achievement(
    type = "progression",
    title = "Halfway to Heaven",
    description = "Clear stage 6",
    points = 5,
    trigger = get_lives() > 0 && prev(get_stage()) == 6 && get_stage() == 7
)

// Clear stage 8
achievement(
    type = "progression",
    title = "Reaching Upwards",
    description = "Clear stage 8",
    points = 5,
    trigger = get_lives() > 0 && prev(get_stage()) == 8 && get_stage() == 9
)

// Clear stage 10, completing the first loop
achievement(
    type = "win_condition",
    title = "Ascension Complete",
    description = "Clear stage 10, completing the first loop",
    points = 10,
    trigger = get_lives() > 0 && prev(get_stage()) == 10 && get_stage() == 11
)

// Clear stage 20, completing the second loop
achievement(
    title = "I Know These Ladders",
    description = "Clear stage 20, completing the second loop",
    points = 10,
    trigger = get_lives() > 0 && prev(get_stage()) == 20 && get_stage() == 21
)

// Clear stages 1 through 10 without losing a life
achievement(
    type = "missable",
    title = "Rising Up to the Challenge",
    description = "Clear stages 1 through 10 without losing a life",
    points = 10,
    trigger = once(game_start) && never(get_lives() < prev(get_lives())) && never(get_stage() < prev(get_stage()))
           && trigger_when(prev(get_stage()) == 10 && get_stage() == 11)
)

leaderboard(
    title = "High Score",
    description = "",
    start = prev(get_lives()) == 1 && get_lives() == 0,
    cancel = always_false(),
    submit = always_true(), 
    value = get_score()
)

leaderboard(
    title = "Highest Stage",
    description = "",
    start = prev(get_lives()) == 1 && get_lives() == 0,
    cancel = always_false(),
    submit = always_true(), 
    value = get_stage()
)

rich_presence_conditional_display(
    get_time() == 0 && get_stage() == 0 && get_raw_score() == 0,
    "At the title screen"
)

rich_presence_display(
    "On stage {0} with a score of {1} ({2} lives left)",
    rich_presence_value("Stage", get_stage()),
    rich_presence_value("Score", get_score()),
    rich_presence_value("Lives", get_lives())
)
