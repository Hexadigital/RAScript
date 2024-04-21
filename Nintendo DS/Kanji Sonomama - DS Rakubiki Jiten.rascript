// Kanji Sonomama - DS Rakubiki Jiten
// #ID = 15418

current_word = 0x2e5c08
current_ncgr = 0x2fdca0
debug_text = word(0x0e1844)

ball_pointer = tbyte(0x135498)
// 0x00 = Game A, 0x01 = Game B, 0x02 = Time
ball_mode = byte(ball_pointer)
ball_score = dword(ball_pointer + 0x84)
// 0 = in progress, 1 = game over
ball_state = byte(ball_pointer + 0xa0)
ball_gameover = prev(ball_state) == 0 && ball_state == 1

flagman_pointer = tbyte(0x1fe774)
// 0x00 = Game A, 0x01 = Game B, 0x02 = Time
flagman_mode = byte(flagman_pointer)
flagman_lives = low4(flagman_pointer + 0x0b)
flagman_score = (low4(flagman_pointer + 0x0c) * 10) + low4(flagman_pointer + 0x0d)
flagman_gameover = prev(flagman_lives) == 1 && flagman_lives == 0

judge_pointer = tbyte(0x1fe63c)
// 0x00 = Game A, 0x01 = Game B, 0x02 = Time
judge_mode = byte(judge_pointer)
judge_score = byte(judge_pointer + 0x0a)

manhole_pointer = tbyte(0x1fe6d4)
// 0x00 = Game A, 0x01 = Game B, 0x02 = Time
manhole_mode = byte(manhole_pointer)
manhole_misses = byte(manhole_pointer + 0x14)
manhole_thousands = low4(manhole_pointer + 0x16)
manhole_hundreds = low4(manhole_pointer + 0x17)
manhole_tens = low4(manhole_pointer + 0x18)
manhole_ones = low4(manhole_pointer + 0x19)
manhole_gameover = prev(manhole_misses) == 2 && manhole_misses == 3

manhole_score = max_of(measured(
        manhole_ones,
        when=manhole_thousands == 0x0a && manhole_hundreds == 0x0a && manhole_tens == 0x0a
    ), measured(
        (manhole_tens * 10) + manhole_ones,
        when=manhole_thousands == 0x0a && manhole_hundreds == 0x0a && manhole_tens != 0x0a
    ), measured(
        (manhole_hundreds * 100) + (manhole_tens * 10) + manhole_ones,
        when=manhole_thousands == 0x0a && manhole_hundreds != 0x0a && manhole_tens != 0x0a
    ), measured(
        (manhole_thousands * 1000) + (manhole_hundreds * 100) + (manhole_tens * 10) + manhole_ones,
        when=manhole_thousands != 0x0a && manhole_hundreds != 0x0a && manhole_tens != 0x0a
    ))

function word_selected(target) {
    ascii_string_equals(current_word, target, length(target) + 1)
}

// Ball, Flagman, Judge, Manhole
function game_loaded(target) {
    if (target == "Ball") {
        return debug_text == 0x3331
    }
    if (target == "Flagman") {
        return debug_text == 0x3531
    }
    if (target == "Judge") {
        return debug_text == 0x3631
    }
    if (target == "Manhole") {
        return debug_text == 0x3731
    }
}

function ball_scored(target) {
    return prev(ball_score) == target - 1 && ball_score == target
}

function flagman_scored(target) {
    return prev(flagman_score) == target - 1 && flagman_score == target
}

////////////////
// DICTIONARY //
////////////////

achievement(
    title = "The Highly Anticipated",
    points = 0,
    description = "Dolphin is an emulator for the N_______ G___C___.",
    trigger = word_selected("NINTENDO GAMECUBE")
)

achievement(
    title = "Jumpman",
    points = 0,
    description = "Nintendo's famous arcade game, D_____ ____, that led to the birth of Mario as a franchise.",
    trigger = word_selected("Donkey Kong")
)

//////////
// BALL //
//////////

achievement(
    title = "Gaining Dexterity",
    points = 1,
    description = "Score 50 points on Game A in Ball!",
    trigger = game_loaded("Ball") && ball_mode == 0x00 && ball_scored(50)
)

achievement(
    title = "Trained with Two",
    points = 3,
    description = "Score 100 points on Game A in Ball!",
    trigger = game_loaded("Ball") && ball_mode == 0x00 && ball_scored(100)
)

achievement(
    title = "Triple Threat",
    points = 2,
    description = "Score 500 points on Game B in Ball!",
    trigger = game_loaded("Ball") && ball_mode == 0x01 && ball_scored(50)
)

