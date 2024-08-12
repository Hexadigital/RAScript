// Mega Man Battle Network 3: White Version [Subset - Omega S-Ranks]
// #ID = 30129

AreaLookup = {
    0x0000: "ACDC Town",
    0x0100: "ACDC Station",
    0x0200: "Lan's Living Room",
    0x0300: "Lan's Room",
    0x0400: "Mayl's Living Room",
    0x0500: "Mayl's Room",
    0x0600: "Dex's Room",
    0x0700: "Yai's Room",
    0x0800: "Higsby's",
    0x0001: "Class 5-A",
    0x0101: "Class 5-B",
    0x0201: "Class Hall",
    0x0301: "Cross Hall",
    0x0401: "Staff Lounge",
    0x0501: "Principal's Office",
    0x0601: "Staff Lounge",
    0x0002: "SciLab Station",
    0x0102: "SciLab Lobby",
    0x0202: "Virus Lab",
    0x0302: "Dad's Lab",
    0x0402: "Archives",
    0x0003: "Yoka Station",
    0x0103: "Front of Zoo",
    0x0203: "Hotel Front",
    0x0303: "Hotel Lobby",
    0x0403: "Hotel Hall",
    0x0503: "Guest Room",
    0x0603: "Outdoor Bath",
    0x0703: "Zoo 1",
    0x0803: "Zoo 2",
    0x0903: "Secret Cave",
    0x0004: "Beach Station",
    0x0104: "Beach Street",
    0x0204: "TV Station Lobby",
    0x0304: "TV Station Hall 1F",
    0x0404: "TV Station Studio",
    0x0504: "TV Station Hall 2F",
    0x0604: "TV Station Editing Room",
    0x0005: "Hades Isle",
    0x0105: "Hades Mountain",
    0x0205: "Four Hades",
    0x0305: "Eternal Hades",
    0x0006: "Hospital Shoreline",
    0x0106: "Hospital Lobby",
    0x0206: "Hospital 2F",
    0x0306: "Hospital Room",
    0x0406: "Hospital 3F",
    0x0506: "Hospital Basement",
    0x0007: "SciLab (Flashback)",
    0x0107: "Castle Wily",
    0x0207: "Wily Lab",
    0x0307: "Wily Monitor Room",
    0x0407: "Wily Lab Hall",
    0x0507: "WWW Server Room",
    0x0080: "Principal's PC 1",
    0x0180: "Principal's PC 2",
    0x0081: "Zoo Comp 1",
    0x0181: "Zoo Comp 2",
    0x0281: "Zoo Comp 3",
    0x0381: "Zoo Comp 4",
    0x0082: "Hospital Comp 1",
    0x0182: "Hospital Comp 2",
    0x0282: "Hospital Comp 3",
    0x0382: "Hospital Comp 4",
    0x0482: "Hospital Comp 5",
    0x0083: "WWW Comp 1",
    0x0183: "WWW Comp 2",
    0x0283: "WWW Comp 3",
    0x0383: "WWW Comp 4",
    0x0483: "Alpha",
    0x0088: "Lan's HP",
    0x0188: "Mayl's HP",
    0x0288: "Dex's HP",
    0x0388: "Yai's HP",
    0x0488: "Tamako's HP",
    0x0588: "???'s HP",
    0x008A: "Description Machine Comp",
    0x018A: "Hot Springs Lion Comp",
    0x028A: "Demon Statue Comp",
    0x038A: "Editing Equipment Comp",
    0x088A: "Monitor Room Comp",
    0x008C: "Doghouse Comp",
    0x018C: "Blackboard Comp",
    0x028C: "SciLab Vending Machine Comp",
    0x038C: "Computer Comp",
    0x048C: "Control Panel Comp",
    0x058C: "School Server Comp",
    0x068C: "Relay Van Comp",
    0x078C: "NetBattle Machine Comp",
    0x088C: "TV Station Control Panel Comp",
    0x098C: "Phone Comp",
    0x0A8C: "TV Comp",
    0x0B8C: "Bed Comp",
    0x0C8C: "Hospital Vending Machine Comp",
    0x0D8C: "Ticket Machine Comp",
    0x0E8C: "Unmanned Tank Comp",
    0x0F8C: "Old TV Comp",
    0x008D: "Armor Comp",
    0x018D: "Sign Comp",
    0x028D: "Alarm Comp",
    0x038D: "Door Sensor Comp",
    0x048D: "Outer Wall Comp",
    0x0090: "ACDC Area 1",
    0x0190: "ACDC Area 2",
    0x0290: "ACDC Area 3",
    0x0390: "ACDC Square",
    0x0091: "SciLab Area 1",
    0x0191: "SciLab Area 2",
    0x0291: "SciLab Square",
    0x0092: "Yoka Area 1",
    0x0192: "Yoka Area 2",
    0x0292: "Yoka Square",
    0x0093: "Beach Area 1",
    0x0193: "Beach Area 2",
    0x0293: "Beach Square",
    0x0393: "Hades Isle Area",
    0x0094: "Undernet 1",
    0x0194: "Undernet 2",
    0x0294: "Undernet 3",
    0x0394: "Undernet 4",
    0x0494: "Undernet 5",
    0x0594: "Undernet 6",
    0x0694: "Undernet 7",
    0x0794: "Under Square",
    0x0095: "Secret Area 1",
    0x0195: "Secret Area 2",
    0x0295: "Secret Area 3",
}

