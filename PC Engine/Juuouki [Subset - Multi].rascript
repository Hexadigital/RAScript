// Juuouki
// #ID = 29048

in_demo = bit7(0x0008) == 1
stage = byte(0x000e) + 1
single_player = byte(0x0014) == 0
multi_player = byte(0x0014) >= 1
p1_charges = byte(0x0804)
p2_charges = byte(0x0814)
p1_lives = byte(0x0900)
p2_lives = byte(0x0910)
p1_health = byte(0x0800)
p2_health = byte(0x0810)

function get_p1_score() {
    return low4(0x0015) * 100
    + low4(0x0016) * 1000
    + low4(0x0017) * 10000
    + low4(0x0018) * 100000
}

function get_p2_score() {
    return low4(0x001b) * 100
    + low4(0x001c) * 1000
    + low4(0x001d) * 10000
    + low4(0x001e) * 100000
}

function p1_transformed() {
    return prev(p1_charges) == 2
    && p1_charges == 3
}

function p2_transformed() {
    return prev(p2_charges) == 2
    && p2_charges == 3
}

function both_transformed() {
    return prev(p1_charges + p2_charges) == 5
    && p1_charges + p2_charges == 6
}

function stage_cleared(num) {
    return prev(stage) == num
    && stage == num + 1
}

function a_player_is_dead() {
    return (p1_health == 0 && p1_lives == 0) || (p2_health == 0 && p2_lives == 0)
}


// Take on the power of a wolf during Stage 1 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Howling",
    description = "Have both players take on the power of a wolf during Stage 1 in co-op!",
    points = 2,
    trigger = !in_demo && multi_player && stage == 1 && both_transformed()
)


// Clear Stage 1 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Flesh Ripper",
    description = "Clear Stage 1 in co-op!",
    points = 4,
    trigger = !in_demo && multi_player && !a_player_is_dead() && stage_cleared(1)
)

// Take on the power of a dragon during Stage 2 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Against the Law of Least Resistance",
    description = "Have both players take on the power of a dragon during Stage 2 in co-op!",
    points = 2,
    trigger = !in_demo && multi_player && stage == 2 && both_transformed()
)

// Clear Stage 2 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Thunder Vision",
    description = "Clear Stage 2 in co-op!",
    points = 5,
    trigger = !in_demo && multi_player && !a_player_is_dead() && stage_cleared(2)
)

// Take on the power of a bear during Stage 3 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Cave Dweller",
    description = "Have both players take on the power of a bear during Stage 3 in co-op!",
    points = 3,
    trigger = !in_demo && multi_player && stage == 3 && both_transformed()
)

// Clear Stage 3 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Snail Smasher",
    description = "Clear Stage 3 in co-op!",
    points = 5,
    trigger = !in_demo && multi_player && !a_player_is_dead() && stage_cleared(3)
)

// Take on the power of a tiger during Stage 4 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Striped Bouncer",
    description = "Have both players take on the power of a tiger during Stage 4 in co-op!",
    points = 3,
    trigger = !in_demo && multi_player && stage == 4 && both_transformed()
)

// Clear Stage 4 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Strong Things in Small Packages",
    description = "Clear Stage 4 in co-op!",
    points = 10,
    trigger = !in_demo && multi_player && !a_player_is_dead() && stage_cleared(4)
)

// Take on the power of a wolf during Stage 5 in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Lunar Sun",
    description = "Have both players take on the power of a wolf during Stage 5 in co-op!",
    points = 3,
    trigger = !in_demo && multi_player && stage == 5 && both_transformed()
)

// Clear Stage 5 and beat the game in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Burning Horns",
    description = "Clear Stage 5 and beat the game in co-op!",
    points = 25,
    trigger = !in_demo && multi_player && !a_player_is_dead() && stage_cleared(5)
)

// Clear the game with at least 500000 points in co-op!
achievement(
    //id = 0,
    //badge = "0",
    title = "Millionaire",
    description = "Clear the game with at least 1000000 total points in co-op!",
    points = 25,
    trigger = !in_demo && multi_player && stage_cleared(5) && get_p1_score() + get_p2_score() > 1000000
)

leaderboard(
    //id = 0,
    title = "Total High Score",
    description = "",
    start = !in_demo && multi_player && stage_cleared(5),
    cancel = always_false(),
    submit = always_true(), 
    value = get_p1_score() + get_p2_score()
)

life_text = {
    1:"Life"
}

rich_presence_conditional_display(
    p1_lives + p2_lives + get_p1_score() + get_p2_score() == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    single_player,
    "Playing solo • Stage {0} • {1} {2} Remaining • Score: {3}",
    rich_presence_value("Stage", stage),
    rich_presence_value("P1Lives", p1_lives),
    rich_presence_lookup("LifeText", p1_lives, life_text, "Lives"),
    rich_presence_value("P1Score", get_p1_score())
)

rich_presence_conditional_display(
    !single_player && a_player_is_dead(),
    "Playing co-op • Stage {0} • {1} {2} Remaining • Score: {3} • Someone is dead!",
    rich_presence_value("Stage", stage),
    rich_presence_value("P1Lives", p1_lives),
    rich_presence_lookup("LifeText", p1_lives, life_text, "Lives"),
    rich_presence_value("P1Score", get_p1_score())
)

rich_presence_display(
    "Playing co-op • Stage {0} • {1} {2} Remaining • P1 Score: {3} • P2 Score: {4}",
    rich_presence_value("Stage", stage),
    rich_presence_value("TotalLives", p1_lives + p2_lives),
    rich_presence_lookup("LifeText", p1_lives + p2_lives, life_text, "Lives"),
    rich_presence_value("P1Score", get_p1_score()),
    rich_presence_value("P2Score", get_p2_score())
)
