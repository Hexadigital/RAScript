// Funky Bee
// #ID = 12706

default_settings = byte(0x0009) == 0x03
lives = byte(0x0021)
round = byte(0x001f)

function round_clear(num) {
    return prev(round) == num && round == num + 1
}

score = low4(0x0028)
      + low4(0x0027) * 10
      + low4(0x0026) * 100
      + low4(0x0025) * 1000
      + low4(0x0024) * 10000
      + low4(0x0023) * 100000

function scored(num) {
    return prev(score) >= num - 10000
    && prev(score) < num
    && score >= num
    && score <= num + 10000
}

title_screen = bit7(0x001a) == 1

game_over = lives == 0 && prev(bit6(0x001a)) == 0 && bit6(0x001a) == 1

// Clear round 1 on default settings
// 
achievement(
    type = "progression",
    title = "First Flight",
    points = 1,
    description = "Clear round 1 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(1)
)

// Clear round 2 on default settings
// Apiary Adventure
achievement(
    type = "progression",
    title = "Apiary Adventure",
    points = 1,
    description = "Clear round 2 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(2)
)

// Clear round 4 on default settings
// Discovery Drone
achievement(
    type = "progression",
    title = "Discovery Drone",
    points = 4,
    description = "Clear round 4 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(4)
)

// Clear round 6 on default settings
// Striped Scout
achievement(
    type = "progression",
    title = "Striped Scout",
    points = 5,
    description = "Clear round 6 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(6)
)

// Clear round 8 on default settings
// Winged Wayfarer
achievement(
    type = "progression",
    title = "Winged Wayfarer",
    points = 10,
    description = "Clear round 8 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(8)
)

// Clear round 10 on default settings
// Global Honeytrotter
achievement(
    type = "win_condition",
    title = "Global Honeytrotter",
    points = 10,
    description = "Clear round 10 on default settings",
    trigger = default_settings
              && !title_screen
              && round_clear(10)
)

// Score 10,000 points on default settings
// The First Taste of Pollen
achievement(
    title = "The First Taste of Pollen",
    points = 2,
    description = "Score 10,000 points on default settings",
    trigger = default_settings
              && !title_screen
              && scored(10000)
)

// Score 20,000 points on default settings
// Flower Foundation
achievement(
    title = "Flower Foundation",
    points = 3,
    description = "Score 20,000 points on default settings",
    trigger = default_settings
              && !title_screen
              && scored(20000)
)

// Score 40,000 points on default settings
// Buzzy Bundle
achievement(
    title = "Buzzy Bundle",
    points = 5,
    description = "Score 40,000 points on default settings",
    trigger = default_settings
              && !title_screen
              && scored(40000)
)

// Score 80,000 points on default settings
// Champion Pollinator
achievement(
    title = "Champion Pollinator",
    points = 10,
    description = "Score 80,000 points on default settings",
    trigger = default_settings
              && !title_screen
              && scored(80000)
)

// Score 120,000 points on default settings
// Hoarding Honey
achievement(
    title = "Hoarding Honey",
    points = 25,
    description = "Score 120,000 points on default settings",
    trigger = default_settings
              && !title_screen
              && scored(120000)
)

// Clear rounds 1 to 3 without losing a life on default settings
// To Bee Untouchable
achievement(
    type = "missable",
    title = "To Bee Untouchable",
    points = 10,
    description = "Clear rounds 1 to 3 without losing a life on default settings",
    trigger = default_settings
              && once(round_clear(0))
              && trigger_when(once(round_clear(1))
                  && once(round_clear(2))
                  && once(round_clear(3)))
              && disable_when(repeated(2, lives < prev(lives)), until=round > prev(round))
              && never(game_over)
              && never(title_screen)
)

// High Score
leaderboard(
    title = "High Score",
    description = "",
    start = default_settings
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// Highest Round
leaderboard(
    title = "Highest Round",
    description = "",
    start = default_settings
         && game_over,
    cancel = always_false(),
    submit = always_true(), 
    value = round
)


rich_presence_conditional_display(
    !default_settings,
    "Altered settings, achievements disabled!"
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen"
)

rich_presence_conditional_display(
    lives == 1,
    "Round {0} • {1} Life • Score: {2}",
    rich_presence_value("Number", round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)

// Round # • # Lives • Score: #
rich_presence_display(
    "Round {0} • {1} Lives • Score: {2}",
    rich_presence_value("Number", round),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", score)
)
