// Mega Man Battle Network 3: White Version
// #ID = 775

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
    0xAF: "Beastman Omega",
    0xB0: "BubbleMan",
    0xB1: "BubbleMan Alpha",
    0xB2: "BubbleMan Beta",
    0xB3: "Bubbleman Omega",
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
    0xBF: "Flameman Omega",
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
    0xCB: "Gutsman Omega",
    0xCC: "ProtoMan",
    0xCD: "ProtoMan Alpha",
    0xCE: "ProtoMan Beta",
    0xCF: "Protoman Omega",
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
    "BeastMan": 500,
    "GutsMan": 300,
    "GutsMan Alpha": 700
}

ShopArrays = {
    "ACDC Area 2": 0x00b5e0,
    "ACDC Square": 0x00b620,
    "SciLab Square": 0x00b6a0,
    "Yoka Square": 0x00b720
}

KeyItems = {
    "YaiCode": 0x009a12,
    "WrstBand": 0x0099f9
}

Jobs = [
    bit0(0x008300), // Transmission error
    bit1(0x008300), // Help me with my son!
    bit2(0x008300), // My Navi is sick
    bit3(0x008300), // Please deliver this
    bit7(0x008301), // Chip prices
]

MysteryData = {
    "ACDC Town": [
        bit6(0x008239), // HPMemory PMD (ACDC Town: Mayl's PC)
        bit7(0x008239), // 500 Zenny BMD (ACDC Town: Mayl's PC)
        bit6(0x00823a), // GutPunch B BMD (ACDC Town: Dex's PC)
        bit7(0x00823a), // 200 Zenny BMD (ACDC Town: Dex's PC)
        bit6(0x00823b), // RegUP2 BMD (ACDC Town: Yai's PC)
        bit7(0x00823b), // SideGun S BMD (ACDC Town: Yai's PC)
        bit3(0x008240), // RegUP1 BMD (ACDC Town: Blackboard Comp)
        bit7(0x008240), // Barrier BMD (ACDC Town: Doghouse Comp)
        bit2(0x008242), // HPMemory BMD (ACDC Town: School Server Comp)
        bit3(0x008242), // RockCube * BMD (ACDC Town: School Server Comp)
        bit7(0x008242), // Speader N BMD (ACDC Town: Control Panel Comp)
        bit3(0x008244), // Repair A BMD (ACDC Town: Yai's Phone Comp)
        
        // TODO: TV
        bit3(0x008248), // HPMemory BMD (ACDC: Sign Comp)
        bit6(0x0081d0), // MiniEnrg BMD (ACDC 1)
        bit7(0x0081d0), // WideSwrd L BMD (ACDC 1)
        bit6(0x0081d1), // 800Z BMD (ACDC 2)
        bit7(0x0081d1), // CopyDmg * BMD (ACDC 2)
        bit6(0x0081d2), // PanlOut3 * BMD (ACDC 3)
        bit7(0x0081d2), // LongSwrd E BMD (ACDC 3)
        // TODO: WWW
    ],
    "Principal's PC": [
        bit0(0x008208), // Recov10 * BMD (ACDC Town: Principle's PC 1)
        bit1(0x008208), // RegUp1 BMD (ACDC Town: Principle's PC 1)
        bit2(0x008208), // 600 Zennys BMD (ACDC Town: Principle's PC 1)
        bit3(0x008208), // Trap BMD (ACDC Town: Principle's PC 1)
        bit4(0x008208), // Trap BMD (ACDC Town: Principle's PC 1)
        bit5(0x008208), // KeydataC BMD (ACDC Town: Principle's PC 1)
        bit6(0x008208), // KeydataB BMD (ACDC Town: Principle's PC 1)
        bit7(0x008208), // KeydataA BMD (ACDC Town: Principle's PC 1)
        bit0(0x008209), // HPMemory BMD (ACDC Town: Principle's PC 2)
        bit1(0x008209), // Spreader P BMD (ACDC Town: Principle's PC 2)
        bit2(0x008209), // 1200 Zennys BMD (ACDC Town: Principle's PC 2)
        bit3(0x008209), // Trap BMD (ACDC Town: Principle's PC 2)
        bit4(0x008209), // Trap BMD (ACDC Town: Principle's PC 2)
        bit5(0x008209), // PasswrdC BMD (ACDC Town: Principle's PC 2)
        bit6(0x008209), // PasswrdB BMD (ACDC Town: Principle's PC 2)
        bit7(0x008209), // PasswrdA BMD (ACDC Town: Principle's PC 2)
    ],
    "SciLab": [
        bit2(0x008241), // BambSwrd N PMD (SciLab: Computer)
        bit3(0x008241), // 1000 Zenny BMD (SciLab: Computer)
        bit7(0x008241), // RegUp2 BMD (SciLab: Vending Comp)
        bit2(0x008249), // 700 Zenny BMD (SciLab: DoorSens Cmp)
        bit3(0x008249), // AirShoes * BMD (SciLab: DoorSens Cmp)
        bit7(0x0081d9), // RegUp2 BMD (SciLab 2)
        bit6(0x0081d9), // GrabBack A BMD (SciLab 2)
        bit7(0x0081d8), // Invis * BMD (SciLab 1)
        // TODO: WWW
    ],
    "Yoka": [
        bit3(0x008247), // Unlocker BMD (Yoka: Old TV Comp)
        bit7(0x008248), // SubMem BMD (Yoka: Armor Comp)
        bit6(0x00823c), // Snake D PMD (Yoka: Tamako's PC)
        bit7(0x00823c), // 900 Zennys BMD (Yoka: Tamako's PC)
        bit3(0x008246), // RegUp1 BMD (Yoka: Ticket Machine Comp)
        bit6(0x008249), // Geyser B PMD (Yoka: Alarm Comp)
        bit7(0x008249), // RegUP1 BMD (Yoka: Alarm Comp)
        bit7(0x0081e0), // Speed+1 BMD (Yoka 1)
    ],
    "Zoo Comp": [
        bit5(0x008210), // Geddon1 D BMD (Yoka: Zoo Comp 1)
        bit6(0x008210), // HPMemory BMD (Yoka: Zoo Comp 1)
        bit7(0x008210), // 1000 Zennys BMD (Yoka: Zoo Comp 1)
        bit5(0x008211), // Copydmg * BMD (Yoka: Zoo Comp 2)
        bit6(0x008211), // Charge+1 BMD (Yoka: Zoo Comp 2)
        bit7(0x008211), // 600 Zennys BMD (Yoka: Zoo Comp 2)
        bit4(0x008212), // Cannon C BMD (Yoka: Zoo Comp 3)
        bit5(0x008212), // SneakRun BMD (Yoka: Zoo Comp 3)
        bit6(0x008212), // 800 Zennys BMD (Yoka: Zoo Comp 3)
        bit7(0x008212), // Recov30 * BMD (Yoka: Zoo Comp 3)
        bit5(0x008213), // HP+100 BMD (Yoka: Zoo Comp 4)
        bit6(0x008213), // RegUp2 BMD (Yoka: Zoo Comp 4)
        bit7(0x008213), // Hammer T BMD (Yoka: Zoo Comp 4)
        
    ]
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

function buster_glitch() {
    return false // TODO
}

function hp_glitch() {
    return false // TODO
}

function custom_glitch() {
    return false // TODO
}

function bassgs_detected() {
    return false // TODO
}

function no_glitches_enabled() {
    return !buster_glitch() && !hp_glitch() && !custom_glitch() && !bassgs_detected()
}

function keyitem_obtained(name) {
    return prev(byte(KeyItems[name])) == 0 && byte(KeyItems[name]) == 1
}

function bitflag_flipped(bitflag) {
    return prev(bitflag) == 0 && bitflag == 1
}

function bitflag_count(bitflag) {
    return bitflag
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

function battle_won_under_time(secs) {
    return battle_time <= secs * 60
}

function shop_emptied(name) {
    return prev(dword(ShopArrays[name])) != 0 && dword(ShopArrays[name]) == 0
           && dword(ShopArrays[name] + 0x10) == 0 && dword(ShopArrays[name] + 0x14) == 0
           && dword(ShopArrays[name] + 0x18) == 0 && dword(ShopArrays[name] + 0x1c) == 0
}

achievement(
    title = "Warning: Read the Forum Post!", points = 0,
    description = "Without the proper save, you'll be locked out of some post-game content. You have been warned!",
    trigger = word(0x009884) == 514 &&
              (prev(bit3(0x008090)) + prev(bit4(0x008090)) + prev(bit5(0x008090)) + prev(bit0(0x008098)) +
              prev(bit1(0x008098)) + prev(bit2(0x008098)) + prev(bit3(0x008098)) + prev(bit4(0x008098)) +
              prev(bit7(0x008099))) == 8 &&
              (bit3(0x008090) + bit4(0x008090) + bit5(0x008090) + bit0(0x008098) + bit1(0x008098) + bit2(0x008098) +
              bit3(0x008098) + bit4(0x008098) + bit7(0x008099)) == 9
)

/////////////////////////
// Progressive Content //
/////////////////////////

achievement(
    title = "Everyone Starts Somewhere",
    points = 1,
    type = "progression",
    description = "Complete the SciLab tour and tutorial battle!",
    trigger = word(0x009884) == 1 && bit2(0x008090) == 1 && prev(bit3(0x008090)) == 1 && prev(bit4(0x008090)) == 1 &&
              prev(bit5(0x008090)) == 1 && bit3(0x008090) == 0 && bit4(0x008090) == 0 && bit5(0x008090) == 0
)

achievement(
    title = "An Online Quiz",
    points = 2,
    type = "progression",
    description = "Clear round 1 of the N1 Grand Prix!",
    trigger = no_glitches_enabled() && in_area("ACDC Square") && keyitem_obtained("YaiCode")
)

achievement(
    title = "Lights Out",
    points = 3,
    type = "progression",
    description = "Defeat FlashMan for the first time in the Principle's PC!",
    trigger = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") && boss_killed()
)

achievement(
    title = "Out Like a Flash",
    points = 3,
    type = "missable",
    description = "During the first fight with FlashMan, defeat him in under 20 seconds!",
    trigger = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") 
              && battle_won_under_time(20) && trigger_when(boss_killed())
)

achievement(
    title = "Stress Relief",
    points = 2,
    type = "missable",
    description = "Defeat GutsMan in the park at night, after beating FlashMan!",
    trigger = no_glitches_enabled() && in_area("ACDC Town") && fighting_boss("GutsMan") && boss_killed()
)

achievement(
    title = "The Guts to Lie",
    points = 3,
    type="missable",
    description = "Defeat GutsMan α to show who the best ACDC netbattler is!",
    trigger = no_glitches_enabled() && in_area("ACDC Town") && fighting_boss("GutsMan Alpha") && boss_killed()
)

achievement(
    title = "A Gambler's Reflection",
    points = 3,
    description = "Bankrupt the gambler in the SciLab Vending Machine Comp!",
    // I used a zenny check here, since it's the only way to get that much in this area,
    // and the bitflag for this is a bit unreliable (might be reused / area dependent)
    trigger = no_glitches_enabled() && in_area("SciLab Vending Machine Comp") && (zenny - prev(zenny)) == 6400
)

achievement(
    title = "Ripping Claws",
    points = 4,
    type = "progression",
    description = "Defeat BeastMan for the first time in the Zoo Comp!",
    trigger = no_glitches_enabled() && in_area("Zoo Comp 4") && fighting_boss("BeastMan") && boss_killed()
)

achievement(
    title = "The Japan-Exclusive Promotional Item",
    points = 1,
    description = "Obtain Mr. Famous' personal wristband!",
    trigger = no_glitches_enabled() && in_area("Higsby's") && keyitem_obtained("WrstBand")
)

/////////////////
// Other Tasks //
/////////////////

achievement(
    title = "Helpful Hikari",
    points = 10,
    description = "Complete all of the jobs on the Job BBS!",
    trigger = no_glitches_enabled()
              && prev(sum_of(Jobs, bitflag_count)) == length(Jobs) - 1
              && measured(sum_of(Jobs, bitflag_count) == length(Jobs))
)

////////////////////
// Data Collector //
////////////////////

achievement(
    title = "Principal's PC: Data Collector",
    points = 2,
    description = "Collect all of the Blue Mystery Data in the Principal's PC!",
    trigger = no_glitches_enabled() && (in_area("Principal's PC 1") || in_area("Principal's PC 2"))
              && prev(sum_of(MysteryData["Principal's PC"], bitflag_count)) == length(MysteryData["Principal's PC"]) - 1
              && measured(sum_of(MysteryData["Principal's PC"], bitflag_count) == length(MysteryData["Principal's PC"]))
)

achievement(
    title = "ACDC: Data Collector",
    points = 3,
    description = "Collect all of the Blue and Purple Mystery Data throughout ACDC Town and ACDC Area!",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["ACDC Town"], bitflag_count)) == length(MysteryData["ACDC Town"]) - 1
              && measured(sum_of(MysteryData["ACDC Town"], bitflag_count) == length(MysteryData["ACDC Town"]))
)

