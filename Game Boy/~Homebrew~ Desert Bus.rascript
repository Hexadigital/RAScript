// ~Homebrew~ Desert Bus
// #ID = 13578

in_game = byte(0x00ff84) == 0x24

momentum = word_be(0x00ff86)
speed_percentage = momentum / 5.12
score = (high4(0x00ff8a) * 10) + low4(0x00ff8a)
crashed = byte(0x00ff8b) != 0

//////////////////
// Achievements //
//////////////////

// Drive at full speed for 10 minutes without dying (of boredom) [1p]
achievement(
    title = "The Beginning of a Journey",
    points = 1,
    description = "Drive at full speed for 10 minutes without dying (of boredom)",
    trigger = in_game
              && measured(repeated(10*60*60, momentum == 512), format="percent")
              && never(momentum != 512)
)

// Drive for 1 mile [1p]
achievement(
    type = "progression",
    title = "Where Are the Gas Stations?",
    points = 1,
    description = "Drive for 8 hours, earning your first point",
    trigger = in_game
              && prev(score) == 0
              && score == 1
)

// Drive for 2 miles [1p]
achievement(
    type = "progression",
    title = "Are We There Yet?",
    points = 1,
    description = "Drive for 16 hours, earning your second point",
    trigger = in_game
              && prev(score) == 1
              && score == 2
)

// Drive for 3 miles [1p]
achievement(
    type = "win_condition",
    title = "I Think the Doors Are Locked",
    points = 1,
    description = "Drive for 24 hours, earning your third point",
    trigger = in_game
              && prev(score) == 2
              && score == 3
)

// Drive for 4 miles [2p]
achievement(
    title = "Is Anyone Else Out There?",
    points = 2,
    description = "Drive for 32 hours, earning your fourth point",
    trigger = in_game
              && prev(score) == 3
              && score == 4
)

// Drive for 5 miles [3p]
achievement(
    title = "Forever on the Road",
    points = 3,
    description = "Drive for 40 hours, earning your fifth point",
    trigger = in_game
              && prev(score) == 4
              && score == 5
)

//////////////////
// Leaderboards //
//////////////////

leaderboard(
    title = "Longest Trip",
    description = "Drive as far as you can til you crash",
    start = in_game
         && once(momentum == 512)
         && prior(score) != 0
         && score == 0
         && crashed,
    cancel = always_false(),
    submit = always_true(), 
    value = prior(score)
)

///////////////////
// Rich Presence //
///////////////////

rich_presence_conditional_display(
    !in_game,
    "Preparing for the journey of a lifetime"
)

rich_presence_conditional_display(
    crashed && momentum == 0,
    "Crashed! • Speed: Stopped • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    momentum == 0,
    "Heading east • Speed: Stopped • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    momentum <= 128,
    "Heading east • Speed: Slow • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    momentum <= 256,
    "Heading east • Speed: Medium • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    momentum <= 384,
    "Heading east • Speed: Fast • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_conditional_display(
    momentum == 512,
    "Heading east • Speed: Max • Points: {0}",
    rich_presence_value("Number", score)
)

rich_presence_display(
    "Heading east • Speed: Very Fast • Points: {0}",
    rich_presence_value("Number", score)
)
