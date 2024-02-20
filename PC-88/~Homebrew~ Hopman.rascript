// ~Homebrew~ Hopman
// #ID = 28625

progression_points = {
    0: 2,
    1: 2,
    2: 2,
    3: 3,
    4: 4,
    5: 4,
    6: 5,
    7: 10
}

challenge_points = {
    0: 3,
    1: 3,
    2: 4,
    3: 4,
    4: 5,
    5: 5,
    6: 5,
    7: 5
}

flag_counts = {
    0: 7,
    1: 9,
    2: 12,
    3: 10,
    4: 21,
    5: 20,
    6: 20,
    7: 18
}

best_times = {
    0: 48,
    1: 72,
    2: 92,
    3: 72,
    4: 180,
    5: 170,
    6: 165,
    7: 155
}

function get_high_score() => word(0xbd27) * 10
function get_lives() => byte(0xbd29)
function get_raw_score() => word(0xbd25)
function get_score() => word(0xbd25) * 10
function get_stage() => byte(0xbd2a)
function get_time() => byte(0xbd2b)
function stage_cleared() => prev(byte(0xbe2d)) == 0 && byte(0xbe2d) == 1

function flag_collector(stage) {
    return measured(repeated(flag_counts[stage], get_raw_score() > prev(get_raw_score())))
    // Reset if on wrong stage
    && never(get_stage() != stage)
    // Reset if level complete jingle
    && never(byte(0xbe2d) == 1)
    // Reset if losing lives
    && never(get_lives() < prev(get_lives()))
}

for stage in range(0, 7) {
    achievement(
        title = format("Stage {0}", stage + 1),
        description = format("Reach the end of stage {0}!", stage + 1),
        points = progression_points[stage],
        trigger = get_stage() == stage && stage_cleared()
    )
    achievement(
        title = format("Perfect Stage {0}", stage + 1),
        description = format("Collect all {0} flags on stage {1}!", flag_counts[stage], stage + 1),
        points = challenge_points[stage],
        trigger = flag_collector(stage)
    )
    achievement(
        title = format("Speedy Stage {0}", stage + 1),
        description = format("Reach the end of stage {0} with at least {1} seconds on the clock!", stage + 1, best_times[stage]),
        points = challenge_points[stage],
        trigger = get_stage() == stage && get_time() >= best_times[stage] && trigger_when(stage_cleared())
    )
}

achievement(
    title = "Did It Once, I'll Do It Again",
    description = "Reach the end of Stage 16 to clear the second loop!",
    points = 10,
    trigger = get_stage() == 15 && stage_cleared()
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
    title = "Highest Round",
    description = "",
    start = prev(get_lives()) == 1 && get_lives() == 0,
    cancel = always_false(),
    submit = always_true(), 
    value = get_stage() + 1
)

rich_presence_conditional_display(
    get_time() == 0 && get_stage() == 0 && get_raw_score() == 0,
    "At the title screen"
)

rich_presence_display(
    "On stage {0} with a score of {1} ({2} lives left)",
    rich_presence_value("Stage", get_stage() + 1),
    rich_presence_value("Score", get_score()),
    rich_presence_value("Lives", get_lives())
)
