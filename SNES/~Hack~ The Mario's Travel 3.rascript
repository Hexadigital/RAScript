// ~Hack~ The Mario's Travel 3
// #ID = 38108

game_mode = byte(0x000100)
level_id = byte(0x0013bf)
exit_id = byte(0x000dd5)
sprite_pointer = tbyte(0x0000ce)
exits_completed = byte(0x001f2e)
yoshi_coins = byte(0x001422)
xpos = word(0x94)
ypos = word(0x96)

SwitchAddresses = {
    "Green": 0x1F27,
    "Yellow": 0x1F28,
    "Blue": 0x1F29,
    "Red": 0x1F2A
}
SwitchIDLookup = {}
for key in SwitchAddresses {
    SwitchIDLookup[SwitchAddresses[key]] = key
}

function get_bit(a) {
    return bit0(a)
}

switch_count = sum_of(SwitchIDLookup, get_bit)

function exit(num) {
    return prev(exit_id) == 0
    && exit_id == num
}

function switch_hit(colour) {
    return prev(byte(SwitchAddresses[colour])) == 0
    && byte(SwitchAddresses[colour]) == 1
}

function level_started(name) {
    return level_id == LevelNameLookup[name]
    && prev(sprite_pointer) == 0x0
    && sprite_pointer == level_sprite_pointers[name]
    && xpos == level_starts[name][0]
    && ypos == level_starts[name][1]
}

function level_beat(name) {
    if cheevo_exit_types[name] == "Green Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Green")
    }
    if cheevo_exit_types[name] == "Yellow Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Yellow")
    }
    if cheevo_exit_types[name] == "Blue Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Blue")
    }
    if cheevo_exit_types[name] == "Red Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Red")
    }
    return level_id == LevelNameLookup[name]
    && exit(cheevo_exit_types[name])
}

function level_beat_secret(name) {
    return level_id == LevelNameLookup[substring(name, 0, -7)]
    && exit(cheevo_exit_types[name])
}

function speedrun_fail(level) {
    return level_id != LevelNameLookup[level]
    || sprite_pointer == 0
}

////////////////////////
// Hack Specific Data //
////////////////////////

LevelNameLookup = {
    // "Hey, Tutoshi! You're the best!": 0x28,
   "Stage 01": 0x01,
   "Stage 02": 0x02,
   "Stage 03": 0x03,
   "Stage 04": 0x04,
   "Stage 05": 0x05,
   "Stage 06": 0x06,
   "Stage 07": 0x07,
   "Stage 08": 0x08,
   "Stage ??-1": 0x09,
   "Stage 09": 0x0A,
   "Stage 10": 0x0B,
   "Stage 11": 0x0C,
   "Stage 12": 0x0D,
   "Stage 13": 0x0E,
   "Stage 14": 0x0F,
   "Stage ??-2": 0x10,
   "Stage 15": 0x11,
   "Stage 16": 0x12,
   "Stage 17": 0x13,
   "Stage 18": 0x14,
   "Stage 19": 0x15,
   "Stage 20": 0x16,
   "Stage 21": 0x17,
   "Stage 22": 0x18,
   "END": 0x19,
}

LevelIDLookup = {}
for key in LevelNameLookup {
    LevelIDLookup[LevelNameLookup[key]] = key
}

NumExits = 0

// Start of level/room
level_sprite_pointers = {
    // "No Way, Not Happening": 0x16eff8,
   "Stage 01": 0x18e9d6,
   "Stage 02": 0x17dc3b,
   "Stage 03": 0x16f0bb,
   "Stage 04": 0x18cedf,
   "Stage 05": 0x18eda7,
   "Stage 06": 0x16e43c,
   "Stage 07": 0x18f287,
   "Stage 08": 0x16d4f7,
   "Stage 09": 0x16cf90,
   "Stage 10": 0x16c116,
   "Stage 11": 0x16fdfb,
   "Stage 12": 0x17c646,
   "Stage 13": 0x17d7dd,
   "Stage 14": 0x17aa0b,
   "Stage 15": 0x17bf00,
   "Stage 16": 0x189b4a,
   "Stage 17": 0x17857f,
   "Stage 18": 0x1787a2,
   "Stage 19": 0x17a28e,
   "Stage 20": 0x17b3d8,
   "Stage 21": 0x18be1d,
   "Stage 22": 0x188790,
   "END": 0x18dc22,
}

level_starts = {
    // X, Y
   "Stage 01": [0x0010, 0x0160],
   "Stage 02": [0x0010, 0x0160],
   "Stage 03": [0x0010, 0x0160],
   "Stage 04": [0x0010, 0x0160],
   "Stage 05": [0x0010, 0x0160],
   "Stage 06": [0x0010, 0x0160],
   "Stage 07": [0x0010, 0x0160],
   "Stage 08": [0x0010, 0x0160],
   "Stage 09": [0x0010, 0x0160],
   "Stage 10": [0x0010, 0x0160],
   "Stage 11": [0x0010, 0x0160],
   "Stage 12": [0x0010, 0x0160],
   "Stage 13": [0x0010, 0x0160],
   "Stage 14": [0x0010, 0x0160],
   "Stage 15": [0x0010, 0x0160],
   "Stage 16": [0x0010, 0x0160],
   "Stage 17": [0x0010, 0x0160],
   "Stage 18": [0x0010, 0x0160],
   "Stage 19": [0x0010, 0x0160],
   "Stage 20": [0x0010, 0x0160],
   "Stage 21": [0x0010, 0x0160],
   "Stage 22": [0x0010, 0x0160],
   "END": [0x0010, 0x0160],
}


