// Sherlock Holmes: Consulting Detective
// #ID = 33130

current_case = byte(0x0244fc)

mummy_score = word(0x02433c)
mystified_score = word(0x0242b8)
tin_score = word(0x0242fa)

game_state = byte(0x0200ae)
mummy_case_solved = prev(game_state) == 4 && game_state == 7
mystified_case_solved = prev(game_state) == 5 && game_state == 7
tin_case_solved = prev(game_state) == 6 && game_state == 7

// Solve The Mummy's Curse
achievement(
    type = "progression",
    title = "Unwrapped",
    points = 5,
    description = "Solve The Mummy's Curse",
    trigger = current_case == 1
              && mummy_case_solved
)

// Solve The Mystified Murderess
achievement(
    type = "progression",
    title = "Demystified",
    points = 5,
    description = "Solve The Mystified Murderess",
    trigger = current_case == 2
              && mystified_case_solved
)

// Solve The Tin Soldier
achievement(
    type = "progression",
    title = "Smelted",
    points = 5,
    description = "Solve The Tin Soldier",
    trigger = current_case == 3
              && tin_case_solved
)

// Solve The Mummy's Curse with the best possible score (26)
achievement(
    type = "missable",
    title = "Sherlock's Curse",
    points = 10,
    description = "Solve The Mummy's Curse with Holmes' score or lower",
    trigger = current_case == 1
              && mummy_case_solved
              && mummy_score <= 26
)

// Solve The Mystified Murderess with the best possible score (40)
achievement(
    type = "missable",
    title = "Sherlock's Murderess",
    points = 10,
    description = "Solve The Mystified Murderess with Holmes' score or lower",
    trigger = current_case == 2
              && mystified_case_solved
              && mystified_score <= 40
)

// Solve The Tin Soldier with the best possible score (26)
achievement(
    type = "missable",
    title = "Sherlock's Soldier",
    points = 10,
    description = "Solve The Tin Soldier with Holmes' score or lower",
    trigger = current_case == 3
              && tin_case_solved
              && tin_score <= 26
)

leaderboard(
    title = "Low Score: The Mummy's Curse",
    description = "",
    lower_is_better=true,
    start = current_case == 1
         && mummy_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = mummy_score
)

leaderboard(
    title = "Low Score: The Mystified Murderess",
    description = "",
    lower_is_better=true,
    start = current_case == 2
         && mystified_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = mystified_score
)

leaderboard(
    title = "Low Score: The Tin Soldier",
    description = "",
    lower_is_better=true,
    start = current_case == 3
         && tin_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = tin_score
)

rich_presence_conditional_display(
    current_case == 1,
    "Solving The Mummy's Curse • Score: {0}",
    rich_presence_value("Number", mummy_score)
)

rich_presence_conditional_display(
    current_case == 2,
    "Solving The Mystified Murderess • Score: {0}",
    rich_presence_value("Number", mystified_score)
)

rich_presence_conditional_display(
    current_case == 3,
    "Solving The Tin Soldier • Score: {0}",
    rich_presence_value("Number", tin_score)
)

rich_presence_display(
    "Contemplating a mystery..."
)
