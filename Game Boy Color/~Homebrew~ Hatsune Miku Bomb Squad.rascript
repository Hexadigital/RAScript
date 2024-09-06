// ~Homebrew~ Hatsune Miku Bomb Squad
// #ID = 30725

puzzles_unlocked = byte(0x00cba9)
current_bomb = byte(0x00cba7)

scene = dword(0x009824)
birdup = scene == 0x1b1a1918
title = scene == 0x00000000
select = scene == 0x04050403
converse = scene == 0x07060504
defusing = scene == 0x02010000
manual = scene == 0x03040605
ending = scene == 0x13121110


function bombs_defused(num) {
    return prev(puzzles_unlocked) == num && puzzles_unlocked == num + 1
}

achievement(
    type = "progression",
    title = "Green Bomb Fantasy",
    points = 1,
    description = "Defuse the first bomb",
    trigger = defusing && bombs_defused(1)
)

achievement(
    type = "progression",
    title = "Ultimate Explosive",
    points = 2,
    description = "Defuse 5 bombs",
    trigger = defusing && bombs_defused(5)
)

achievement(
    type = "progression",
    title = "Senbombzakura",
    points = 4,
    description = "Defuse 10 bombs",
    trigger = defusing && bombs_defused(10)
)

achievement(
    type = "progression",
    title = "Smoke City Tokyo",
    points = 5,
    description = "Defuse 15 bombs",
    trigger = defusing && bombs_defused(15)
)

achievement(
    type = "progression",
    title = "Gunpowder Mesmerizer",
    points = 5,
    description = "Defuse 20 bombs",
    trigger = defusing && bombs_defused(20)
)

achievement(
    type = "win_condition",
    title = "The End of Hatsune Miku",
    points = 10,
    description = "Defuse all 25 bombs and beat the game",
    trigger = defusing && bombs_defused(25)
)

rich_presence_conditional_display(
    puzzles_unlocked == 0,
    "Preparing to help Miku..."
)

rich_presence_conditional_display(
    defusing,
    "Defusing bomb #{0} • {1}/25 Bombs Defused",
    rich_presence_value("Number", current_bomb),
    rich_presence_value("Number", puzzles_unlocked - 1)
)

rich_presence_conditional_display(
    manual,
    "Reading the manual for bomb #{0} • {1}/25 Bombs Defused",
    rich_presence_value("Number", current_bomb),
    rich_presence_value("Number", puzzles_unlocked - 1)
)

rich_presence_conditional_display(
    converse,
    "Talking with Miku"
)

rich_presence_conditional_display(
    ending,
    "Watching a concert"
)

rich_presence_conditional_display(
    title,
    "Ready to work!"
)

rich_presence_display(
    "Preparing to help Miku..."
)
