// ~Hack~ Casio Mario World [Subset - Bonus]
// #ID = 28635

animation = byte(0x71)
xpos = word(0x94)
ypos = word(0x96)
sublevel = byte(0x10b)
exit = byte(0xdd5)
stage = byte(0x13bf)
gamemode = byte(0x100)
mario_form = byte(0x19)

level_starts = {
    // Level ID, X, Y, Sublevel
    "The Reeling": [0x01, 0x10, 0x160, 0x01],
    "Sleep Dealer": [0x02, 0x270, 0x5e0, 0x02],
    "Child Soldier": [0x07, 0x70, 0x81, 0x07],
    "Power of Persuasion": [0x06, 0x10, 0x6b0, 0x06],
    "By Fire": [0x04, 0x20, 0x160, 0x04],
    "Love in the Time of Lexapro": [0x09, 0x40, 0x110, 0x09],
    "Freaky Eyes": [0x0b, 0x10, 0x130, 0x0b]
}

level_exits = {
    "The Reeling": 0x01,
    "Sleep Dealer": 0x01,
    "Child Soldier": 0x01,
    "Power of Persuasion": 0x01,
    "By Fire": 0x01,
    "Love in the Time of Lexapro": 0x01,
}


function died() => byte(0x71) == 0x09

function level_completed(name) {
    return stage == level_starts[name][0]
    && prev(exit) == 0x00
    && exit == level_exits[name]
}

function continual_stage(name) {
    return once(
        stage == level_starts[name][0]
        && xpos == level_starts[name][1]
        && ypos == level_starts[name][2]
        && sublevel == level_starts[name][3]
        && gamemode == 0x14
    )
    && trigger_when (
        level_completed(name)
    )
    && never(stage != level_starts[name][0])
    && never(died())
    && never(gamemode == 0x0e)
}

function continual_final() {
    return once(
        stage == level_starts["Freaky Eyes"][0]
        && xpos == level_starts["Freaky Eyes"][1]
        && ypos == level_starts["Freaky Eyes"][2]
        && sublevel == level_starts["Freaky Eyes"][3]
        && gamemode == 0x14
    )
    && trigger_when (
        stage == level_starts["Freaky Eyes"][0]
        && prev(ypos) <= 0xa0
        && xpos == 0x10
        && ypos == 0xe0
    )
    && never(stage != level_starts["Freaky Eyes"][0])
    && never(died())
    && never(gamemode == 0x0e)
}

function end_of_the_end() {
    return once(
        stage == 0x25
        && sublevel == 0x0e
        && prev(mario_form) == 0x00
        && mario_form == 0x01
        && gamemode == 0x14
    )
    && trigger_when (
        stage == 0x25
        && prev(ypos) >= 0xd90
        && prev(ypos) < 0xda0
        && ypos == 0xda0
    )
    && never(stage != 0x25)
    && never(died())
    && never(gamemode == 0x0e)
    && never(mario_form == 0x00)
}

achievement(
    title = "Continuous Reeling",
    description = "Starting at the beginning of the level (no checkpoint), complete The Reeling without dying!",
    points = 50,
    trigger = continual_stage("The Reeling")
)

achievement(
    title = "Everlasting Rest",
    description = "Starting at the beginning of the level (no checkpoint), complete Sleep Dealer without dying!",
    points = 50,
    trigger = continual_stage("Sleep Dealer")
)

achievement(
    title = "Endless War",
    description = "Starting at the beginning of the level (no checkpoint), complete Child Soldier without dying!",
    points = 100,
    trigger = continual_stage("Child Soldier")
)

achievement(
    title = "Perpetual Persuasion",
    description = "Starting at the beginning of the level (no checkpoint), complete Power of Persuasion without dying!",
    points = 100,
    trigger = continual_stage("Power of Persuasion")
)

achievement(
    title = "Eternal Flame",
    description = "Starting at the beginning of the level (no checkpoint), complete By Fire without dying!",
    points = 50,
    trigger = continual_stage("By Fire")
)

achievement(
    title = "Lets-a-go Lexapro",
    description = "Starting at the beginning of the level (no checkpoint), complete Love in the Time of Lexapro without dying!",
    points = 100,
    trigger = continual_stage("Love in the Time of Lexapro")
)

achievement(
    title = "Fennel the Undying",
    description = "Starting at the beginning of the level (no checkpoint), complete Freaky Eyes without dying!",
    points = 100,
    trigger = continual_final()
)

achievement(
    title = "The End of the End",
    description = "Defeat the secret boss without taking damage as Big Mario and watch the credits!",
    points = 100,
    trigger = end_of_the_end()
)
