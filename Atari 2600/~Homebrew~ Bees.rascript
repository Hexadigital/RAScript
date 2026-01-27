// ~Homebrew~ Bees
// #ID = 37923

score = low4(0x0015)
+ high4(0x0015)  * 10
+ low4(0x0014) * 100
+ high4(0x0014)  * 1000
+ low4(0x0013) * 10000
+ high4(0x0013)  * 100000

bullet_height = byte(0x0057)
bullet_loaded = bullet_height == 0x0a
bullet_fired = bullet_height < 0x0a && bullet_height > 0x00
bullet_missed = bullet_height == 0x00
bee_shot = prev(bullet_fired) && score == prev(score) + 1
pfblock_shot = prev(bullet_fired) && bullet_loaded && score == prev(score)

title_screen = word(0x000e) == 0x0000
in_game = word(0x000e) == 0x0808

function scored(num) {
    return (prev(score) == num - 1 || prev(score) == num - 2) && score == num
}

// Score 10 points
achievement(
    title = "Practically a Free Bee",
    type = "progression",
    points = 1,
    description = "Score 10 points",
    trigger = in_game && scored(10)
)

// Score 25 points
achievement(
    title = "Beelieve in Yourself",
    type = "progression",
    points = 1,
    description = "Score 25 points",
    trigger = in_game && scored(25)
)

// Score 50 points
achievement(
    title = "Bee Gone",
    type = "progression",
    points = 1,
    description = "Score 50 points",
    trigger = in_game && scored(50)
)

// Score 100 points
achievement(
    title = "A Force to Bee Reckoned With",
    type = "win_condition",
    points = 2,
    description = "Score 100 points",
    // scored(100) would also work here but I want to sneak in Remember Recall to get players to update
    trigger = in_game && (prev(score) % 100) == 99 && (score % 100) == 0
)

// Shoot 5 bees in a row without missing or hitting a pfblock
achievement(
    title = "Serious Beesness",
    points = 2,
    description = "Shoot 5 bees in a row without missing or hitting a pfblock",
    trigger = measured(repeated(5, in_game && bee_shot && never(bullet_missed) && never(pfblock_shot)))
)

// Destroy 20 pfblocks in a row without missing or hitting a bee
achievement(
    title = "A Baker's Buzzin'",
    points = 2,
    description = "Destroy 13 pfblocks in a row without missing or hitting a bee",
    trigger = measured(repeated(13, in_game && pfblock_shot && never(bullet_missed) && never(bee_shot)))
)

leaderboard(
    title = "High Score",
    description = "Submits every 100 points",
    start = in_game && (prev(score) % 100) == 99 && (score % 100) == 0,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    in_game,
    "Shooting bees and pfblocks • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_display(
    "At the title screen"
)
