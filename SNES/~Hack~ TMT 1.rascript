// ~Hack~ TMT 1
// #ID = 37921

//////////////////
// General Data //
//////////////////

game_mode = byte(0x000100)
level_id = byte(0x0013bf)
exit_id = byte(0x000dd5)
sprite_pointer = tbyte(0x0000ce)
exits_completed = byte(0x001f2e)
yoshi_coins = byte(0x001422)

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

regular_levels = [
    "Stage 1-1",
    "Stage 1-2",
    "Stage 1-3",
    "Stage 1-4",
    "Stage 1-5",
    "Stage 1-6",
    "Stage 2-1",
    "Stage 2-2",
    "Stage 2-3",
    "Stage 3-1",
    "Stage 3-2",
    "Stage 3-3",
    "Stage 3-4",
    "Stage 3-5",
    "Stage 4-1",
    "Stage 4-2",
    "Stage 4-3",
    "Stage 4-4",
    "Stage 4-5",
    "Stage 4-6",
    "Stage 4-7",
    "Stage 5-1",
    "Stage 5-2",
    "Stage 5-3",
    "Stage 5-4",
    "Stage 5-5",
    "Stage 5-6",
    "Stage ?-1",
    "Stage ?-2",
    "Stage ?-3",
]

LevelNameLookup = {
    // "Hey, Tutoshi! You're the best!": 0x28,
   "Stage 1-1": 0x01,
   "Stage 1-2": 0x02,
   "Stage 1-3": 0x03,
   "Stage 1-4": 0x04,
   "Stage 1-5": 0x05,
   "Stage 1-6": 0x06,
   "Stage 2-1": 0x07,
   "Stage 2-2": 0x08,
   "Stage 2-3": 0x09,
   "Stage 3-1": 0x0a,
   "Stage 3-2": 0x0b,
   "Stage 3-3": 0x0c,
   "Stage 3-4": 0x0d,
   "Stage 3-5": 0x0e,
   "Stage 4-1": 0x0f,
   "Stage 4-2": 0x10,
   "Stage 4-3": 0x11,
   "Stage 4-4": 0x12,
   "Stage 4-5": 0x13,
   "Stage 4-6": 0x14,
   "Stage 4-7": 0x15,
   "Stage 5-1": 0x16,
   "Stage 5-2": 0x17,
   "Stage 5-3": 0x18,
   "Stage 5-4": 0x19,
   "Stage 5-5": 0x1a,
   "Stage 5-6": 0x1b,
   "Stage ?-1": 0x1c,
   "Stage ?-2": 0x1d,
   "Stage ?-3": 0x1e,
   "Ending": 0x1f,
}

LevelIDLookup = {}
for key in LevelNameLookup {
    LevelIDLookup[LevelNameLookup[key]] = key
}

NumExits = 0

// Start of level/room
level_sprite_pointers = {
    // "No Way, Not Happening": 0x16eff8,
   "Stage 1-1": 0x14af95,
   "Stage 1-2": 0x13d82b,
   "Stage 1-2 - Room 1": 0x13dcee,
   "Stage 1-2 - Room 2": 0x13dd6a,
   "Stage 1-2 - Room 3": 0x13df51,
   "Stage 1-2 - Exit": 0x13cd74,
   "Stage 1-3": 0x13b5ed,
   "Stage 1-4": 0x13bb59,
   "Stage 1-5": 0x13c76a,
   "Stage 1-6": 0x13d946,
   "Stage 2-1": 0x13e37a,
   "Stage 2-2": 0x13abdd,
   "Stage 2-3": 0x07c3ee,
   "Stage 3-1": 0x13a8f7,
   "Stage 3-2": 0x13ffa8,
   "Stage 3-3": 0x13d09f,
   "Stage 3-4": 0x13f6fd,
   "Stage 3-5": 0x13eed6,
   "Stage 4-1": 0x138b42,
   "Stage 4-2": 0x138d58,
   "Stage 4-3": 0x13a5b7,
   "Stage 4-4": 0x13f73a,
   "Stage 4-5": 0x14feaf,
   "Stage 4-6": 0x13a70d,
   "Stage 4-7": 0x1494c1,
   "Stage 5-1": 0x13b902,
   "Stage 5-2": 0x13de01,
   "Stage 5-3": 0x1396e0,
   "Stage 5-4": 0x13e91f,
   "Stage 5-5": 0x13c7a1,
   "Stage 5-6": 0x138dec,
   "Stage ?-1": 0x14ae0b,
   "Stage ?-2": 0x14a6b5,
   "Stage ?-3": 0x14f465,
   "Ending": 0x13ecb1,
}

