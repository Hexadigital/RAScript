// ~Hack~ Chomper Ville
// #ID = 34495

//////////////////
// General Data //
//////////////////

game_mode = byte(0x000100)
level_id = byte(0x0013bf)
exit_id = byte(0x000dd5)
sprite_pointer = tbyte(0x0000ce)
exits_completed = byte(0x001f2e)

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
    if progression_cheevo_exit_types[name] == "Green Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Green")
    }
    if progression_cheevo_exit_types[name] == "Yellow Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Yellow")
    }
    if progression_cheevo_exit_types[name] == "Blue Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Blue")
    }
    if progression_cheevo_exit_types[name] == "Red Switch" {
        return level_id == LevelNameLookup[name]
        && switch_hit("Red")
    }
    return level_id == LevelNameLookup[name]
    && exit(progression_cheevo_exit_types[name])
}

function speedrun_fail(level) {
    return level_id != LevelNameLookup[level]
    || sprite_pointer == 0
}

////////////////////////
// Hack Specific Data //
////////////////////////

progression_levels = [
    "Chomper Island One",
    "Yellow Switch Palace",
    "Chomper Island Two",
    "Chomper Island Three",
    "Chomper Island Five",
    "Chomper Castle"
]

LevelNameLookup = {
    "Super Secret Area": 0x28,
    "Chomper Island One": 0x29,
    "Yellow Switch Palace": 0x14,
    "Chomper Island Two": 0x2a,
    "Chomper Island Three": 0x27,
    "Chomper Island Five": 0x26,
    "Chomper Castle": 0x25,
}

LevelIDLookup = {}
for key in LevelNameLookup {
    LevelIDLookup[LevelNameLookup[key]] = key
}

NumExits = 6

// Start of level/room
level_sprite_pointers = {
    "Chomper Island One": 0x10fbdf,
    "Yellow Switch Palace": 0x12c197,
    "Yellow Switch Palace - Switch Room": 0x12b170,
    "Chomper Island Two": 0x10f659,
    "Chomper Island Three": 0x12cb26,
    "Chomper Island Five": 0x12dc7c,
    "Chomper Castle": 0x07c3ee,
    "Chomper Castle - Interior 1": 0x12e4ee,
    "Chomper Castle - Interior 2": 0x12e674,
    "Chomper Castle - Boss": 0x07c6d0
}

progression_cheevo_names = {
    "Chomper Island One": "A Field of Chompers",
    "Yellow Switch Palace": "Weaving Bullets and Flowers",
    "Chomper Island Two": "Run, Jump, STOP",
    "Chomper Island Three": "Softcore Encouraged",
    "Chomper Island Five": "Breather Four You",
    "Chomper Castle": "Chomping on Lava",
}

progression_cheevo_descriptions = {
    "Chomper Island One": "Traverse the fields of Chomper Island One!",
    "Yellow Switch Palace": "Reach the end of the Yellow Switch Palace and activate the switch!",
    "Chomper Island Two": "Run your way through Chomper Island Two!",
    "Chomper Island Three": "Juggle shells through Chomper Island Three!",
    "Chomper Island Five": "Skip a number and the water in Chomper Island Five!",
    "Chomper Castle": "Dethrone the king of Chomper Castle and beat the game!"
}

progression_cheevo_points = {
    "Chomper Island One": 4,
    "Yellow Switch Palace": 5,
    "Chomper Island Two": 5,
    "Chomper Island Three": 5,
    "Chomper Island Five": 5,
    "Chomper Castle": 10,
}

progression_cheevo_exit_types = {
    "Chomper Island One": 1,
    "Yellow Switch Palace": "Yellow Switch",
    "Chomper Island Two": 1,
    "Chomper Island Three": 1,
    "Chomper Island Five": 1,
    "Chomper Castle": 1,
}

for c in progression_levels {
    achievement(
        title = progression_cheevo_names[c],
        type = "progression",
        description = progression_cheevo_descriptions[c],
        points = progression_cheevo_points[c],
        trigger = level_beat(c)
    )

    leaderboard(
        title = format("{0} Speedrun", c),
        description = "Clear the level as fast as you can!",
        start = level_started(c),
        cancel = speedrun_fail(c),
        submit = level_beat(c), 
        value = measured(always_true()), 
        format = "FRAMES",
        lower_is_better = true
    )
}

///////////////////
// Rich Presence //
///////////////////

// ?0xH0100<=10?At the title screen
// ?0xH0100<=14?In the overworld | Exits: @Number(b0xh1f2e)/9 | @RSwitch(0xh1f2a) @BSwitch(0xh1f29)
// ?0xH13BF=0x0B?Taking on the final test in Freaky Eyes
// Doing their best in @Stage(0xH13BF) | Exits: @Number(b0xh1f2e)/9 | @RSwitch(0xh1f2a) @BSwitch(0xh1f29)

SwitchPlural = {
    1: ""
}

rich_presence_conditional_display(
    game_mode <= 0x0a,
    "At the title screen"
)

rich_presence_conditional_display(
    game_mode <= 0x0e,
    "In the overworld • Exits: {0}/{1} • {2} Switch{3} Activated",
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)

rich_presence_display(
    "Doing their best in {0} • Exits: {1}/{2} • {3} Switch{4} Activated",
    rich_presence_lookup("LevelName", level_id, LevelIDLookup, fallback="Unknown"),
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)
