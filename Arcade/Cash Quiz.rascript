// Cash Quiz
// #ID = 13729

QuizModes = {
    0x00: "Soaps",
    0x01: "Pot-Luck 1",
    0x02: "New Soccer-Cricket",
    0x03: "Sportstime",
    0x04: "Motoring",
    0x05: "Pop Music 2",
    0x06: "Screen Entertainment",
    0x07: "Coronation Street",
    0x08: "General Knowledge",
}

QuizModeToID = {}
for key in QuizModes {
    QuizModeToID[QuizModes[key]] = key
}

quiz_mode = byte(0x0c6e)

player_mode = byte(0x08ee)
title_screen = player_mode == 0
in_game = player_mode >= 1 && player_mode <= 2
single_player = player_mode == 1
multi_player = player_mode == 2

p1_lives = byte(0x08f2)
p1_died = prev(p1_lives) == 1 && p1_lives == 0
p2_lives = byte(0x08f5)
p2_died = prev(p2_lives) == 1 && p2_lives == 0

p1_bcd_score_10 = 0x08f0
p1_bcd_score_1000 = 0x08f1
p2_bcd_score_10 = 0x08f3
p2_bcd_score_1000 = 0x08f4
p1_score = (low4(p1_bcd_score_10) * 10) + (high4(p1_bcd_score_10) * 100) + (low4(p1_bcd_score_1000) * 1000) + (high4(p1_bcd_score_1000) * 10000)
p2_score = (low4(p2_bcd_score_10) * 10) + (high4(p2_bcd_score_10) * 100) + (low4(p2_bcd_score_1000) * 1000) + (high4(p2_bcd_score_1000) * 10000)

p1_wins = prev(byte(p1_bcd_score_1000)) == 0x19 && byte(p1_bcd_score_1000) == 0x20
p2_wins = prev(byte(p2_bcd_score_1000)) == 0x19 && byte(p2_bcd_score_1000) == 0x20

function sp_game_started() {
    return single_player && prev(p1_lives) == 0 && p1_lives == 3
}

function any_quiz_won() {
    return  ((single_player && p1_wins) || (multi_player && (p1_wins || p2_wins)))
}

function sp_quiz_won() {
    return in_game && single_player && p1_wins
}

function quiz_won(name) {
    return in_game && quiz_mode == QuizModeToID[name] && any_quiz_won()
}

function game_over() {
    return in_game && p1_lives == 0 && p2_lives == 0 && (p1_died || p2_died)
}

// General LB
leaderboard(
    title = "High Score",
    description = "",
    start = game_over(),
    cancel = always_false(),
    submit = always_true(), 
    value = max_of(p1_score, p2_score)
)

for qm in QuizModeToID {
    achievement(
        type = "progression",
        title = qm,
        points = 5,
        description = format("Score 20000 points or more to claim the cash prize in the {0} category!", qm),
        trigger = quiz_won(qm)
    )
    leaderboard(
        title = format("High Score: {0}", qm),
        description = "",
        start = quiz_mode == QuizModeToID[qm] && game_over(),
        cancel = always_false(),
        submit = always_true(), 
        value = max_of(p1_score, p2_score)
    )
}

achievement(
    type = "missable",
    title = "Quiz Master",
    points = 10,
    description = "Win a single-player quiz in any category without getting a question wrong!",
    trigger = once(sp_game_started()) && never (p1_lives < prev(p1_lives)) && trigger_when(sp_quiz_won())
)

rich_presence_conditional_display(
    single_player,
    "In a 1P game • {0} • {1} Lives Remaining • Score: {2}",
    rich_presence_lookup("Category", quiz_mode, QuizModes),
    rich_presence_value("Lives", p1_lives),
    rich_presence_value("Score", p1_score)
)

rich_presence_conditional_display(
    multi_player && p2_score > p1_score,
    "In a 2P game • {0} • P2 is leading • {1} Lives Remaining • Score: {2}",
    rich_presence_lookup("Category", quiz_mode, QuizModes),
    rich_presence_value("Lives", p2_lives),
    rich_presence_value("Score", p2_score)
)

rich_presence_conditional_display(
    multi_player,
    "In a 2P game • {0} • P1 is leading • {1} Lives Remaining • Score: {2}",
    rich_presence_lookup("Category", quiz_mode, QuizModes),
    rich_presence_value("Lives", p1_lives),
    rich_presence_value("Score", p1_score)
)

rich_presence_display(
    "Preparing to be quizzed..."
)
