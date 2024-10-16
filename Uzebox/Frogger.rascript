// Frogger
// #ID = 24740

lives = byte(0x0c32)
game_over = prev(lives) == 1 && lives == 0

level = byte(0x0b9b)
title_screen = level == 0 && lives == 0
in_game = level > 0

game_mode = byte(0x0c55)
single_player = game_mode == 1
multiplayer = game_mode == 2

score = tbyte(0x0c56)

home_one = byte(0x0c24)
home_two = byte(0x0c25)
home_three = byte(0x0c26)
home_four = byte(0x0c27)
home_five = byte(0x0c28)

function all_homes_filled() {
    return home_one == 0x10
    && home_two == 0x10
    && home_three == 0x10
    && home_four == 0x10
    && home_five == 0x10
}

function level_cleared(num) {
    return prev(level) == num && level == num + 1
}

function scored(num) {
    return prev(score) >= num - 1000
    && prev(score) < num
    && score >= num
    && score <= num + 1000
}

// Clear level 1
achievement(
    type = "progression",
    title = "A Rough Start",
    points = 2,
    description = "Clear level 1 in single player",
    trigger = single_player
              && level_cleared(1)
)

// Clear level 3
achievement(
    type = "progression",
    title = "Getting Faster",
    points = 5,
    description = "Clear level 3 in single player",
    trigger = single_player
              && level_cleared(3)
)

// Clear level 6 (win condition)
achievement(
    type = "win_condition",
    title = "Now the Gloves Are Off",
    points = 10,
    description = "Clear level 6 in single player",
    trigger = single_player
              && level_cleared(6)
)

// Clear level 9
achievement(
    title = "What Happened to Speed Limits?",
    points = 25,
    description = "Clear level 9 in single player",
    trigger = single_player
              && level_cleared(9)
)

// Score 1,000 points
achievement(
    title = "Making It Home",
    points = 2,
    description = "Score 1,000 points in single player",
    trigger = single_player && in_game
              && scored(1000)
)

// Score 2,500 points
achievement(
    title = "Survival is Key",
    points = 5,
    description = "Score 2,500 points in single player",
    trigger = single_player && in_game
              && scored(2500)
)

// Score 5,000 points
achievement(
    title = "A Good Job Done",
    points = 10,
    description = "Score 5,000 points in single player",
    trigger = single_player && in_game
              && scored(5000)
)

// Score 8,000 points
achievement(
    title = "Rushing for Points",
    points = 25,
    description = "Score 8,000 points in single player",
    trigger = single_player && in_game
              && scored(8000)
)

// Eat a fly
achievement(
    title = "Gobbling Some Grub",
    points = 1,
    description = "Eat a fly in single player",
    trigger = single_player && in_game
              && (
                  (prev(home_one) == 0x04 && home_one == 0x10)
                  || (prev(home_two) == 0x04 && home_two == 0x10)
                  || (prev(home_three) == 0x04 && home_three == 0x10)
                  || (prev(home_four) == 0x04 && home_four == 0x10)
                  || (prev(home_five) == 0x04 && home_five == 0x10)
              )
)

// Come home to your wife
achievement(
    title = "Won't Leave Her a Widow",
    points = 1,
    description = "Make it home to your wife in single player",
    trigger = single_player && in_game
              && (
                  (prev(home_one) == 0x02 && home_one == 0x10)
                  || (prev(home_two) == 0x02 && home_two == 0x10)
                  || (prev(home_three) == 0x02 && home_three == 0x10)
                  || (prev(home_four) == 0x02 && home_four == 0x10)
                  || (prev(home_five) == 0x02 && home_five == 0x10)
              )
)

// Clear the first level without losing a life, Amphimmortal
achievement(
    type = "missable",
    title = "Amphimmortal",
    points = 10,
    description = "Clear the first level without losing a life in single player",
    trigger = single_player
    && once(prev(level) == 0 && level == 1)
    && trigger_when(prev(level) == 1 && level == 2)
    && never(lives < prev(lives))
    && never(level < prev(level))
)

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = single_player
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// Highest Round
leaderboard(
    title = "Highest Level",
    description = "",
    start = single_player
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = level
)

rich_presence_conditional_display(
    level == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    multiplayer,
    "Playing multiplayer"
)

// Single Player • Level # • # Lives • Score: #
rich_presence_display(
    "Single Player • Level {0} • {1} Lives • Score: {2}",
    rich_presence_value("Number", level),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)