achievement(
    title = "Juggle Champ",
    points = 5,
    description = "Score 1000 points on Game B in Ball!",
    trigger = game_loaded("Ball") && ball_mode == 0x01 && ball_scored(100)
)

/////////////
// FLAGMAN //
/////////////

achievement(
    title = "Count to Ten",
    points = 3,
    description = "Score 10 points on Game A in Flagman!",
    trigger = game_loaded("Flagman") && flagman_mode == 0x00 && flagman_lives > 0 && flagman_scored(10)
)

achievement(
    title = "Strong Memory",
    points = 5,
    description = "Score 20 points on Game A in Flagman!",
    trigger = game_loaded("Flagman") && flagman_mode == 0x00 && flagman_lives > 0 && flagman_scored(20)
)

achievement(
    title = "Fast Taps",
    points = 2,
    description = "Score 25 points on Game B in Flagman!",
    trigger = game_loaded("Flagman") && flagman_mode == 0x01 && flagman_lives > 0 && flagman_scored(25)
)

achievement(
    title = "Lightning Reflexes",
    points = 4,
    description = "Score 50 points on Game B in Flagman!",
    trigger = game_loaded("Flagman") && flagman_mode == 0x01 && flagman_lives > 0 && flagman_scored(50)
)

///////////
// JUDGE //
///////////

achievement(
    title = "Bonk!",
    points = 5,
    description = "Score 99 points on Game A in Judge!",
    trigger = game_loaded("Judge") && judge_mode == 0x00 && prev(judge_score) > 90 && prev(judge_score) < 99 && judge_score == 99
)

/////////////
// MANHOLE //
/////////////

achievement(
    title = "Sturdy Lifter",
    points = 2,
    description = "Score 100 points on Game A in Manhole!",
    trigger = game_loaded("Manhole") && manhole_mode == 0x00 && prev(manhole_hundreds) == 0x0a && manhole_hundreds == 1
)

achievement(
    title = "Bridge Builder",
    points = 4,
    description = "Score 200 points on Game A in Manhole!",
    trigger = game_loaded("Manhole") && manhole_mode == 0x00 && prev(manhole_hundreds) == 1 && manhole_hundreds == 2
)

achievement(
    title = "Traffic Controller",
    points = 3,
    description = "Score 100 points on Game B in Manhole!",
    trigger = game_loaded("Manhole") && manhole_mode == 0x01 && prev(manhole_hundreds) == 0x0a && manhole_hundreds == 1
)

achievement(
    title = "Manhole Master",
    points = 5,
    description = "Score 200 points on Game B in Manhole!",
    trigger = game_loaded("Manhole") && manhole_mode == 0x01 && prev(manhole_hundreds) == 1 && manhole_hundreds == 2
)

//////////////////
// LEADERBOARDS //
//////////////////

leaderboard(
    title = "Ball: Game 1 High Score",
    description = "",
    start = game_loaded("Ball")
            && ball_mode == 0x00
            && ball_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = ball_score
)

leaderboard(
    title = "Ball: Game 2 High Score",
    description = "",
    start = game_loaded("Ball")
            && ball_mode == 0x01
            && ball_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = ball_score * 100
)

leaderboard(
    title = "Flagman: Game 1 High Score",
    description = "",
    start = game_loaded("Flagman")
            && flagman_mode == 0x00
            && flagman_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = flagman_score
)

leaderboard(
    title = "Flagman: Game 2 High Score",
    description = "",
    start = game_loaded("Flagman")
            && flagman_mode == 0x01
            && flagman_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = flagman_score
)

leaderboard(
    title = "Manhole: Game 1 High Score",
    description = "",
    start = game_loaded("Manhole")
            && manhole_mode == 0x00
            && manhole_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = manhole_score
)

leaderboard(
    title = "Manhole: Game 2 High Score",
    description = "",
    start = game_loaded("Manhole")
            && manhole_mode == 0x01
            && manhole_gameover,
    cancel = always_false(),
    submit = always_true(), 
    value = manhole_score
)

rich_presence_conditional_display(
    game_loaded("Ball"),
    "Taking a break from studying to play some Ball"
)

rich_presence_conditional_display(
    game_loaded("Flagman"),
    "Taking a break from studying to play some Flagman"
)

rich_presence_conditional_display(
    game_loaded("Judge"),
    "Taking a break from studying to play some Judge"
)

rich_presence_conditional_display(
    game_loaded("Manhole"),
    "Taking a break from studying to play some Manhole"
)

rich_presence_display(
    "Studying hard"
)