AreaNameToID = {}
for key in AreaLookup {
    AreaNameToID[AreaLookup[key]] = key
}

EnemyLookup = {
    0x00: "MegaMan",
    0x01: "Mettaur",
    0x02: "Mettaur2",
    0x03: "Mettaur3",
    0x04: "Mettaur Omega",
    0x05: "Canodumb",
    0x06: "Canodumb2",
    0x07: "Canodumb3",
    0x08: "Canodumb Omega",
    0x09: "Fishy",
    0x0A: "Fishy2",
    0x0B: "Fishy3",
    0x0C: "Fishy Omega",
    0x0D: "Swordy",
    0x0E: "Swordy2",
    0x0F: "Swordy3",
    0x10: "Swordy Omega",
    0x11: "Ratty",
    0x12: "Ratty2",
    0x13: "Ratty3",
    0x14: "Ratty Omega",
    0x15: "HardHead",
    0x16: "ColdHead",
    0x17: "HotHead",
    0x18: "HardHead Omega",
    0x19: "Jelly",
    0x1A: "HeatJelly",
    0x1B: "EarthJelly",
    0x1C: "Jelly Omega",
    0x1D: "Shrimpy",
    0x1E: "Shrimpy2",
    0x1F: "Shrimpy3",
    0x20: "Shrimpy Omega",
    0x21: "Spikey",
    0x22: "Spikey2",
    0x23: "Spikey3",
    0x24: "Spikey Omega",
    0x25: "Bunny",
    0x26: "TuffBunny",
    0x27: "MegaBunny",
    0x28: "Bunny Omega",
    0x29: "WindBox",
    0x2A: "VacuumFan",
    0x2B: "StormBox",
    0x2C: "Wind Omega",
    0x2D: "PuffBall",
    0x2E: "PoofBall",
    0x2F: "GoofBall",
    0x30: "PuffBall Omega",
    0x31: "Mushy",
    0x32: "Mashy",
    0x33: "Moshy",
    0x34: "Mushy Omega",
    0x35: "Dominerd",
    0x36: "Dominerd2",
    0x37: "Dominerd3",
    0x38: "Dominerd Omega",
    0x39: "Yort",
    0x3A: "Yurt",
    0x3B: "Yart",
    0x3C: "Yort Omega",
    0x3D: "Shadow",
    0x3E: "RedDevil",
    0x3F: "BlueDemon",
    0x40: "Shadow Omega",
    0x41: "Brushman",
    0x42: "Brushman2",
    0x43: "Brushman4",
    0x44: "Brushman Omega",
    0x45: "Scutz",
    0x46: "Scuttle",
    0x47: "Scuttler",
    0x48: "Scuttzer",
    0x49: "Scuttlest",
    0x4A: "Scuttle Omega",
    0x4B: "Beetle",
    0x4C: "Deetle",
    0x4D: "Geetle",
    0x4E: "Beetle Omega",
    0x4F: "Metrid",
    0x50: "Metrod",
    0x51: "Metrodo",
    0x52: "Metrid Omega",
    0x53: "SnowBlow",
    0x54: "LowBlow",
    0x55: "MoBlow",
    0x56: "SnowBlow Omega",
    0x57: "KillerEye",
    0x58: "DemonEye",
    0x59: "JokerEye",
    0x5A: "KillerEye Omega",
    0x5B: "Momogra",
    0x5C: "Momogro",
    0x5D: "Momogre",
    0x5E: "Momogra Omega",
    0x5F: "Basher",
    0x60: "Smasher",
    0x61: "Trasher",
    0x62: "Baser Omega",
    0x63: "Heavy",
    0x64: "Heavier",
    0x65: "Heaviest",
    0x66: "Heavy Omega",
    0x67: "Pengi",
    0x68: "Penga",
    0x69: "Pengon",
    0x6A: "Pengi Omega",
    0x6B: "Viney",
    0x6C: "Viner",
    0x6D: "Vinert",
    0x6E: "Viney Omega",
    0x6F: "Slimer",
    0x70: "Slimey",
    0x71: "Slimest",
    0x72: "Slimer Omega",
    0x73: "Elebee",
    0x74: "EleWasp",
    0x75: "EleHornet",
    0x76: "EleBee Omega",
    0x77: "Needler",
    0x78: "Nailer",
    0x79: "Spiker",
    0x7A: "Needler Omega",
    0x7B: "Trumpy",
    0x7C: "Tuby",
    0x7D: "Tromby",
    0x7E: "Trumpy Omega",
    0x7F: "AlphaBug Red",
    0x80: "AlphaBug Blue",
    0x81: "AlphaBug Yellow",
    0x82: "AlphaBug Omega",
    0x83: "Quaker",
    0x84: "Shaker",
    0x85: "Breaker",
    0x86: "Quaker Omega",
    0x87: "N.O",
    0x88: "N.0-2",
    0x89: "N.0-3",
    0x8A: "N.0 Omega",
    0x8B: "Eleball",
    0x8C: "Elesphere",
    0x8D: "Eleglobe",
    0x8E: "Eleball Omega",
    0x8F: "Volcano",
    0x90: "Volcaner",
    0x91: "Volcanest",
    0x92: "Volcano Omega",
    0x93: "Totem",
    0x94: "Totam",
    0x95: "Totun",
    0x96: "Totem Omega",
    0x97: "Twins",
    0x98: "Twinner",
    0x99: "Twinnest",
    0x9A: "Twins Omega",
    0x9B: "Boomer",
    0x9C: "Gloomer",
    0x9D: "Doomer",
    0x9E: "Boomer Omega",
    0x9F: "Number-1",
    0xA0: "Number-2",
    0xA1: "Number-3",
    0xA2: "Number-M1",
    0xA3: "Number-M2",
    0xA4: "Number-M3",
    0xA5: "Number-G1",
    0xA6: "Number-G2",
    0xA7: "Number-G3",
    0xA8: "FlashMan",
    0xA9: "FlashMan Alpha",
    0xAA: "FlashMan Beta",
    0xAB: "FlashMan Omega",
    0xAC: "BeastMan",
    0xAD: "BeastMan Alpha",
    0xAE: "BeastMan Beta",
    0xAF: "BeastMan Omega",
    0xB0: "BubbleMan",
    0xB1: "BubbleMan Alpha",
    0xB2: "BubbleMan Beta",
    0xB3: "BubbleMan Omega",
    0xB4: "DesertMan",
    0xB5: "DesertMan Alpha",
    0xB6: "DesertMan Beta",
    0xB7: "DesertMan Omega",
    0xB8: "PlantMan",
    0xB9: "PlantMan Alpha",
    0xBA: "PlantMan Beta",
    0xBB: "PlantMan Omega",
    0xBC: "FlameMan",
    0xBD: "FlameMan Alpha",
    0xBE: "FlameMan Beta",
    0xBF: "FlameMan Omega",
    0xC0: "DrillMan",
    0xC1: "DrillMan Alpha",
    0xC2: "DrillMan Beta",
    0xC3: "DrillMan Omega",
    0xC4: "Alpha",
    0xC5: "Alpha Omega",
    0xC6: "GutsMan [Stormbox]",
    0xC7: "GutsMan [WindOmega]",
    0xC8: "GutsMan",
    0xC9: "GutsMan Alpha",
    0xCA: "GutsMan Beta",
    0xCB: "GutsMan Omega",
    0xCC: "ProtoMan",
    0xCD: "ProtoMan Alpha",
    0xCE: "ProtoMan Beta",
    0xCF: "ProtoMan Omega",
    0xD0: "MetalMan",
    0xD1: "MetalMan Alpha",
    0xD2: "MetalMan Beta",
    0xD3: "MetalMan Omega",
    0xD4: "Punk",
    0xD5: "Punk Alpha",
    0xD6: "Punk Beta",
    0xD7: "Punk Omega",
    0xD8: "KingMan",
    0xD9: "KingMan Alpha",
    0xDA: "KingMan Beta",
    0xDB: "KingMan Omega",
    0xDC: "MistMan",
    0xDD: "MistMan Alpha",
    0xDE: "MistMan Beta",
    0xDF: "MistMan Omega",
    0xE0: "BowlMan",
    0xE1: "BowlMan Alpha",
    0xE2: "BowlMan Beta",
    0xE3: "BowlMan Omega",
    0xE4: "DarkMan",
    0xE5: "DarkMan Alpha",
    0xE6: "DarkMan Beta",
    0xE7: "DarkMan Omega",
    0xE8: "JapanMan",
    0xE9: "JapanMan Alpha",
    0xEA: "JapanMan Beta",
    0xEB: "JapanMan Omega",
    0xEC: "Serenade",
    0xED: "Serenade Alpha",
    0xEE: "Serenade Beta",
    0xEF: "Serenade Omega",
    0xF0: "Bass [Invincible]",
    0xF1: "Bass",
    0xF2: "BassGS",
    0xF3: "Bass Omega",
}

