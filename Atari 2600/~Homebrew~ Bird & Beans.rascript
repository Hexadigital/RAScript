// ~Homebrew~ Bird & Beans
// #ID = 26027

in_game = bit0(0x0033) == 1
difficulty = byte(0x005d) / 5
seed_spitter = bit6(0x005c) == 1
tiles = byte(0x0035)
player_x = byte(0x001f)

player_out_of_bounds = player_x < 0x12 || player_x > 0x8c

pause_if_out_of_bounds = disable_when(player_out_of_bounds, until=prev(!in_game)) 

score_ones = byte(0x0004) / 5
score_tens = byte(0x0003) * 2
score_hundreds = byte(0x0002) * 20
score_thousands = byte(0x0001) * 200
score_tenthousands = byte(0x0000) * 2000

score = score_ones + score_tens + score_hundreds + score_thousands + score_tenthousands

function score_earned(target) {
    return prev(score) >= target - 500 && prev(score) < target
        && score >= target && score < target + 500
}

// Earn 1000 points in regular mode!
achievement(
    title = "Bean Nibbler",
    points = 1,
    type = "progression",
    description = "Earn 1000 points in regular mode without going out of bounds",
    trigger = in_game && !seed_spitter && score_earned(1000) && pause_if_out_of_bounds
)

// Earn 5000 points in regular mode!
achievement(
    title = "Bean Eater",
    points = 3,
    type = "progression",
    description = "Earn 5000 points in regular mode without going out of bounds",
    trigger = in_game && !seed_spitter && score_earned(5000) && pause_if_out_of_bounds
)

// Earn 10000 points in regular mode!
achievement(
    title = "Bean Muncher",
    points = 5,
    type = "progression",
    description = "Earn 10000 points in regular mode without going out of bounds",
    trigger = in_game && !seed_spitter && score_earned(10000) && pause_if_out_of_bounds
)

// Earn 10000 points in regular mode on difficulty 2 or higher!
achievement(
    title = "Bean Gobbler",
    points = 10,
    description = "Earn 10000 points in regular mode on difficulty 2 or higher without going out of bounds",
    trigger = in_game && !seed_spitter && difficulty >= 2 && score_earned(10000) && pause_if_out_of_bounds
)

// Earn 5000 points in regular mode on difficulty 4!
achievement(
    title = "Bean Maniac",
    points = 10,
    description = "Earn 5000 points in regular mode on difficulty 4 without going out of bounds",
    trigger = in_game && !seed_spitter && difficulty == 4 && score_earned(5000) && pause_if_out_of_bounds
)

// Earn 5000 points in seed-spitter mode!
achievement(
    title = "Bean Breaker",
    points = 3,
    type = "progression",
    description = "Earn 5000 points in seed-spitter mode without going out of bounds",
    trigger = in_game && seed_spitter && score_earned(5000) && pause_if_out_of_bounds
)

// Earn 10000 points in seed-spitter mode!
achievement(
    title = "Bean Sniper",
    points = 5,
    type = "progression",
    description = "Earn 10000 points in seed-spitter mode without going out of bounds",
    trigger = in_game && seed_spitter && score_earned(10000) && pause_if_out_of_bounds
)

// Earn 10000 points in seed-spitter mode on difficulty 2 or higher!
achievement(
    title = "Bean Destroyer",
    points = 10,
    description = "Earn 10000 points in seed-spitter mode on difficulty 2 or higher without going out of bounds",
    trigger = in_game && seed_spitter && difficulty >= 2 && score_earned(10000) && pause_if_out_of_bounds
)

// Earn 5000 points in seed-spitter mode on difficulty 4!
achievement(
    title = "Bullet Seed",
    points = 10,
    description = "Earn 5000 points in seed-spitter mode on difficulty 4 without going out of bounds",
    trigger = in_game && seed_spitter && difficulty == 4 && score_earned(5000) && pause_if_out_of_bounds
)

// Consume 50 white seeds in one session!
achievement(
    title = "Gluing The Holes",
    points = 2,
    description = "Use white beans to patch more than 50 holes in one session without going out of bounds",
    trigger = in_game && measured(repeated(50, in_game && prev(bit0(0x0033)) == 1 && (tiles - prev(tiles) == 1))) && pause_if_out_of_bounds
)

// Use blue seeds to restore more than 5 tiles at once on ten different occasions in one session!
achievement(
    title = "A Bit of Spit Will Polish These Floors",
    points = 4,
    description = "Use blue seeds to restore more than five tiles at once on ten different occasions in one session without going out of bounds",
    trigger = in_game && measured(repeated(10, in_game && prev(bit0(0x0033)) == 1 && (tiles - prev(tiles) >= 5))) && pause_if_out_of_bounds
)

//////////////////
// LEADERBOARDS //
//////////////////

function get_lb_mode(mode) {
    if mode == "Seed-Spitter" {
        return seed_spitter
    }
    return !seed_spitter
}

for mode in ["Regular", "Seed-Spitter"] {
    for diff in range(0, 4) {
        leaderboard(
            title = format("{0}: Difficulty {1} High Score", mode, diff),
            description = "",
            start  = prev(bit0(0x0033)) == 1 && !in_game && difficulty == diff && get_lb_mode(mode) && pause_if_out_of_bounds,
            cancel = always_false(),
            submit = always_true(),
            value = score
        )
    }
}

rich_presence_conditional_display(
    in_game && once(player_out_of_bounds) && never(prev(!in_game)),
    "Out of bounds, achievements disabled! | {2} Tiles Remaining | Difficulty: {0} | Score: {1}",
    rich_presence_value("Number", difficulty),
    rich_presence_value("Number", score),
    rich_presence_value("Number", tiles)
)

rich_presence_conditional_display(
    in_game && seed_spitter,
    "Shooting down beans | {2} Tiles Remaining | Difficulty: {0} | Score: {1}",
    rich_presence_value("Number", difficulty),
    rich_presence_value("Number", score),
    rich_presence_value("Number", tiles)
    
)

rich_presence_conditional_display(
    in_game,
    "Eating beans | {2} Tiles Remaining | Difficulty: {0} | Score: {1}",
    rich_presence_value("Number", difficulty),
    rich_presence_value("Number", score),
    rich_presence_value("Number", tiles)
)

rich_presence_display(
    "Preparing to have a beantastic time"
)
