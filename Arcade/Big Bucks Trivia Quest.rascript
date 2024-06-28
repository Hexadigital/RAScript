// Big Bucks: Trivia Quest
// #ID = 15748

Categories = {
    0x00: "Undecided",
    0x01: "Sports",
    0x02: "Hodgepodge",
    0x03: "Entertainment",
    0x04: "World Records",
    0x05: "Adult Affairs",
    0x06: "The Inquisition",
}

CategoryToID = {}
for key in Categories {
    CategoryToID[Categories[key]] = key
}

category = byte(0x04d2)
category_sanity_check = category >= 1 && category <= 6

score = low4(0x04d6) + (high4(0x04d6) * 10)
     + (low4(0x04d7) * 100) + (high4(0x04d7) * 1000)
     + (low4(0x04d8) * 10000) + (high4(0x04d8) * 100000)
     + (low4(0x04d9) * 1000000) + (high4(0x04d9) * 10000000)
     + (low4(0x04da) * 100000000) + (high4(0x04da) * 1000000000)

player_count = byte(0x04c9)
in_menu = player_count == 0
single_player = player_count == 1
multi_player = player_count >= 2 && player_count <= 4

function scored(num) {
    return prev(score) >= num/10 && score >= num
}

// During a single-player game, score more than $20,000 in any category!
achievement(
    title = "Knowledgable",
    points = 1,
    type = "progression",
    description = "During a single-player game, score at least $20,000 in any category!",
    trigger = single_player && category_sanity_check && prev(score) >= 1000 && prev(score) < 20000 && score >= 20000
)

// During a single-player game, score more than $100,000 in any category!
achievement(
    title = "Enthusiast",
    points = 3,
    type = "progression",
    description = "During a single-player game, score at least $100,000 in any category!",
    trigger = single_player && category_sanity_check && prev(score) >= 8000 && prev(score) < 100000 && score >= 100000
)

// During a single-player game, beat the high score of $210,000 in the Sports category!
achievement(
    title = "Sports Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $210,000 in the Sports category!",
    trigger = single_player && category == CategoryToID["Sports"] && prev(score) >= 20000 && prev(score) <= 210000 && score > 210000
)

// During a single-player game, beat the high score of $230,505 in the Hodgepodge category!
achievement(
    title = "Hodgepodge Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $230,505 in the Hodgepodge category!",
    trigger = single_player && category == CategoryToID["Hodgepodge"] && prev(score) >= 20000 && prev(score) <= 230505 && score > 230505
)

// During a single-player game, beat the high score of $236,605 in the Entertainment category!
achievement(
    title = "Entertainment Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $236,605 in the Entertainment category!",
    trigger = single_player && category == CategoryToID["Entertainment"] && prev(score) >= 20000 && prev(score) <= 236605 && score > 236605
)

// During a single-player game, beat the high score of $195,600 in the World Records category!
achievement(
    title = "World Records Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $195,600 in the World Records category!",
    trigger = single_player && category == CategoryToID["World Records"] && prev(score) >= 15000 && prev(score) <= 195600 && score > 195600
)

// During a single-player game, beat the high score of $220,400 in the Adult Affairs category!
achievement(
    title = "Adult Affairs Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $220,400 in the Adult Affairs category!",
    trigger = single_player && category == CategoryToID["Adult Affairs"] && prev(score) >= 20000 && prev(score) <= 220400 && score > 220400
)

// During a single-player game, beat the high score of $230,005 in the Inquisition category!
achievement(
    title = "Inquisition Expert",
    points = 5,
    type = "progression",
    description = "During a single-player game, beat the high score of $230,005 in the Inquisition category!",
    trigger = single_player && category == CategoryToID["The Inquisition"] && prev(score) >= 20000 && prev(score) <= 230005 && score > 230005
)

// During a single-player game, break the bank in the Sports category!
achievement(
    title = "Sports Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the Sports category!",
    trigger = single_player && category == CategoryToID["Sports"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

// During a single-player game, break the bank in the Hodgepodge category!
achievement(
    title = "Hodgepodge Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the Hodgepodge category!",
    trigger = single_player && category == CategoryToID["Hodgepodge"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

// During a single-player game, break the bank in the Entertainment category!
achievement(
    title = "Entertainment Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the Entertainment category!",
    trigger = single_player && category == CategoryToID["Entertainment"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

// During a single-player game, break the bank in the World Records category!
achievement(
    title = "World Record Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the World Records category!",
    trigger = single_player && category == CategoryToID["World Records"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

// During a single-player game, break the bank in the Adult Affairs category!
achievement(
    title = "Adult Affair Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the Adult Affairs category!",
    trigger = single_player && category == CategoryToID["Adult Affairs"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

// During a single-player game, break the bnak in the Inquisition category!
achievement(
    title = "Inquisition Maniac",
    points = 10,
    description = "During a single-player game, break the bank in the Inquisition category!",
    trigger = single_player && category == CategoryToID["The Inquisition"] && prev(score) >= 10000000 && prev(score) <= 1000000000 && score > 1000000000
)

leaderboard(
    title = "Bank Buster: Sports",
    description = "Break the bank in the Sports category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["Sports"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Bank Buster: Hodgepodge",
    description = "Break the bank in the Hodgepodge category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["Hodgepodge"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Bank Buster: Entertainment",
    description = "Break the bank in the Entertainment category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["Entertainment"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Bank Buster: World Records",
    description = "Break the bank in the World Records category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["World Records"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Bank Buster: Adult Affairs",
    description = "Break the bank in the Adult Affairs category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["Adult Affairs"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Bank Buster: The Inquisition",
    description = "Break the bank in the Inquisition category with as much money as possible!",
    start = prev(single_player)
         && in_menu
         && category == CategoryToID["The Inquisition"]
         && score > 1000000000,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)


rich_presence_conditional_display(
    in_menu,
    "In the menu"
)

rich_presence_conditional_display(
    multi_player,
    "Playing multi-player"
)

rich_presence_conditional_display(
    single_player,
    "Single-player • {0} • Score: {1}",
    rich_presence_lookup("Category", category, Categories, fallback="Unknown"),
    rich_presence_value("Score", score)
)

rich_presence_display(
    "Loading game assets..."
)
