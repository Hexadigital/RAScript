// ~Homebrew~ Katamari!
// #ID = 26087

StageTypes = {
    "Rolling": 0x80000080,
    "Next!": 0x045f2e09,
    "Dodging": 0x7b7b7b7b,
    "Planet": 0x00110000,
    "Game Over": 0x0d99b366,
    "Title Screen": 0xd5aa52ca
}

score_x1 = low4(0x0015) + high4(0x0015) * 10
score_x100 = low4(0x0014) * 100 + high4(0x0014) * 1000
score_x10000 = low4(0x0013) * 10000 + high4(0x0013) * 100000

score = score_x1 + score_x100 + score_x10000

function scored(num) {
    return prev(score) == num - 10 && score == num
}

stage = dword(0x0030)


// Clear the rolling stage for the first time!
achievement(
    type = "progression",
    title = "Rolling Up",
    points = 1,
    description = "Clear the rolling stage for the first time!",
    trigger = prev(stage) == StageTypes["Rolling"] && stage == StageTypes["Next!"]
)

// Clear the dodging stage for the first time!
achievement(
    type = "progression",
    title = "Fast as Lightning",
    points = 1,
    description = "Clear the dodging stage for the first time!",
    trigger = prev(stage) == StageTypes["Dodging"] && stage == StageTypes["Planet"]
)

// Clear the second loop!
achievement(
    type = "win_condition",
    title = "Recycling",
    points = 2,
    description = "Clear the second loop!",
    trigger = repeated(2, prev(stage) == StageTypes["Dodging"] && stage == StageTypes["Planet"]) && never(score < prev(score))
)

// Clear the third loop!
achievement(
    title = "Turkey",
    points = 3,
    description = "Clear the third loop!",
    trigger = repeated(3, prev(stage) == StageTypes["Dodging"] && stage == StageTypes["Planet"]) && never(score < prev(score))
)

// Clear the fifth loop!
achievement(
    title = "Expert Roller",
    points = 5,
    description = "Clear the fifth loop!",
    trigger = repeated(5, prev(stage) == StageTypes["Dodging"] && stage == StageTypes["Planet"]) && never(score < prev(score))
)

achievement(
    title = "Katwomari",
    points = 5,
    description = "Score more than 2000 points!",
    trigger = scored(2000)
)

leaderboard(
    title = "High Score",
    description = "",
    start = (prev(stage) == StageTypes["Dodging"] || prev(stage) == StageTypes["Rolling"]) && stage == StageTypes["Game Over"],
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    stage == StageTypes["Title Screen"],
    "At the title screen"
)

rich_presence_conditional_display(
    stage == StageTypes["Game Over"],
    "Game Over • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    stage == StageTypes["Rolling"],
    "Rolling up objects • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    stage == StageTypes["Dodging"],
    "Dodging lightning • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    stage == StageTypes["Planet"],
    "Watching the creation of a new planet • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    stage == StageTypes["Next!"],
    "Preparing to dodge • Score: {0}",
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Preparing to roll..."
)
