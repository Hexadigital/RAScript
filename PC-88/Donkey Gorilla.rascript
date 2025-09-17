// Donkey Gorilla
// #ID = 34876

v2_offset = bit0(0x0084a2) * 0x100

screen_number = mbf32_le(0x00853c + v2_offset)
lives = mbf32_le(0x008522 + v2_offset)
score = (low4(0x00e061 + v2_offset) * 10) + (low4(0x00e062 + v2_offset) * 100) + (low4(0x00e063 + v2_offset) * 1000)

still_alive = lives >= 1
game_over = screen_number >= 1 && prev(lives) == 1 && lives == 0

function screen_cleared(num) {
    return prev(screen_number) == num && screen_number == num + 1
}

function scored(num) {
    return prev(score) >= num - 200 && prev(score) < num && score >= num && score < num + 200
}

// Clear Stage 1
achievement(
    title = "Just Trying to Live",
    type = "progression",
    points = 1,
    description = "Clear Scene 1",
    trigger = still_alive && screen_cleared(1)
)

// Clear Stage 3
achievement(
    title = "Learning to Love",
    type = "progression",
    points = 2,
    description = "Clear Scene 3",
    trigger = still_alive && screen_cleared(3)
)

// Clear Stage 5
achievement(
    title = "Grieving Gorillas",
    type = "progression",
    points = 4,
    description = "Clear Scene 5",
    trigger = still_alive && screen_cleared(5)
)

// Clear Stage 8
achievement(
    title = "Ape Annihilator",
    type = "win_condition",
    points = 5,
    description = "Clear Scene 8",
    trigger = still_alive && screen_cleared(8)
)

// Score 500 points
achievement(
    title = "Racking Up Kills",
    points = 3,
    description = "Score 500 points",
    trigger = still_alive && scored(500)
)

// Score 1000 points
achievement(
    title = "The Final Digit",
    points = 5,
    description = "Score 1000 points",
    trigger = still_alive && scored(1000)
)

// Clear the first three scenes without losing any lives
achievement(
    title = "My (Spare) Heart Goes Out to You",
    type = "missable",
    points = 10,
    description = "Clear the first three scenes without losing any lives",
    trigger = screen_number >= 1 && lives == 5 && trigger_when(screen_cleared(3))
)

// Kill a bat
achievement(
    title = "I Love Swooping",
    points = 1,
    description = "Kill a bat",
    trigger = still_alive && score >= prev(score) + 200 && score > prev(score) + 20
)

leaderboard(
    title = format("High Score"),
    description = "",
    start  = game_over,
    cancel = always_false(),
    submit = always_true(),
    value  = score
)

leaderboard(
    title = format("Highest Screen"),
    description = "",
    start  = game_over,
    cancel = always_false(),
    submit = always_true(),
    value  = screen_number
)

rich_presence_conditional_display(
    screen_number <= 0 && lives <= 0,
    "At the title screen"
)

rich_presence_conditional_display(
    lives == 5 && screen_number == 0,
    "Now loading..."
)

rich_presence_conditional_display(
    lives == 0 && screen_number >= 0,
    "Game Over • Score: {0}",
    rich_presence_value("Number", score)
)

lives_text = {
    1: "fe"
}

rich_presence_display(
    "Screen {0} • {1} Li{2} Remaining • Score: {3}",
    rich_presence_value("Number", screen_number),
    rich_presence_value("Number", lives),
    rich_presence_lookup("Stage", lives, lives_text, fallback="ves"),
    rich_presence_value("Number", score)
)