cheevo_names = {
    // "No Way, Not Happening": "Reason and Logic",
   "Stage 1-1": "No Shell Jump Necessary",
   "Stage 1-6": "The Great Slide",
   "Stage 2-3": "Haunted Inside",
   "Stage 3-5": "Molten Acrobatics",
   "Stage 4-7": "High in the Sky",
   "Stage 5-6": "Icy Rain",
   "Stage ?-1": "The First Tower",
   "Stage ?-2": "The Second Tower",
   "Stage ?-3": "The Final Tower",
}

cheevo_types = {
    // "No Way, Not Happening": "",
    "Stage 1-1": "progression",
    "Stage 1-6": "progression",
    "Stage 2-3": "progression",
    "Stage 3-5": "progression",
    "Stage 4-7": "progression",
    "Stage 5-6": "win_condition",
    "Stage ?-1": "",
    "Stage ?-2": "",
    "Stage ?-3": "",
}

cheevo_descriptions = {
    // "No Way, Not Happening": "Clear No Way, Not Happening",
    "Stage 1-1": "Clear Stage 1-1",
    "Stage 1-6": "Clear Stage 1-6",
    "Stage 2-3": "Clear Stage 2-3",
    "Stage 3-5": "Clear Stage 3-5",
    "Stage 4-7": "Clear Stage 4-7",
    "Stage 5-6": "Clear Stage 5-6",
    "Stage ?-1": "Clear Stage ?-1",
    "Stage ?-2": "Clear Stage ?-2",
    "Stage ?-3": "Clear Stage ?-3",
}

cheevo_points = {
    // "No Way, Not Happening": 5,
    "Stage 1-1": 1,
    "Stage 1-6": 3,
    "Stage 2-3": 3,
    "Stage 3-5": 5,
    "Stage 4-7": 10,
    "Stage 5-6": 10,
    "Stage ?-1": 2,
    "Stage ?-2": 2,
    "Stage ?-3": 3,
}

cheevo_exit_types = {
    // "No Way, Not Happening": 1,
    // "Rikane P1 Ikaikukio": "Yellow Switch",
    "Stage 1-1": 1,
    "Stage 1-2": 1,
    "Stage 1-3": 1,
    "Stage 1-3 Secret": 2,
    "Stage 1-4": 1,
    "Stage 1-5": 1,
    "Stage 1-6": 1,
    "Stage 2-1": 1,
    "Stage 2-2": 1,
    "Stage 2-3": 1,
    "Stage 3-1": 1,
    "Stage 3-2": 1,
    "Stage 3-3": 1,
    "Stage 3-4": 1,
    "Stage 3-5": 1,
    "Stage 4-1": 1,
    "Stage 4-2": 1,
    "Stage 4-3": 1,
    "Stage 4-4": 1,
    "Stage 4-5": 1,
    "Stage 4-6": 1,
    "Stage 4-7": 1,
    "Stage 5-1": 1,
    "Stage 5-2": 1,
    "Stage 5-3": 1,
    "Stage 5-4": 1,
    "Stage 5-5": 1,
    "Stage 5-6": 1,
    "Stage ?-1": 1,
    "Stage ?-2": 0000,
    "Stage ?-3": 0000,
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

for c in regular_levels {
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

// Clear all three paths in Stage 1-2 in one session
stage_1_2_rooms = ["Room 1", "Room 2", "Room 3"]
function stage_1_2_room_cleared(name) {
    return once(level_id == LevelNameLookup["Stage 1-2"]
    && prev(sprite_pointer) == level_sprite_pointers[format("Stage 1-2 - {0}", name)]
    && sprite_pointer == level_sprite_pointers["Stage 1-2 - Exit"])
}

achievement(
     title = "Thrice the Fun",
     description = "Clear all three paths in Stage 1-2 in one session",
     points = 2,
     //trigger = measured(once(stage_1_2_path_1_cleared) && once (stage_1_2_path_2_cleared) && once(stage_1_2_path_3_cleared))
     trigger = measured(tally_of(stage_1_2_rooms, 4, stage_1_2_room_cleared))
)

achievement(
     title = "Disregarding the Warning",
     description = "Unlock the secret exit in Stage 1-3",
     points = 4,
     trigger = level_beat_secret("Stage 1-3")
)

leaderboard(
    title = "Stage 1-3 Secret Speedrun",
    description = "Unlock the secret exit as fast as you can!",
    start = level_started("Stage 1-3"),
    cancel = speedrun_fail("Stage 1-3"),
    submit = level_beat_secret("Stage 1-3"), 
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
    "In the overworld • Exits: {0}",
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)

rich_presence_display(
    "{0} • Exits: {1}",
    rich_presence_lookup("LevelName", level_id, LevelIDLookup, fallback="Unknown"),
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)
