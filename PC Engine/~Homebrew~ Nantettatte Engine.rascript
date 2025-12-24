// ~Homebrew~ Nantettatte Engine
// #ID = 28326

lives = byte(0x0add)
score = low4(0x0acd)
        + (high4(0x0acd) * 10)
        + (low4(0x0ace) * 100)
        + (high4(0x0ace) * 1000)
        + (low4(0x0acf) * 10000)
        + (high4(0x0acf) * 100000)
        + (low4(0x0ad0) * 1000000)
        + (high4(0x0ad0) * 10000000)

function game_started() {
    return ((prev(lives) == 0x00) || (prev(lives) == 0xff)) && lives == 0x08
}

function game_over() {
    return prev(lives) == 0x00 && lives == 0xff
}

function soft_reset() {
    return dword(0x0000) == 0 && dword(0x00fc) == 0 && dword(0x01f8) == 0
}

function scored(num) {
    return prev(score) >= num - 500
    && prev(score) < num
    && score >= num
    && score < num + 500
}
        
// Use 500 as the gap to check, highest seems to be 100p

// Score 1000 points!
// Score 5000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "Warming Up",
    description = "Score 1000 points!",
    points = 1,
    trigger = scored(1000)
)


// Score 5000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "Vault Violence",
    description = "Score 5000 points!",
    points = 2,
    trigger = scored(5000)
)

// Score 10000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "NEC Defense",
    description = "Score 10000 points!",
    points = 3,
    trigger = scored(10000)
)

// Score 20000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "Fuji Fighter",
    description = "Score 20000 points!",
    points = 4,
    trigger = scored(20000)
)

// Score 40000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "The Past Outweighs the Future",
    description = "Score 40000 points!",
    points = 5,
    trigger = scored(40000)
)

// Score 80000 points!
achievement(
    //id = 0,
    //badge = "0",
    title = "The HuCOUNCIL's Secret Weapon",
    description = "Score 80000 points!",
    points = 10,
    trigger = scored(80000)
)

// Score 10000 points without losing a life!
achievement(
    //id = 0,
    //badge = "0",
    title = "RomRom's Guardian Angel",
    description = "Score 10000 points without losing a life!",
    points = 5,
    trigger = once(game_started()) && trigger_when(scored(10000)) && never(lives < prev(lives) && prev(lives) != 0xff) && never(soft_reset())
)

leaderboard(
    //id = 0,
    title = "High Score",
    description = "",
    start = game_over(),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    lives == 0xff,
    "Score: {0} • Game Over!",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    once(game_started()) && never(soft_reset()),
    "Score: {0} • Lives Remaining: {1}",
    rich_presence_value("Score", score),
    rich_presence_value("Lives", lives)
)

rich_presence_display(
    "At the title screen"
)
