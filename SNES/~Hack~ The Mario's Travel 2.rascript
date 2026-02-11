// ~Hack~ The Mario's Travel 2
// #ID = 37920

//////////////////
// General Data //
//////////////////

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
    return level_id == LevelNameLookup[name]
    && exit(cheevo_exit_types[format("{0} Secret", name)])
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
   "Stage ??": 0x05,
   "Stage 05": 0x06,
   "Stage 06": 0x07,
   "Stage 07": 0x08,
   "Stage 08": 0x09,
   "Stage 09": 0x0A,
   "Stage 10": 0x0B,
   "Stage 11": 0x0C,
   "Stage 12": 0x0D,
   "Stage 13": 0x0E,
   "Stage 14": 0x0F,
   "Stage 15": 0x10,
   "Stage 16": 0x11,
   "Stage 17": 0x12,
   "Stage 18": 0x13,
   "Stage 19": 0x14,
   "Stage 20": 0x15,
   "Stage 21": 0x16,
   "Stage 22": 0x17,
   "Stage 23": 0x18,
   "Stage 24": 0x19,
   "Ending": 0x1A,
}

LevelIDLookup = {}
for key in LevelNameLookup {
    LevelIDLookup[LevelNameLookup[key]] = key
}

NumExits = 0

// Start of level/room
level_sprite_pointers = {
    // "No Way, Not Happening": 0x16eff8,
   "Stage 01": 0x10de22,
   "Stage 02": 0x10e028,
   "Stage 03": 0x10e1cc,
   "Stage 04": 0x10e87a,
   "Stage 05": 0x16b377,
   "Stage 06": 0x10f82d,
   "Stage 07": 0x10fa54,
   "Stage 08": 0x10ebd8,
   "Stage 09": 0x10a4eb,
   "Stage 10": 0x16de33,
   "Stage 11": 0x10a7c5,
   "Stage 12": 0x109502,
   "Stage 13": 0x10fed1,
   "Stage 14": 0x10c387,
   "Stage 14 - Bonus Room": 0x07c407,
   "Stage 15": 0x10e650,
   "Stage 16": 0x16af81,
   "Stage 17": 0x16a700,
   "Stage 18": 0x16f2f2,
   "Stage 19": 0x16ebb4,
   "Stage 20": 0x16e2df,
   "Stage 21": 0x16e5b2,
   "Stage 22": 0x16b080,
   "Stage 23": 0x16f694,
   "Stage 24": 0x16b216,
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
   "Stage 23": [0x0010, 0x0160],
   "Stage 24": [0x0010, 0x0160],
}


cheevo_names = {
    // "No Way, Not Happening": "Reason and Logic",
   "Stage 01": "Travel Has Started",
   // "Stage 03 Secret": "Sports in Isolation",
   "Stage 04": "Follow the Arrows",
   "Stage 09": "We All Swim Down Here",
   "Stage 13": "Race to the Fishish",
   "Stage 17": "Underground Rave",
   "Stage 20": "Warping Wonders",
   "Stage 24": "Accelerating Towards Certain Death",
}

cheevo_types = {
    // "No Way, Not Happening": "",
    "Stage 01": "progression",
    "Stage 03 Secret": "",
    "Stage 04": "progression",
    "Stage 09": "progression",
    "Stage 13": "progression",
    "Stage 17": "progression",
    "Stage 20": "progression",
    "Stage 24": "win_condition",
}

cheevo_descriptions = {
    // "No Way, Not Happening": "Clear No Way, Not Happening",
    "Stage 01": "Clear Stage 1",
    "Stage 03 Secret": "Clear the secret exit on Stage 3",
    "Stage 04": "Clear Stage 4",
    "Stage 09": "Clear Stage 9",
    "Stage 13": "Clear Stage 13",
    "Stage 17": "Clear Stage 17",
    "Stage 20": "Clear Stage 20",
    "Stage 24": "Clear Stage 24 and beat the game",
}

cheevo_points = {
    // "No Way, Not Happening": 5,
    "Stage 01": 1,
    "Stage 03 Secret": 1,
    "Stage 04": 2,
    "Stage 09": 3,
    "Stage 13": 4,
    "Stage 17": 5,
    "Stage 20": 5,
    "Stage 24": 10,
}

cheevo_exit_types = {
    // "No Way, Not Happening": 1,
    // "Rikane P1 Ikaikukio": "Yellow Switch",
   "Stage 01": 1,
   "Stage 02": 1,
   "Stage 03": 1,
   "Stage 03 Secret": 2,
   "Stage 04": 1,
   //"Stage ??": 1,
   "Stage 05": 1,
   "Stage 06": 1,
   "Stage 07": 1,
   "Stage 08": 1,
   "Stage 09": 1,
   "Stage 10": 1,
   "Stage 11": 1,
   "Stage 12": 1,
   "Stage 13": 1,
   "Stage 14": 1,
   "Stage 15": 1,
   "Stage 16": 1,
   "Stage 17": 1,
   "Stage 18": 1,
   "Stage 19": 1,
   "Stage 20": 1,
   "Stage 21": 1,
   "Stage 22": 1,
   "Stage 23": 1,
   "Stage 24": 1,
}

////////////////////////////////////////
// Base achievements and leaderboards //
////////////////////////////////////////

for c in cheevo_names {
    achievement(
        title = cheevo_names[c],
        type = cheevo_types[c],
        description = cheevo_descriptions[c],
        points = cheevo_points[c],
        trigger = level_beat(c)
    )
}

for c in LevelNameLookup {
    // Only create a leaderboard if the level has an exit and isn't special
    if dictionary_contains_key(cheevo_exit_types, c) {
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

achievement(
     title = "Sports in Isolation",
     type = cheevo_types["Stage 03 Secret"],
     description = cheevo_descriptions["Stage 03 Secret"],
     points = cheevo_points["Stage 03 Secret"],
     trigger = level_beat_secret("Stage 03")
)

// Find a hidden (unintentional?) secret room in Stage 14
achievement(
     title = "Secret Slots",
     description = "Find a hidden (unintentional?) room in Stage 14",
     points = 1,
     trigger = level_id == LevelNameLookup["Stage 14"]
    && prev(sprite_pointer) == level_sprite_pointers["Stage 14"]
    && sprite_pointer == level_sprite_pointers["Stage 14 - Bonus Room"]
)

leaderboard(
    title = "Stage 03 Secret Speedrun",
    description = "Unlock the secret exit as fast as you can!",
    start = level_started("Stage 03"),
    cancel = speedrun_fail("Stage 03"),
    submit = level_beat_secret("Stage 03"), 
    value = measured(always_true()), 
    format = "FRAMES",
    lower_is_better = true
)


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
    "In the overworld • Exits: {0}/25",
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)

rich_presence_display(
    "{0} • Exits: {1}/25",
    rich_presence_lookup("LevelName", level_id, LevelIDLookup, fallback="Unknown"),
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)