EnemyNameToID = {}
for key in EnemyLookup {
    EnemyNameToID[EnemyLookup[key]] = key
}

EnemyHPLookup = {
    "FlashMan": 300,
    "FlashMan Beta": 700,
    "FlashMan Omega": 1500,
    "BeastMan": 500,
    "BeastMan Alpha": 700,
    "BeastMan Beta": 900,
    "BeastMan Omega": 1600,
    "BubbleMan": 500,
    "BubbleMan Beta": 1200,
    "BubbleMan Omega": 1800,
    "DesertMan": 800,
    "DesertMan Beta": 1600,
    "DesertMan Omega": 2000,
    "PlantMan": 1000,
    "PlantMan Beta": 1700,
    "PlantMan Omega": 2100,
    "FlameMan": 1000,
    "FlameMan Beta": 1800,
    "FlameMan Omega": 2400,
    "MistMan": 1000,
    "MistMan Beta": 1600,
    "MistMan Omega": 2000,
    "BowlMan Omega": 2000,
    "DrillMan": 600,
    "DrillMan Beta": 1200,
    "DrillMan Omega": 1800,
    "Bass": 1000,
    "Alpha": 2000,
    "Alpha Omega": 3000,
    "GutsMan": 300,
    "GutsMan Alpha": 700,
    "GutsMan Beta": 900,
    "GutsMan Omega": 2000,
    "MetalMan": 500,
    "MetalMan Beta": 1200,
    "MetalMan Omega": 1700,
    "KingMan": 800,
    "KingMan Beta": 1500,
    "KingMan Omega": 2000,
    "ProtoMan": 1000,
    "ProtoMan Beta": 1600,
    "ProtoMan Omega": 2000,
    "DarkMan": 1400,
    "DarkMan Beta": 1800,
    "DarkMan Omega": 2000,
    "JapanMan": 1600,
    "JapanMan Beta": 2000,
    "JapanMan Omega": 2200,
    "Serenade": 2000,
    "Serenade Omega": 2600,
    "BassGS": 2000,
    "Bass Omega": 3000,
}

