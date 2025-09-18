// ~Hack~ Yosamikalo
// #ID = 34878

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
    "No Way, Not Happening",
    "Rikane P1 Ikaikukio",
    "The Final Chapter RPG: Isechi Atsute",
    "What's up, Nanachi?",
    "GO Kuha Tias!",
    "Left Center Right Out",
    "Don't you dare, Achiesu!",
    "I'm going to have a lot of fun and more",
    "???",
    "Hey, you! Stop that!",
    "Strictly Forbidden Escape",
    "I'm going to kill you, damn it",
    "And it's a shame"
]

LevelNameLookup = {
    "Hey, Tutoshi! You're the best!": 0x28,
    "No Way, Not Happening": 0x29,
    "Rikane P1 Ikaikukio": 0x14,
    "The Final Chapter RPG: Isechi Atsute": 0x2a,
    "What's up, Nanachi?": 0x27,
    "GO Kuha Tias!": 0x26,
    "Left Center Right Out": 0x25,
    "Don't you dare, Achiesu!": 0x15,
    "I'm going to have a lot of fun and more": 0x0a,
    "???": 0x01,
    "Hey, you! Stop that!": 0x09,
    "Strictly Forbidden Escape": 0x08,
    "I'm going to kill you, damn it": 0x04,
    "And it's a shame": 0x31
}

LevelIDLookup = {}
for key in LevelNameLookup {
    LevelIDLookup[LevelNameLookup[key]] = key
}

NumExits = 0

// Start of level/room
level_sprite_pointers = {
    "No Way, Not Happening": 0x16eff8,
    "Rikane P1 Ikaikukio": 0x138212,
    "The Final Chapter RPG: Isechi Atsute": 0x13bb76,
    "What's up, Nanachi?": 0x13dee5,
    "GO Kuha Tias!": 0x13e17c,
    "Left Center Right Out": 0x07c3ee,
    "Don't you dare, Achiesu!": 0x13f8a4,
    "I'm going to have a lot of fun and more": 0x13ec70,
    "???": 0x139e0a,
    "Hey, you! Stop that!": 0x16faef,
    "Strictly Forbidden Escape": 0x169b95,
    "I'm going to kill you, damn it": 0x07c3ee,
    "And it's a shame": 0x07c3ee,
}

cheevo_names = {
    "No Way, Not Happening": "Reason and Logic",
    "Rikane P1 Ikaikukio": "Coins and Moons Galore",
    "The Final Chapter RPG: Isechi Atsute": "Cube Climber",
    "What's up, Nanachi?": "Chomping and Bouncing",
    "GO Kuha Tias!": "Deceptively Short",
    "Left Center Right Out": "Now Do It One More Time",
    "Don't you dare, Achiesu!": "Frozen Crypt",
    "Don't you dare, Achiesu! Secret": "Melting the Ice",
    "I'm going to have a lot of fun and more": "Chomping on Seaweed",
    "I'm going to have a lot of fun and more Secret": "Hidden Depths",
    "???": "Mysterious House",
    "Hey, you! Stop that!": "Long Flight",
    "Hey, you! Stop that! Secret": "Cape? No Thanks",
    "Strictly Forbidden Escape": "Tread Carefully",
    "I'm going to kill you, damn it": "Temporal Paradox",
    "And it's a shame": "Black & Blue"
}

cheevo_types = {
    "No Way, Not Happening": "",
    "Rikane P1 Ikaikukio": "",
    "The Final Chapter RPG: Isechi Atsute": "progression",
    "What's up, Nanachi?": "progression",
    "GO Kuha Tias!": "progression",
    "Left Center Right Out": "progression",
    "Don't you dare, Achiesu!": "progression",
    "Don't you dare, Achiesu! Secret": "",
    "I'm going to have a lot of fun and more": "",
    "I'm going to have a lot of fun and more Secret": "",
    "???": "",
    "Hey, you! Stop that!": "progression",
    "Hey, you! Stop that! Secret": "",
    "Strictly Forbidden Escape": "",
    "I'm going to kill you, damn it": "progression",
    "And it's a shame": "win_condition"
}

