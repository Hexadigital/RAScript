// Botanic
// #ID = 15030

in_game = byte(0x00cc) == 0
title = byte(0x00cc) == 1

lives = byte(0x0070)

game_over = lives == 0 && prev(in_game) && title

score = low4(0x0074)
      + low4(0x0075) * 10
      + low4(0x0076) * 100
      + low4(0x0077) * 1000
      + low4(0x0078) * 10000
      + low4(0x0079) * 100000

function scored(num) {
    return prev(score) >= num - 2000
    && prev(score) < num
    && score >= num
    && score <= num + 2000
}

// As P1, score 2,000 points, 1p, Leaf Nibbler
achievement(
    title = "Leaf Nibbler",
    type = "progression",
    points = 1,
    description = "As P1, score 2,000 points",
    trigger = in_game
              && scored(2000)
)

// As P1, score 5,000 points, 2p, Branch Biter
achievement(
    title = "Branch Biter",
    type = "progression",
    points = 2,
    description = "As P1, score 5,000 points",
    trigger = in_game
              && scored(5000)
)

// As P1, score 10,000 points, 3p, Vine Muncher
achievement(
    title = "Vine Muncher",
    type = "progression",
    points = 3,
    description = "As P1, score 10,000 points",
    trigger = in_game
              && scored(10000)
)

// As P1, score 10,000 points without losing a life [missable], 5p, Strategic Manuevers
achievement(
    title = "Strategic Manuevers",
    type = "missable",
    points = 5,
    description = "As P1, score 10,000 points without losing a life",
    trigger = in_game
              && once(prev(score) == 0 && score > 0 && score <= 1000)
              && trigger_when(scored(10000))
              && never(lives < prev(lives))
)

// As P1, score 20,000 points [win condition] 5p, Tree Chomper
achievement(
    title = "Tree Chomper",
    type = "win_condition",
    points = 5,
    description = "As P1, score 20,000 points",
    trigger = in_game
              && scored(20000)
)

// As P1, score 40,000 points, 10p, Garden Wrecker
achievement(
    title = "Garden Wrecker",
    points = 10,
    description = "As P1, score 40,000 points",
    trigger = in_game
              && scored(40000)
)

// As P1, score 80,000 points, 25p, Devourer of Leaves, End of Nature
achievement(
    title = "Devourer of Leaves, Ender of Nature",
    points = 25,
    description = "As P1, score 80,000 points",
    trigger = in_game
              && scored(80000)
)

// Eat all of the leaves on the first screen, 1p, Cleaning Things Up

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = score > 0
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    title,
    "At the title screen"
)

rich_presence_display(
    "{0} Lives • Score: {1}",
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)
