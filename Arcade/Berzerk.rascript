// Berzerk
// #ID = 15039

score = low4(0x0340)
+ high4(0x0340) * 10
+ low4(0x033f) * 100
+ high4(0x033f) * 1000
+ low4(0x033e) * 10000
+ high4(0x033e) * 100000

lives = byte(0x0349)
game_over = prev(lives) == 1 && lives == 0

room_x = byte(0x0345)
room_y = byte(0x0346)

demo_check = byte(0x036e)
loading = room_x == 0 && room_y == 0 && lives == 0
at_title = lives == 0 && demo_check == 0xff
in_demo = lives > 0 && demo_check == 0xff

not_multiplayer = byte(0x0376) != 2
in_game = demo_check == 0 && not_multiplayer

robots_remaining = byte(0x0371)
room_cleared = prev(robots_remaining) == 1 && robots_remaining == 0

function scored(num) {
    return prev(score) >= num - 1000
    && prev(score) < num
    && score >= num
    && score <= num + 1000
}

// Score 260 points (red), 1p
achievement(
    title = "Robo Red",
    type = "progression",
    points = 1,
    description = "Score 260 points",
    trigger = in_game
              && prev(score) < 260
              && score >= 260
              && score <= 1260
)

// Score 1,500 points (light blue), 2p
achievement(
    title = "Bandwidth Blues",
    type = "progression",
    points = 2,
    description = "Score 1,500 points",
    trigger = in_game
              && scored(1500)
)

// Score 3,000 points (green), 3p
achievement(
    title = "Ecobots",
    type = "progression",
    points = 3,
    description = "Score 3,000 points",
    trigger = in_game
              && scored(3000)
)

// Score 4,500 points (purple), 4p
achievement(
    title = "Programming in Pink",
    type = "progression",
    points = 4,
    description = "Score 4,500 points",
    trigger = in_game
              && scored(4500)
)

// Score 6,000 points (yellow), 5p
achievement(
    title = "Sunny Shareware",
    type = "progression",
    points = 5,
    description = "Score 6,000 points",
    trigger = in_game
              && scored(6000)
)

// Score 9,000 points (white), 10p
achievement(
    title = "Whitelisted",
    type = "win_condition",
    points = 10,
    description = "Score 9,000 points",
    trigger = in_game
              && scored(9000)
)

// Score 15,000 points (yellow with white crown?), 10p
achievement(
    title = "Golden Gigabyte",
    points = 10,
    description = "Score 15,000 points",
    trigger = in_game
              && scored(15000)
)

// Score 19,000 points (light blue with yellow crown?), 25p
achievement(
    title = "Cyan Champion",
    points = 25,
    description = "Score 19,000 points",
    trigger = in_game
              && scored(19000)
)

// Clear a room of enemies, 1p
achievement(
    title = "Formatted",
    points = 1,
    description = "Clear a room of enemies",
    trigger = in_game
              && room_cleared
)

// Clear 5 rooms of enemies in one playthrough, 3p
achievement(
    title = "Ex-Terminator",
    points = 3,
    description = "Clear 5 rooms of enemies in one playthrough",
    trigger = measured(repeated(5, in_game
              && room_cleared))
              && never(at_title)
              && never(in_demo)
              && never(game_over)
)

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = in_game
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    at_title || in_demo,
    "COIN DETECTED IN POCKET"
)

rich_presence_conditional_display(
    in_game && byte(0x0376) == 2,
    "SHOOT THE HUMANOIDS • ACHIEVEMENTS DISABLED"
)

rich_presence_conditional_display(
    in_game && room_x > 0,
    "SHOOT THE HUMANOID • {0} POINTS",
    rich_presence_value("Number", score)
)

rich_presence_display(
    "CHARGING CIRCUITS"
)