// Overworld variables
map_id = word(0x009884)
player_hp = word(0x0098a0)
player_max_hp = word(0x0098a2)
zenny = dword(0x0098f4)
bugfrags = dword(0x0098f8)

// Battle variables
in_battle = byte(0x00eca0) == 0x04
player_battle_hp = word(0x03f294)
player_battle_max_hp = word(0x03f296)
battle_time = dword(0x00ece0)
enemy_1_id = byte(0x03f353)
enemy_1_hp = word(0x03f368)
enemy_1_max_hp = word(0x03f36a)
enemy_2_id = byte(0x03f427)
enemy_2_hp = word(0x03f43c)
enemy_2_max_hp = word(0x03f43e)
enemy_3_id = byte(0x03f4fb)
enemy_3_hp = word(0x03f510)
enemy_3_max_hp = word(0x03f512)
busting_level = byte(0x017330)

// Other variables
cybersimon_says = byte(0x011dc5)

// Prevent things from submitting on title screen or in full-screen menus
title_screen_check = byte(0x0017f8) != 0x00

function buster_glitch() {
    return byte(0x00d778) > 0x0a
}

function hp_glitch() {
    return player_max_hp > 5000
}

function custom_glitch() {
    return byte(0x00d783) > 10
}

function bassgs_detected() {
    return bit7(0x008357) == 1
}

