// Hexa
// #ID = 15220

score = word(0x070b)
high_score = word(0x0709)
pobys = byte(0x0746)
game_state = byte(0x0720)

title_screen = game_state == 0
in_game = game_state == 1
demo = game_state == 2

default_settings = once(score == 0 && pobys == 2) && never(pobys == 4) && never(title_screen)

game_over = prev(in_game) && title_screen

function scored(num) {
    return prev(score) < num && score >= num
}

function scored_at_once(num) {
    return score - prev(score) >= num
}

// Score 100 points with the number of starting pobys set to 2
achievement(
    title = "Breaking Blocks",
    type = "progression",
    points = 1,
    description = "Score 100 points with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored(100)
)

// Score 2,000 points with the number of starting pobys set to 2
achievement(
    title = "Binary Warrior",
    type = "progression",
    points = 2,
    description = "Score 1,000 points with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored(1000)
)

// Score 4,000 points without using any pobys with the number of starting pobys set to 2
achievement(
    title = "Quaternary Conquest",
    type = "missable",
    points = 3,
    description = "Score 4,000 points without using any pobys with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && pobys == 2
              && trigger_when(scored(4000))
)

// Score 8,000 points with the number of starting pobys set to 2
achievement(
    title = "Octaprogress",
    type = "progression",
    points = 4,
    description = "Score 8,000 points with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored(8000)
)

// Score 16,000 points with the number of starting pobys set to 2
achievement(
    title = "Hexavictory",
    type = "win_condition",
    points = 5,
    description = "Score 16,000 points with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored(16000)
)

// Score 32,000 points with the number of starting pobys set to 2
achievement(
    title = "Hexamyth",
    points = 10,
    description = "Score 32,000 points with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored(32000)
)

// Make a combo that scores at least 1,000 points at once without rolling over the score with the number of starting pobys set to 2
achievement(
    title = "Combo",
    points = 2,
    description = "Make a combo that scores at least 1,000 points at once without rolling over the score with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored_at_once(1000)
)


// Make a combo that scores at least 8,000 points at once without rolling over the score with the number of starting pobys set to 2
achievement(
    title = "Octacombo",
    points = 4,
    description = "Make a combo that scores at least 8,000 points at once without rolling over the score with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored_at_once(8000)
)

// Make a combo that scores at least 16,000 points at once without rolling over the score with the number of starting pobys set to 2
achievement(
    title = "Hexacombo",
    points = 5,
    description = "Make a combo that scores at least 16,000 points at once without rolling over the score with the number of starting pobys set to 2",
    trigger = default_settings
              && in_game
              && scored_at_once(16000)
)

leaderboard(
    title = "High Score",
    description = "",
    start = once(score == 0 && pobys == 2) && never(pobys == 4)
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = high_score
    // Submitting high score instead of regular score, since it keeps the max on rollover
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen"
)

rich_presence_conditional_display(
    demo,
    "Watching a demo"
)

rich_presence_display(
    "Pobys: {0} • Score: {1}",
    rich_presence_value("Number", pobys),
    rich_presence_value("Number", score)
)
