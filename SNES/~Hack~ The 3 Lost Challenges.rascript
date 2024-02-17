// ~Hack~ The 3 Lost Challenges
// #ID = 28597

level_id = byte(0x0013bf)
exit_id = byte(0x000dd5)
sprite_pointer = tbyte(0x0000ce)

level_ids = {
    "Deadly Revenge": 0x01,
    "The Underestimated": 0x2A,
    "Lightning Sourcer": 0x5F
}

function level_cleared() {
    return prev(exit_id) == 0
    && exit_id == 1
}

function pikachu_start() {
    return level_id == level_ids["Lightning Sourcer"]
    && prev(sprite_pointer) == 0x48e68a
    && sprite_pointer == 0x48f8ef
}

function pikachu_midway() {
    return level_id == level_ids["Lightning Sourcer"]
    && prev(sprite_pointer) == 0x48f8ef
    && sprite_pointer == 0x48fb09
}

function goomba_start() {
    return level_id == level_ids["The Underestimated"]
    && prev(sprite_pointer) == 0x07e76d
    && sprite_pointer == 0x49fe7f
}

function goomba_midway() {
    return level_id == level_ids["The Underestimated"]
    && prev(sprite_pointer) == 0x49e7af
    && sprite_pointer == 0x49f3ff
}

function peach_start() {
    return level_id == level_ids["Deadly Revenge"]
    && prev(sprite_pointer) == 0
    && sprite_pointer == 0x48d414
}

function peach_midway() {
    return level_id == level_ids["Deadly Revenge"]
    && prev(sprite_pointer) == 0x49d9c2
    && sprite_pointer == 0x49edca
}

function pikachu_beat() {
    return level_id == level_ids["Lightning Sourcer"]
    && level_cleared()
}

function goomba_beat() {
    return level_id == level_ids["The Underestimated"]
    && level_cleared()
}

function peach_beat() {
    return level_id == level_ids["Deadly Revenge"]
    && level_cleared()
}

function speedrun_fail(level) {
    return level_id != level_ids[level]
    || sprite_pointer == 0
}

// Lightning Sourcer
achievement(
    title = "An Unexpected Crossover",
    description = "Clear the first half of \"Lightning Sourcer\"!",
    points = 2,
    trigger = pikachu_midway()
)

achievement(
    title = "Stomping Mice",
    description = "Clear the second half of \"Lightning Sourcer\"!",
    points = 3,
    trigger = pikachu_beat()
)

leaderboard(
    title = "Lightning Sourcer Speedrun",
    description = "Clear the level as fast as you can!",
    start = pikachu_start(),
    cancel = speedrun_fail("Lightning Sourcer"),
    submit = pikachu_beat(), 
    value = measured(always_true()), 
    format = "FRAMES",
    lower_is_better = true
)

// The Underestimated
achievement(
    title = "Crossing Bullets",
    description = "Clear the first half of \"The Underestimated\"!",
    points = 3,
    trigger = goomba_midway()
)

achievement(
    title = "Virtual Boy",
    description = "Clear the second half of \"The Underestimated\"!",
    points = 5,
    trigger = goomba_beat()
)

leaderboard(
    title = "The Underestimated Speedrun",
    description = "Clear the level as fast as you can!",
    start = goomba_start(),
    cancel = speedrun_fail("The Underestimated"),
    submit = goomba_beat(), 
    value = measured(always_true()), 
    format = "FRAMES",
    lower_is_better = true
)

// Deadly Revenge
achievement(
    title = "Role Reversal",
    description = "Clear the first half of \"Deadly Revenge\"!",
    points = 5,
    trigger = peach_midway()
)

achievement(
    title = "Exorcism",
    description = "Clear the second half of \"Deadly Revenge\"!",
    points = 10,
    trigger = peach_beat()
)

leaderboard(
    title = "Deadly Revenge Speedrun",
    description = "Clear the level as fast as you can!",
    start = peach_start(),
    cancel = speedrun_fail("Deadly Revenge"),
    submit = peach_beat(), 
    value = measured(always_true()), 
    format = "FRAMES",
    lower_is_better = true
)
