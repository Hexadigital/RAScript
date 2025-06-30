// Sherlock Holmes: Consulting Detective Vol. II
// #ID = 33131

current_case = byte(0x025ae8)

two_lions_score = word(0x025924)
munitions_score = word(0x0258a0)
paintings_score = word(0x0258e2)

game_state = byte(0x021604)
two_lions_case_solved = prev(game_state) == 4 && game_state == 7
munitions_case_solved = prev(game_state) == 5 && game_state == 7
paintings_case_solved = prev(game_state) == 6 && game_state == 7

achievement(
    type = "progression",
    title = "Roar of a Gem",
    points = 5,
    description = "Solve The Two Lions",
    trigger = current_case == 1
              && two_lions_case_solved
)

achievement(
    type = "progression",
    title = "Up in Smoke",
    points = 5,
    description = "Solve The Murdered Munitions Magnate",
    trigger = current_case == 2
              && munitions_case_solved
)

achievement(
    type = "progression",
    title = "Look Again",
    points = 5,
    description = "Solve The Pilfered Paintings",
    trigger = current_case == 3
              && paintings_case_solved
)

achievement(
    type = "missable",
    title = "Sherlock's Lions",
    points = 10,
    description = "Solve The Two Lions with Holmes' score or lower",
    trigger = current_case == 1
              && two_lions_case_solved
              && two_lions_score <= 28
)

achievement(
    type = "missable",
    title = "Sherlock's Munitions",
    points = 10,
    description = "Solve The Murdered Munitions Magnate with Holmes' score or lower",
    trigger = current_case == 2
              && munitions_case_solved
              && munitions_score <= 42
)

achievement(
    type = "missable",
    title = "Sherlock's Paintings",
    points = 10,
    description = "Solve The Pilfered Paintings with Holmes' score or lower",
    trigger = current_case == 3
              && paintings_case_solved
              && paintings_score <= 63
)

leaderboard(
    title = "Low Score: The Two Lions",
    description = "",
    lower_is_better=true,
    start = current_case == 1
         && two_lions_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = two_lions_score
)

leaderboard(
    title = "Low Score: The Murdered Munitions Magnate",
    description = "",
    lower_is_better=true,
    start = current_case == 2
         && munitions_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = munitions_score
)

leaderboard(
    title = "Low Score: The Pilfered Paintings",
    description = "",
    lower_is_better=true,
    start = current_case == 3
         && paintings_case_solved,
    cancel = always_false(),
    submit = always_true(), 
    value = paintings_score
)

rich_presence_conditional_display(
    current_case == 1,
    "Solving The Two Lions • Score: {0}",
    rich_presence_value("Number", two_lions_score)
)

rich_presence_conditional_display(
    current_case == 2,
    "Solving The Murdered Munitions Magnate • Score: {0}",
    rich_presence_value("Number", munitions_score)
)

rich_presence_conditional_display(
    current_case == 3,
    "Solving The Pilfered Paintings • Score: {0}",
    rich_presence_value("Number", paintings_score)
)

rich_presence_display(
    "Contemplating a mystery..."
)