cheevo_names = {
    "Stage 01": "Melody of Pipes and Hills",
    "Stage 03": "Disco Turtles",
    "Stage 05": "Saws & Shrooms",
    "Stage 07 Secret": "Smashing Locks",
    "Stage 11": "Not-So-Secret Secret",
    "Stage 13 Secret": "With the Help of a Friend...",
    "Stage 16": "Elemental Passage",
    "Stage 20": "Like It's 1985",
    "Stage 22": "Now Do It Again and Again and Again and Again",
}

cheevo_types = {
    "Stage 01": "progression",
    "Stage 03": "progression",
    "Stage 05": "progression",
    "Stage 07 Secret": "",
    "Stage 11": "progression",
    "Stage 13 Secret": "",
    "Stage 16": "progression",
    "Stage 20": "progression",
    "Stage 22": "win_condition",
}

cheevo_descriptions = {
    "Stage 01": "Clear Stage 01",
    "Stage 03": "Clear Stage 03",
    "Stage 05": "Clear Stage 05",
    "Stage 07 Secret": "Clear the secret exit on Stage 07",
    "Stage 11": "Clear Stage 11",
    "Stage 13 Secret": "Clear the secret exit on Stage 13",
    "Stage 16": "Clear Stage 16",
    "Stage 20": "Clear Stage 20",
    "Stage 22": "Clear Stage 22 and beat the game",
}

cheevo_points = {
    "Stage 01": 1,
    "Stage 03": 2,
    "Stage 05": 2,
    "Stage 07 Secret": 1,
    "Stage 11": 3,
    "Stage 13 Secret": 1,
    "Stage 16": 5,
    "Stage 20": 5,
    "Stage 22": 10,
}

cheevo_exit_types = {
   "Stage 01": 1,
   "Stage 02": 1,
   "Stage 03": 1,
   "Stage 04": 1,
   "Stage 05": 1,
   "Stage 06": 1,
   "Stage 07": 1,
   "Stage 07 Secret": 2,
   "Stage 08": 1,
   "Stage 09": 1,
   "Stage 10": 1,
   "Stage 11": 1,
   "Stage 12": 1,
   "Stage 13": 1,
   "Stage 13 Secret": 2,
   "Stage 14": 1,
   "Stage 15": 1,
   "Stage 16": 1,
   "Stage 17": 1,
   "Stage 18": 1,
   "Stage 19": 1,
   "Stage 20": 1,
   "Stage 21": 1,
   "Stage 22": 1,
   "END": 1,
}

////////////////////////////////////////
// Base achievements and leaderboards //
////////////////////////////////////////

for c in cheevo_names {
    if (substring(c, -6, 6) == "Secret") {
        achievement(
            title = cheevo_names[c],
            type = cheevo_types[c],
            description = cheevo_descriptions[c],
            points = cheevo_points[c],
            trigger = level_beat_secret(c)
        )
    } else {
        achievement(
            title = cheevo_names[c],
            type = cheevo_types[c],
            description = cheevo_descriptions[c],
            points = cheevo_points[c],
            trigger = level_beat(c)
        )
    }
}

for c in cheevo_exit_types {
    if (substring(c, -6, 6) == "Secret") {
        leaderboard(
            title = format("{0} Speedrun", c),
            description = "Clear the secret exit as fast as you can!",
            start = level_started(substring(c, 0, -7)),
            cancel = speedrun_fail(substring(c, 0, -7)),
            submit = level_beat_secret(c), 
            value = measured(always_true()), 
            format = "FRAMES",
            lower_is_better = true
        )
    } else {
        leaderboard(
            title = format("{0} Speedrun", c),
            description = "Clear the regular exit as fast as you can!",
            start = level_started(c),
            cancel = speedrun_fail(c),
            submit = level_beat(c), 
            value = measured(always_true()), 
            format = "FRAMES",
            lower_is_better = true
        )
    }
}

/////////////////////////////////////////////////
// Hack-specific achievements and leaderboards //
/////////////////////////////////////////////////

// achievement(
//     title = cheevo_names["Don't you dare, Achiesu! Secret"],
//     type = cheevo_types["Don't you dare, Achiesu! Secret"],
//     description = cheevo_descriptions["Don't you dare, Achiesu! Secret"],
//     points = cheevo_points["Don't you dare, Achiesu! Secret"],
//     trigger = level_beat_secret("Don't you dare, Achiesu!")
// )


///////////////////
// Rich Presence //
///////////////////

SwitchPlural = {
    1: ""
}

rich_presence_conditional_display(
    game_mode <= 0x0a,
    "At the title screen"
)

rich_presence_conditional_display(
    game_mode <= 0x0e,
    "In the overworld • Exits: {0}/24",
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)

rich_presence_display(
    "{0} • Exits: {1}/24",
    rich_presence_lookup("LevelName", level_id, LevelIDLookup, fallback="Unknown"),
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)