achievement(
    title = "SciLab: Data Collector",
    points = 1,
    description = "Collect all of the Blue and Purple Mystery Data throughout the SciLab building and SciLab Area!",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["SciLab"], bitflag_count)) == length(MysteryData["SciLab"]) - 1
              && measured(sum_of(MysteryData["SciLab"], bitflag_count) == length(MysteryData["SciLab"]))
)

achievement(
    title = "Yoka: Data Collector",
    points = 2,
    description = "Collect all of the Blue and Purple Mystery Data throughout Yoka and Yoka Area!",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Yoka"], bitflag_count)) == length(MysteryData["Yoka"]) - 1
              && measured(sum_of(MysteryData["Yoka"], bitflag_count) == length(MysteryData["Yoka"]))
)

achievement(
    title = "Zoo Comp: Data Collector",
    points = 2,
    description = "Collect all of the Blue Mystery Data throughout the Zoo Comp!",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Zoo Comp"], bitflag_count)) == length(MysteryData["Zoo Comp"]) - 1
              && measured(sum_of(MysteryData["Zoo Comp"], bitflag_count) == length(MysteryData["Zoo Comp"]))
)

/////////////////////
// Shopping Spree  //
/////////////////////

achievement(
    title = "ACDC 2: Shopping Spree",
    points = 1,
    description = "Empty out the shop in ACDC 2!",
    trigger = no_glitches_enabled() && in_area("ACDC Area 2") && shop_emptied("ACDC Area 2")
)

