// Kemono Patrol
// #ID = 23777

GameStateLookup = {
    "Loading": 0x00,
    "Title Screen": 0x01,
    "In-Game": 0x02,
    "Game Over": 0x03
}

score = word(0x017c)
high_score = word(0x016d)
game_state = byte(0x0194)

game_start = prev(game_state) == GameStateLookup["Title Screen"] && game_state == GameStateLookup["In-Game"] && score == 0
game_over = prev(game_state) == GameStateLookup["In-Game"] && game_state == GameStateLookup["Game Over"]

player_x = byte(0x018c)
in_starting_position = player_x == 0x30

// Score 10 points
achievement(
    type = "progression",
    title = "The Wheels on the Bus",
    points = 1,
    description = "Score 10 points",
    trigger = game_state == GameStateLookup["In-Game"]
              && prev(score) == 9
              && score == 10
)

// Score 20 points
achievement(
    type = "progression",
    title = "Go Round and Round",
    points = 2,
    description = "Score 20 points",
    trigger = game_state == GameStateLookup["In-Game"]
              && prev(score) == 19
              && score == 20
)

// Score 30 points
achievement(
    type = "progression",
    title = "The Friends on the Bus",
    points = 2,
    description = "Score 30 points",
    trigger = game_state == GameStateLookup["In-Game"]
              && prev(score) == 29
              && score == 30
)

// Score 40 points
achievement(
    type = "progression",
    title = "Go Up and Down",
    points = 3,
    description = "Score 40 points",
    trigger = game_state == GameStateLookup["In-Game"]
              && prev(score) == 39
              && score == 40
)

// Score 50 points
achievement(
    type = "win_condition",
    title = "All Through the Town",
    points = 4,
    description = "Score 50 points",
    trigger = game_state == GameStateLookup["In-Game"]
              && prev(score) == 49
              && score == 50
)

// Score 10 points without moving left or right
achievement(
    type = "missable",
    title = "Serval's Steady Stance",
    points = 2,
    description = "Score 10 points without moving left or right",
    trigger = once(game_start)
              && trigger_when(prev(score) == 9
              && score == 10)
              && never(!in_starting_position)
              && never(game_state != GameStateLookup["In-Game"])
)

leaderboard(
    title = "High Score",
    description = "",
    start = game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    game_state == GameStateLookup["Loading"],
    "Now loading..."
)

rich_presence_conditional_display(
    game_state == GameStateLookup["Title Screen"],
    "At the title screen • High Score: {0}",
    rich_presence_value("Number", high_score)
)

rich_presence_conditional_display(
    game_state == GameStateLookup["Game Over"],
    "Game Over • High Score: {0}",
    rich_presence_value("Number", high_score)
)

rich_presence_display(
    "Patrolling • Score: {0} • High Score: {1}",
    rich_presence_value("Number", score),
    rich_presence_value("Number", high_score)
)