cheevo_descriptions = {
    "No Way, Not Happening": "Clear \"No Way, Not Happening\" (えなおわけこうえぬ)",
    "Rikane P1 Ikaikukio": "Activate the yellow switch in \"Rikane P1 Ikaikukio\" (リカネ P1 イカィクキオ)",
    "The Final Chapter RPG: Isechi Atsute": "Carefully reach the end of \"The Final Chapter RPG: Isechi Atsute\" (のセツカキ RPG イセチアツテ)",
    "What's up, Nanachi?": "Clear \"What's up, Nanachi?\" (わセスツアんナナチ?)",
    "GO Kuha Tias!": "Bounce on some shells and clear \"GO Kuha Tias!\" (GO クハテイアス!)",
    "Left Center Right Out": "Defeat Iggy and clear \"Left Center Right Out\" (左中右出ヤラ  <^o^<)",
    "Don't you dare, Achiesu!": "Stay warm and pass the regular exit for \"Don't you dare, Achiesu!\" (ふけぬなあちえぞすふ R クオ二!)",
    "Don't you dare, Achiesu! Secret": "Bring the frozen key to the secret exit for \"Don't you dare, Achiesu!\" (ふけぬなあちえぞすふ R クオ二!)",
    "I'm going to have a lot of fun and more": "Swim through the regular exit for \"I'm going to have a lot of fun and more\" (えそせなど ておうつおとワ)",
    "I'm going to have a lot of fun and more Secret": "Unlock the secret exit for \"I'm going to have a lot of fun and more\" (えそせなど ておうつおとワ)",
    "???": "Jump through the hook to clear \"???\"",
    "Hey, you! Stop that!": "Fly through the regular exit for \"Hey, you! Stop that!\" (とそ いお うそせとけせなお!)",
    "Hey, you! Stop that! Secret": "Find and unlock the secret exit for \"Hey, you! Stop that!\" (とそ いお うそせとけせなお!)",
    "Strictly Forbidden Escape": "Activate the green switch in \"Strictly Forbidden Escape\" (きつおおせ てぬけどうく たあしあうお)",
    "I'm going to kill you, damn it": "Solve the puzzle and clear \"I'm going to kill you, damn it\" (えそせなど きくそてと くそなてお)",
    "And it's a shame": "Take down Bowser in \"And it's a shame\" (かつそせと えぞぞつ), beating the game"
}

cheevo_points = {
    "No Way, Not Happening": 5,
    "Rikane P1 Ikaikukio": 5,
    "The Final Chapter RPG: Isechi Atsute": 10,
    "What's up, Nanachi?": 5,
    "GO Kuha Tias!": 10,
    "Left Center Right Out": 10,
    "Don't you dare, Achiesu!": 10,
    "Don't you dare, Achiesu! Secret": 10,
    "I'm going to have a lot of fun and more": 5,
    "I'm going to have a lot of fun and more Secret": 5,
    "???": 3,
    "Hey, you! Stop that!": 10,
    "Hey, you! Stop that! Secret": 10,
    "Strictly Forbidden Escape": 5,
    "I'm going to kill you, damn it": 10,
    "And it's a shame": 25
}

cheevo_exit_types = {
    "No Way, Not Happening": 1,
    "Rikane P1 Ikaikukio": "Yellow Switch",
    "The Final Chapter RPG: Isechi Atsute": 1,
    "What's up, Nanachi?": 1,
    "GO Kuha Tias!": 1,
    "Left Center Right Out": 1,
    "Don't you dare, Achiesu!": 1,
    "Don't you dare, Achiesu! Secret": 2,
    "I'm going to have a lot of fun and more": 1,
    "I'm going to have a lot of fun and more Secret": 2,
    "???": 1,
    "Hey, you! Stop that!": 1,
    "Hey, you! Stop that! Secret": 2,
    "Strictly Forbidden Escape": "Green Switch",
    "I'm going to kill you, damn it": 2,
    "And it's a shame": 1,
}

////////////////////////////////////////
// Base achievements and leaderboards //
////////////////////////////////////////

for c in regular_levels {
    achievement(
        title = cheevo_names[c],
        type = cheevo_types[c],
        description = cheevo_descriptions[c],
        points = cheevo_points[c],
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

/////////////////////////////////////////////////
// Hack-specific achievements and leaderboards //
/////////////////////////////////////////////////

achievement(
    title = cheevo_names["Don't you dare, Achiesu! Secret"],
    type = cheevo_types["Don't you dare, Achiesu! Secret"],
    description = cheevo_descriptions["Don't you dare, Achiesu! Secret"],
    points = cheevo_points["Don't you dare, Achiesu! Secret"],
    trigger = level_beat_secret("Don't you dare, Achiesu!")
)

achievement(
    title = "Nevermeltcoin",
    description = "Clear \"Don't you dare, Achiesu!\" (ふけぬなあちえぞすふ R クオ二!) after grabbing the Yoshi Coin",
    points = 1,
    trigger = level_beat("Don't you dare, Achiesu!") || level_beat_secret("Don't you dare, Achiesu!")
)

achievement(
    title = cheevo_names["I'm going to have a lot of fun and more Secret"],
    type = cheevo_types["I'm going to have a lot of fun and more Secret"],
    description = cheevo_descriptions["I'm going to have a lot of fun and more Secret"],
    points = cheevo_points["I'm going to have a lot of fun and more Secret"],
    trigger = level_beat_secret("I'm going to have a lot of fun and more")
)

achievement(
    title = cheevo_names["Hey, you! Stop that! Secret"],
    type = cheevo_types["Hey, you! Stop that! Secret"],
    description = cheevo_descriptions["Hey, you! Stop that! Secret"],
    points = cheevo_points["Hey, you! Stop that! Secret"],
    trigger = level_beat_secret("Hey, you! Stop that!")
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
    "In the overworld • Exits: {0} • {2} Switch{3} Activated",
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)

rich_presence_display(
    "Doing their best in {0} • Exits: {1} • {3} Switch{4} Activated",
    rich_presence_lookup("LevelName", level_id, LevelIDLookup, fallback="Unknown"),
    rich_presence_value("Number", exits_completed),
    NumExits,
    rich_presence_value("Number", switch_count),
    rich_presence_lookup("SwitchPlural", switch_count, SwitchPlural, fallback="es")
)