achievement(
    title = "ACDC Square: Shopping Spree", points = 1,
    description = "Empty out the shop in ACDC Square!",
    trigger = no_glitches_enabled() && in_area("ACDC Square") && shop_emptied("ACDC Square")
)

achievement(
    title = "SciLab Square: Shopping Spree", points = 2,
    description = "Empty out the shop in SciLab Square!",
    trigger = no_glitches_enabled() && in_area("SciLab Square") && shop_emptied("SciLab Square")
)

achievement(
    title = "Yoka Square: Shopping Spree", points = 2,
    description = "Empty out the shop in Yoka Square!",
    trigger = no_glitches_enabled() && in_area("Yoka Square") && shop_emptied("Yoka Square")
)

//////////////////
// Leaderboards //
//////////////////

leaderboard(
    title = "Deletion Time: FlashMan",
    description = "Defeat FlashMan in the Principal's PC as fast as you can!",
    start  = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BeastMan",
    description = "Defeat BeastMan in the Zoo Comp as fast as you can!",
    start  = no_glitches_enabled() && in_area("Zoo Comp 4") && fighting_boss("BeastMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlashMan Beta",
    description = "Defeat FlashMan Beta in ACDC Area 2 as fast as you can!",
    start  = no_glitches_enabled() && in_area("ACDC Area 2") && fighting_boss("FlashMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

///////////////////
// Rich Presence //
///////////////////

//rich_presence_conditional_display(
//    buster_glitch(),
//    "Buster glitch detected! Achievements have been disabled."
//)

//rich_presence_conditional_display(
//    hp_glitch(),
//    "HP glitch detected! Achievements have been disabled."
//)

//rich_presence_conditional_display(
//    custom_glitch(),
//    "Custom glitch detected! Achievements have been disabled."
//)

//rich_presence_conditional_display(
//    bassgs_detected(),
//    "BassGS chip detected! Achievements have been disabled."
//)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0  && enemy_2_id != 0  && enemy_3_id != 0,
    "In battle against {3}, {4} and {5} | {0} | HP: {1}/{2} | Zenny: {6}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_3_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny)
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0  && enemy_2_id != 0,
    "In battle against {3} and {4} | {0} | HP: {1}/{2} | Zenny: {5}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny)
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0,
    "In battle against {3} | {0} | HP: {1}/{2} | Zenny: {4}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny)
)

rich_presence_display(
    "Exploring {0} | HP: {1}/{2} | Zenny: {3}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_hp),
    rich_presence_value("Number", player_max_hp),
    rich_presence_value("Number", zenny)
)
