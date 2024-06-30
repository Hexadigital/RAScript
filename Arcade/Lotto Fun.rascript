// Lotto Fun
// #ID = 29716

video_memory = dword(0x00572c)
betting = video_memory == 0x67677e7e
picking_numbers = video_memory == 0x22222222
gambling = video_memory == 0xee776677

game_mode = byte(0x00da1a)
choose_three = game_mode == 0x01
choose_four = game_mode == 0x02
choose_six = game_mode == 0x00

number_of_balls_left = byte(0x00da14)
in_game = byte(0x00da3d) == 0x01 || (byte(0x00da3d) == 0x00 && number_of_balls_left == 0)
in_demo = byte(0x00da3d) == 0x00 && number_of_balls_left != 0

num1 = byte(0x00da25)
num2 = byte(0x00da26)
num3 = byte(0x00da27)
num4 = byte(0x00da28)
num5 = byte(0x00da29)
num6 = byte(0x00da2a)

// Counts matches and then adds 1 when displaying results
match_count = byte(0x00da30)

function matched(n) {
    return prev(match_count) == n && match_count == n + 1
}

// Match at least two numbers in any game mode! 1p
achievement(
    title = "Turnabout Two",
    type = "progression",
    points = 1,
    description = "Match at least two numbers in any game mode!",
    trigger = gambling
              && in_game
              && matched(2)
)

// Match at least three numbers in any game mode! 2p
achievement(
    title = "Triple Trick",
    type = "progression",
    points = 2,
    description = "Match at least three numbers in any game mode!",
    trigger = gambling
              && in_game
              && matched(3)
)

// Match at least four numbers in Choose 6! 3p
achievement(
    title = "Quad Shot",
    points = 3,
    description = "Match at least four numbers in any game mode!",
    trigger = gambling
              && in_game
              && matched(4)
)

// Match at least five numbers in Choose 6! 4p
achievement(
    title = "One Away from Victory",
    points = 4,
    description = "Match at least five numbers in Choose 6!",
    trigger = gambling
              && in_game
              && choose_six
              && matched(5)
)

// Match all three numbers in Choose 3! 5p
achievement(
    title = "Tesla's Trichotomy",
    type = "win_condition",
    points = 5,
    description = "Match all three numbers in Choose 3!",
    trigger = gambling
              && !in_demo
              && choose_three
              && matched(3)
)

// Match all four numbers in Choose 4! 10p
achievement(
    title = "Perfect Fourth",
    type = "win_condition",
    points = 10,
    description = "Match all four numbers in Choose 4!",
    trigger = gambling
              && in_game
              && choose_four
              && matched(4)
)

// Match all six numbers in Choose 6! 25p
achievement(
    title = "Five Thousand Tickets!",
    type = "win_condition",
    points = 25,
    description = "Match all six numbers in Choose 6!",
    trigger = gambling
              && in_game
              && choose_six
              && matched(6)
)

rich_presence_conditional_display(
    betting,
    "Deciding how much to bet"
)

rich_presence_conditional_display(
    picking_numbers,
    "Carefully picking numbers"
)

rich_presence_conditional_display(
    gambling && in_demo,
    "Watching a demo"
)

rich_presence_conditional_display(
    gambling && in_game && choose_three,
    "Choose 3 • Today's lucky numbers are: ({0}) ({1}) ({2})",
    rich_presence_value("Ball", num1),
    rich_presence_value("Ball", num2),
    rich_presence_value("Ball", num3)
)

rich_presence_conditional_display(
    gambling && in_game && choose_four,
    "Choose 4 • Today's lucky numbers are: ({0}) ({1}) ({2}) ({3})",
    rich_presence_value("Ball", num1),
    rich_presence_value("Ball", num2),
    rich_presence_value("Ball", num3),
    rich_presence_value("Ball", num4)
)

rich_presence_conditional_display(
    gambling && in_game && choose_six,
    "Choose 6 • Today's lucky numbers are: ({0}) ({1}) ({2}) ({3}) ({4}) ({5})",
    rich_presence_value("Ball", num1 + 1),
    rich_presence_value("Ball", num2 + 1),
    rich_presence_value("Ball", num3 + 1),
    rich_presence_value("Ball", num4 + 1),
    rich_presence_value("Ball", num5 + 1),
    rich_presence_value("Ball", num6 + 1)
)

rich_presence_display(
    "Finding coins to play with"
)