function no_glitches_enabled() {
    return !buster_glitch() && !hp_glitch() && !custom_glitch() && !bassgs_detected()
}

function in_area(name) {
    return map_id == AreaNameToID[name]
}

function fighting_boss(name) {
    return enemy_1_id == EnemyNameToID[name] && enemy_1_max_hp == EnemyHPLookup[name]
}

function boss_killed() {
    return prev(enemy_1_hp) > 0 && enemy_1_hp == 0
}

function s_ranked() {
    return prev(busting_level) == 0 && busting_level >= 0x0b && busting_level < 0x10
}

leaderboard(
    title = "Deletion Time: FlashMan Omega",
    description = "Defeat FlashMan Omega in Principal's PC 2 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Shattered Bulbs",
    points = 10,
    description = "Defeat FlashMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: GutsMan Omega",
    description = "Defeat GutsMan Omega in Dex's HP as fast as you can!",
    start  = no_glitches_enabled() && in_area("Dex's HP") && fighting_boss("GutsMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Battered Fists",
    points = 10,
    description = "Defeat GutsMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Dex's HP") && fighting_boss("GutsMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: BeastMan Omega",
    description = "Defeat BeastMan Omega in Zoo Comp 3 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Zoo Comp 3") && fighting_boss("BeastMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Caged",
    points = 10,
    description = "Defeat BeastMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Zoo Comp 3") && fighting_boss("BeastMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: MetalMan Omega",
    description = "Defeat MetalMan Omega in Tamako's HP as fast as you can!",
    start  = no_glitches_enabled() && in_area("Tamako's HP") && fighting_boss("MetalMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Bent Metal",
    points = 10,
    description = "Defeat MetalMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Tamako's HP") && fighting_boss("MetalMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: BubbleMan Omega",
    description = "Defeat BubbleMan Omega in Yoka Area 2 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Yoka Area 2") && fighting_boss("BubbleMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Popped",
    points = 10,
    description = "Defeat BubbleMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Yoka Area 2") && fighting_boss("BubbleMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: KingMan Omega",
    description = "Defeat KingMan Omega in the TV Station Control Panel Comp as fast as you can!",
    start  = no_glitches_enabled() && in_area("TV Station Control Panel Comp") && fighting_boss("KingMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Outplayed",
    points = 10,
    description = "Defeat KingMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("TV Station Control Panel Comp") && fighting_boss("KingMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: DesertMan Omega",
    description = "Defeat DesertMan Omega in the Relay Van Comp as fast as you can!",
    start  = no_glitches_enabled() && in_area("Relay Van Comp") && fighting_boss("DesertMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Gone with the Tide",
    points = 10,
    description = "Defeat DesertMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Relay Van Comp") && fighting_boss("DesertMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: PlantMan Omega",
    description = "Defeat PlantMan Omega in Hospital Comp 3 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Hospital Comp 3") && fighting_boss("PlantMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Composted",
    points = 10,
    description = "Defeat PlantMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Hospital Comp 3") && fighting_boss("PlantMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: FlameMan Omega",
    description = "Defeat FlameMan Omega in Undernet 3 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Undernet 3") && fighting_boss("FlameMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Defused",
    points = 10,
    description = "Defeat FlameMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Undernet 3") && fighting_boss("FlameMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: MistMan Omega",
    description = "Defeat MistMan Omega in the NetBattle Machine Comp as fast as you can!",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Corrupted Wish",
    points = 10,
    description = "Defeat MistMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: BowlMan Omega",
    description = "Defeat BowlMan Omega in the NetBattle Machine Comp as fast as you can!",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("BowlMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Perfect Game",
    points = 10,
    description = "Defeat BowlMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("BowlMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: DrillMan Omega",
    description = "Defeat DrillMan Omega in Undernet 5 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Undernet 5") && fighting_boss("DrillMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Unbreakable",
    points = 10,
    description = "Defeat DrillMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Undernet 5") && fighting_boss("DrillMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: ProtoMan Omega",
    description = "Defeat ProtoMan Omega in Hades Isle Area as fast as you can!",
    start  = no_glitches_enabled() && in_area("Hades Isle Area") && fighting_boss("ProtoMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "The End of a Rivalry",
    points = 10,
    description = "Defeat ProtoMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Hades Isle Area") && fighting_boss("ProtoMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: DarkMan Omega",
    description = "Defeat DarkMan Omega in Secret Area 1 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && fighting_boss("DarkMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Assassinating the Assassin",
    points = 10,
    description = "Defeat DarkMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Secret Area 1") && fighting_boss("DarkMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: JapanMan Omega",
    description = "Defeat JapanMan Omega in Secret Area 2 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && fighting_boss("JapanMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Conquest",
    points = 10,
    description = "Defeat JapanMan Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Secret Area 2") && fighting_boss("JapanMan Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: Serenade Omega",
    description = "Defeat Serenade Omega in Secret Area 3 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Broken Faith",
    points = 25,
    description = "Defeat Serenade Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade Omega") && s_ranked()
)

leaderboard(
    title = "Deletion Time: Bass Omega",
    description = "Defeat Bass Omega in Secret Area 3 as fast as you can!",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Bass Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

achievement(
    title = "Dream Destroyer",
    points = 25,
    description = "Defeat Bass Ω with an S Rank",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Bass Omega") && s_ranked()
)
