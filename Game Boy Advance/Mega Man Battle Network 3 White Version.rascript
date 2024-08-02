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
    0x0601: "Staff Lounge 2",
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

ShopArrays = {
    "ACDC Area 2": 0x00b5e0,
    "ACDC Square": 0x00b620,
    "SciLab Square": 0x00b6a0,
    "Higsby's": 0x00ba60,
    "Yoka 1": 0x00b6e0,
    "Yoka Square": 0x00b720,
    "Beach Square": 0x00b7e0,
    "Beach Square Program": 0x00b820,
    "Undernet 2": 0x00b860,
    "Under Square": 0x00b920,
    "Under Square Program": 0x00b960,
    "Undernet 4": 0x00b8a0,
    "Undernet 6": 0x00b8e0,
    "Secret Area 2": 0x00b9a0
}

KeyItems = {
    "YaiCode": 0x009a12,
    "SpinWht": 0x009a07,
    "SpinPink": 0x009a08,
    "SpinYllw": 0x009a09,
    "SpinRed": 0x009a0a,
    "SpinBlue": 0x009a0b,
    "SpinGrn": 0x009a0c,
    "SpinOrng": 0x009a0d,
    "SpinPrpl": 0x009a0e,
    "SpinDark": 0x009a0f,
    "WrstBand": 0x0099f9
}

Spinners = [
    "SpinWht",
    "SpinPink",
    "SpinYllw",
    "SpinRed",
    "SpinBlue",
    "SpinGrn",
    "SpinOrng",
    "SpinPrpl",
    "SpinDark",
]

Jobs = [
    bit0(0x008300), // Transmission error
    bit1(0x008300), // Help me with my son!
    bit2(0x008300), // My Navi is sick
    bit3(0x008300), // Please deliver this
    bit4(0x008300), // Gathering data (Tora)
    bit5(0x008300), // Riot stopped (Tora)
    bit6(0x008300), // Stuntmen wanted! (Tora)
    bit7(0x008300), // Look for friends (Tora)
    bit0(0x008301), // Help with rehab
    bit1(0x008301), // Looking for condor
    bit2(0x008301), // Somebody, please help!
    bit3(0x008301), // Will you deliver?
    bit4(0x008301), // Be my boyfriend!
    bit5(0x008301), // Rare chips for cheap!
    bit6(0x008301), // I'm broke!
    bit7(0x008301), // Chip prices
    bit0(0x008302), // Stamp collecting
    bit1(0x008302), // Give your support!
    bit2(0x008302), // Finding the blue Navi
    bit3(0x008302), // Hide and seek!
    bit4(0x008302), // Legendary Tomes
    bit5(0x008302), // Please adopt a virus!
    bit6(0x008302), // Catching gang members
    bit7(0x008302), // Old Master
    bit7(0x008303), // Help with a will
]

Trades = [
    bit0(0x008162), // TV Station Hall 2F, WideSwrd C for Recov120 S
    bit2(0x008162), // Hotel Front, FireSwrd P for IceStage *
    bit3(0x008162), // Class 5-B, Bubbler C for WideSwrd C
    bit4(0x008162), // Staff Lounge, SonicWav W for ElecSwrd P
    bit1(0x008163), // Beach, Shadow J for AntiSwrd Y
    bit2(0x008163), // Hospital, DynaWave V for GrabBack K
    bit4(0x008163), // SciLab, Shake1 S for VarSwrd B
    bit6(0x008163), // ACDC, Recov120 S for DynaWave V
    bit4(0x008164), // TV Station Editing Room, HoleMetr H for Rook F
    bit7(0x008164), // Four Hades, GrabBack K for ZeusHamr Z
]

Quizzes = [
    bit0(0x00805f), // Quiz King (Hades)
    bit1(0x00805f), // Quiz Queen (Hospital)
    bit2(0x00805f), // QuizMaster (Yoka)
    bit3(0x00805f), // Mr. Quiz (Yoka)
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
        bit3(0x008248), // HPMemory BMD (ACDC: Sign Comp)
        bit5(0x0081d0), // Panic C PMD (ACDC 1)
        bit6(0x0081d0), // MiniEnrg BMD (ACDC 1)
        bit7(0x0081d0), // WideSwrd L BMD (ACDC 1)
        bit6(0x0081d1), // 800Z BMD (ACDC 2)
        bit7(0x0081d1), // CopyDmg * BMD (ACDC 2)
        bit6(0x0081d2), // PanlOut3 * BMD (ACDC 3)
        bit7(0x0081d2), // LongSwrd E BMD (ACDC 3)
        bit6(0x008247), // RegUP2 in Tank
        bit7(0x008247), // HPMemory in Tank
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
        bit6(0x0081d8), // CustSwrd Z BMD (SciLab 1)
        bit7(0x0081d8), // Invis * BMD (SciLab 1)
        bit7(0x0081d9), // RegUp2 BMD (SciLab 2)
        bit6(0x0081d9), // GrabBack A BMD (SciLab 2)
    ],
    "Yoka": [
        bit3(0x008247), // Unlocker BMD (Yoka: Old TV Comp)
        bit7(0x008248), // SubMem BMD (Yoka: Armor Comp)
        bit6(0x00823c), // Snake D PMD (Yoka: Tamako's PC)
        bit7(0x00823c), // 900 Zennys BMD (Yoka: Tamako's PC)
        bit3(0x008246), // RegUp1 BMD (Yoka: Ticket Machine Comp)
        bit6(0x008249), // Geyser B PMD (Yoka: Alarm Comp)
        bit7(0x008249), // RegUP1 BMD (Yoka: Alarm Comp)
        bit5(0x0081e0), // Prism Q BMD (Yoka 1)
        bit6(0x0081e0), // Tornado L PMD (Yoka 1)
        bit7(0x0081e0), // Speed+1 BMD (Yoka 1)
        bit6(0x0081e1), // HPMemory BMD (Yoka 2)
        bit7(0x0081e1), // FullEnrg BMD (Yoka 2)
        bit5(0x00824b), // Fire+30 * BMD (Yoka: Hot Springs Lion Comp)
    ],
    "Beach": [
        bit3(0x008243), // FireRatn H BMD (Beach Town: NetBattle Machine Comp)
        bit7(0x008243), // HP+100 BMD (Beach Town: Relay Van Comp)
        bit6(0x008244), // RegUP1 BMD (Beach Town: TV Station Control Panel Comp)
        bit7(0x008244), // Atk+1 PMD (Beach Town: TV Station Control Panel Comp)
        bit0(0x00824b), // Jealousy J PMD (Beach Town: Editing Equipment Comp)
        bit1(0x00824b), // HPMemory BMD (Beach Town: Editing Equipment Comp)
        bit6(0x0081e8), // SpinPink PMD (Beach 1)
        bit7(0x0081e8), // Charge+1 BMD (Beach 1)
        bit6(0x0081e9), // RegUP3 BMD (Beach 2)
        bit7(0x0081e9), // Recov50 G BMD (Beach 2)
        bit5(0x0081eb), // BlkBomb1 P BMD (Hades Isle Area)
        bit6(0x0081eb), // HadesKey BMD (Hades Isle Area)
        bit3(0x00824b), // WeapLV+1 BMD (Hades Isle: Demon Statue Comp)
    ],
    "Hospital": [
        bit5(0x008218), // Recov120 O BMD (Beach: Hospital Comp 1)
        bit6(0x008218), // RegUp1 BMD (Beach: Hospital Comp 1)
        bit7(0x008218), // OilBody BMD (Beach: Hospital Comp 1)
        bit5(0x008219), // GutStrgt Q BMD (Beach: Hospital Comp 2)
        bit6(0x008219), // HPMemory BMD (Beach: Hospital Comp 2)
        bit7(0x008219), // Atk+1 BMD (Beach: Hospital Comp 2)
        bit5(0x00821a), // SubMem BMD (Beach: Hospital Comp 3)
        bit6(0x00821a), // 1600 Zenny BMD (Beach: Hospital Comp 3)
        bit7(0x00821a), // HeatSide T BMD (Beach: Hospital Comp 3)
        bit5(0x00821b), // 2000 Zennys BMD (Beach: Hospital Comp 4)
        bit6(0x00821b), // Barr100 E BMD (Beach: Hospital Comp 4)
        bit7(0x00821b), // FullEnrg BMD (Beach: Hospital Comp 4)
        bit5(0x00821c), // Charge+1 BMD (Beach: Hospital Comp 5)
        bit6(0x00821c), // HPMemory BMD (Beach: Hospital Comp 5)
        bit7(0x00821c), // FireSwrd R BMD (Beach: Hospital Comp 5)
        bit7(0x008246), // 9000 Zennys BMD (Hospital: Vending Machine Comp)
        bit3(0x008245), // RegUp2 BMD (Hospital: Bed Comp)
        bit7(0x008245), // Recov120 * BMD (Hospital: TV Comp)
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
    ],
    "Undernet": [
        bit6(0x0081f0), // HP+200 BMD (Undernet 1)
        bit7(0x0081f0), // 1200 Zennys BMD (Undernet 1)
        bit6(0x0081f1), // BlkBomb2 S BMD (Undernet 2)
        bit7(0x0081f1), // RegUP2 BMD (Undernet 2)
        bit6(0x0081f2), // Lance S BMD (Undernet 3)
        bit7(0x0081f2), // HPMemory BMD (Undernet 3)
        bit6(0x0081f3), // Recov200 N BMD (Undernet 4)
        bit5(0x0081f3), // StepSwrd M BMD (Undernet 4)
        bit7(0x0081f3), // Speed+1 BMD (Undernet 4)
        
    ],
    "Deepweb": [
        bit6(0x0081f4), // SandStge C BMD (Undernet 5)
        bit7(0x0081f4), // HPMemory BMD (Undernet 5)
        bit7(0x0081f5), // SubMem BMD (Undernet 6)
        bit5(0x0081f5), // WeapLV+1 BMD (Undernet 6)
        bit6(0x0081f5), // Aura F BMD (Undernet 6)
        bit7(0x0081f6), // GutImpct J BMD (Undernet 7)
        bit5(0x0081f6), // Guardian O BMD (Undernet 7)
        bit6(0x0081f6), // HPMemory BMD (Undernet 7)
        bit0(0x0081f6), // Hammer BMD (Undernet 7)
        bit4(0x0081f6), // GigFldr1 PMD (Undernet 7)
    ],
    "WWW": [
        bit7(0x00824a), // Collect BMD (WWW: Outer Wall Comp)
        bit4(0x008220), // HPMemory BMD (WWW Comp 1)
        bit6(0x008220), // 1800 Zennys BMD (WWW Comp 1)
        bit5(0x008220), // Recov150 P BMD (WWW Comp 1)
        bit7(0x008220), // ID-DataA BMD (WWW Comp 1)
        bit6(0x008221), // RegUP2 BMD (WWW Comp 2)
        bit5(0x008221), // 3000 Zennys BMD (WWW Comp 2)
        bit7(0x008221), // ID-DataB BMD (WWW Comp 2)
        bit6(0x008222), // Jungle BMD (WWW Comp 3)
        bit7(0x008222), // ID-DataC BMD (WWW Comp 3)
        bit5(0x008222), // FullEnrg BMD (WWW Comp 3)
        bit5(0x008223), // 1400 Zennys BMD (WWW Comp 4)
        bit7(0x008223), // ID-DataD BMD (WWW Comp 4)
        bit6(0x008223), // HPMemory BMD (WWW Comp 4)
    ],
    "Secret Area": [
        bit7(0x008200), // Geddon3 U BMD (Secret Area 1)
        bit5(0x008200), // 50000 Zenny BMD (Secret Area 1)
        bit6(0x008200), // StepCros R BMD (Secret Area 1)
        bit7(0x008201), // HP+500 BMD (Secret Area 2)
        bit6(0x008201), // AntiNavi M BMD (Secret Area 2)
        bit5(0x008201), // HPMemory BMD (Secret Area 2)
        bit6(0x008202), // Snctuary C BMD (Secret Area 3)
        bit7(0x008202), // Hole * BMD (Secret Area 3)
        bit5(0x008202), // HubBatc BMD (Secret Area 3)
    ]
}

TimeTrialRecords = {
    "FlashMan": 0x009280,
    "BeastMan": 0x009288,
    "BubbleMan": 0x009290,
    "DesertMan": 0x009298,
    "PlantMan": 0x0092a0,
    "FlameMan": 0x0092a8,
    "DrillMan": 0x0092b0,
    "GutsMan": 0x0092b8,
    "MetalMan": 0x0092c0,
    "KingMan": 0x0092c8,
    "MistMan": 0x0092d0,
    "DarkMan": 0x0092d8,
    "JapanMan": 0x0092e0,
    "ProtoMan": 0x0092e8
}

TimeTrialBeats = {}
for navi in TimeTrialRecords {
    TimeTrialBeats[navi] = byte(TimeTrialRecords[navi] + 4)
}

MegaChips = [
    bit6(0x008349),
    bit5(0x008349),
    bit4(0x008349),
    bit3(0x008349),
    bit2(0x008349),
    bit1(0x008349),
    bit0(0x008349),
    bit7(0x00834a),
    bit6(0x00834a),
    bit5(0x00834a),
    bit4(0x00834a),
    bit3(0x00834a),
    bit2(0x00834a),
    bit1(0x00834a),
    bit0(0x00834a),
    bit7(0x00834b),
    bit6(0x00834b),
    bit5(0x00834b),
    bit4(0x00834b),
    bit3(0x00834b),
    bit2(0x00834b),
    bit1(0x00834b),
    bit0(0x00834b),
    bit7(0x00834c),
    bit6(0x00834c),
    bit4(0x00834c),
    bit3(0x00834c),
    bit2(0x00834c),
    bit1(0x00834c),
    bit7(0x00834d),
    bit6(0x00834d),
    bit5(0x00834d),
    bit4(0x00834d),
    bit2(0x00834d),
    bit1(0x00834d),
    bit0(0x00834d),
    bit7(0x00834e),
    bit5(0x00834e),
    bit4(0x00834e),
    bit3(0x00834e),
    bit2(0x00834e),
    bit0(0x00834e),
    bit7(0x00834f),
    bit6(0x00834f),
    bit5(0x00834f),
    bit3(0x00834f),
    bit2(0x00834f),
    bit1(0x00834f),
    bit0(0x00834f),
    bit6(0x008350),
    bit5(0x008350),
    bit4(0x008350),
    bit3(0x008350),
    bit1(0x008350),
    bit0(0x008350),
    bit7(0x008351),
    bit6(0x008351),
    bit4(0x008351),
    bit3(0x008351),
    bit2(0x008351),
    bit1(0x008351),
    bit6(0x008352),
    bit5(0x008352),
    bit4(0x008352),
    bit3(0x008352),
    bit2(0x008352),
    bit1(0x008352),
    bit0(0x008352),
    bit7(0x008353),
    bit5(0x008353),
    bit4(0x008353),
    bit3(0x008353),
    bit2(0x008353),
    bit0(0x008353),
    bit7(0x008354),
    bit6(0x008354),
    bit5(0x008354),
    bit3(0x008354),
    bit2(0x008354),
    bit1(0x008354),
    bit0(0x008354),
    bit6(0x008355),
    bit5(0x008355),
    bit4(0x008355),
    bit3(0x008355),
]

V5Chips = [
    bit5(0x00834c),
    bit0(0x00834c),
    bit3(0x00834d),
    bit6(0x00834e),
    bit1(0x00834e),
    bit4(0x00834f),
    bit7(0x008350),
    bit2(0x008350),
    bit5(0x008351),
    bit0(0x008351),
    bit6(0x008353),
    bit1(0x008353),
    bit4(0x008354),
    bit7(0x008355),
    bit2(0x008355)
]

GigaChips = [
    bit3(0x008356),
    bit4(0x008356),
    bit5(0x008356),
    bit6(0x008356),
    bit7(0x008356)
]

for c in V5Chips {
    array_push(GigaChips, c)
}

ProgramAdvances = [
    bit7(0x008358),
    bit6(0x008358),
    bit5(0x008358),
    bit4(0x008358),
    bit3(0x008358),
    bit2(0x008358),
    bit1(0x008358),
    bit0(0x008358),
    bit7(0x008359),
    bit6(0x008359),
    bit5(0x008359),
    bit4(0x008359),
    bit3(0x008359),
    bit2(0x008359),
    bit1(0x008359),
    bit0(0x008359),
    bit7(0x00835a),
    bit6(0x00835a),
    bit5(0x00835a),
    bit4(0x00835a),
    bit3(0x00835a),
    bit2(0x00835a),
    bit1(0x00835a),
    bit0(0x00835a),
    bit7(0x00835b),
    bit6(0x00835b),
    bit5(0x00835b),
    bit4(0x00835b),
    bit3(0x00835b),
    bit2(0x00835b),
    bit1(0x00835b),
    bit0(0x00835b),
]

VirusBreederRegulars = [
    bit5(0x008302), // Bunny (job)
    bit0(0x008166), // Jelly
    bit1(0x008166), // Mushy
    bit2(0x008166), // Spikey
    bit3(0x008166), // Swordy
    bit5(0x008166), // Mettaur
    bit4(0x008167), // Scuttzer and Scuttlest
    bit5(0x008167), // Scuttle Trio
    bit6(0x008167), // Momogra
    bit7(0x008167), // KillerEye
]

VirusBreederOmegas = [
    bit0(0x008167), // Spikey
    bit1(0x008167), // Swordy
    bit2(0x008167), // Bunny
    bit3(0x008167), // Mettaur
    bit3(0x008168), // Scuttle
    bit4(0x008168), // Momogra
    bit5(0x008168), // KillerEye
    bit6(0x008168), // Jelly
    bit7(0x008168), // Mushy
]

// Overworld variables
map_id = word(0x009884)
player_hp = word(0x0098a0)
player_max_hp = word(0x0098a2)
zenny = dword(0x0098f4)
bugfrags = dword(0x0098f8)
style_level = byte(0x009895) + 1

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

function keyitem_obtained(name) {
    return prev(byte(KeyItems[name])) == 0 && byte(KeyItems[name]) == 1
}

function bitflag_flipped(bitflag) {
    return prev(bitflag) == 0 && bitflag == 1
}

function bitflag_count(bitflag) {
    return bitflag
}

function has_key_item(name) {
    return bit0(KeyItems[name])
}

function in_area(name) {
    return map_id == AreaNameToID[name]
}

function fighting_boss(name) {
    return enemy_1_id == EnemyNameToID[name] && enemy_1_max_hp == EnemyHPLookup[name]
}

function last_boss_fought(name) {
    return enemy_1_id == EnemyNameToID[name]
}

function boss_killed() {
    return prev(enemy_1_hp) > 0 && enemy_1_hp == 0
}

function battle_won_under_time(secs) {
    return battle_time <= secs * 60
}

function s_ranked() {
    return prev(busting_level) == 0 && busting_level >= 0x0b && busting_level < 0x10
}

function time_trial_beaten(navi) {
    return once(TimeTrialBeats[navi] == 0x00)
}

function time_trial_unbeaten(navi) {
    return prev(TimeTrialBeats[navi]) == 0xEC
}

function one_time_trial_unbeaten(navis) {
    return any_of(navis, time_trial_unbeaten)
}

function all_time_trials_beaten(navis) {
    return all_of(navis, time_trial_beaten)
}

function new_time_trial_record(navi) {
    return dword(TimeTrialRecords[navi]) < prev(dword(TimeTrialRecords[navi]))
}


function shop_emptied(name) {
    return prev(dword(ShopArrays[name])) != 0 && dword(ShopArrays[name]) == 0
           && dword(ShopArrays[name] + 0x10) == 0 && dword(ShopArrays[name] + 0x14) == 0
           && dword(ShopArrays[name] + 0x18) == 0 && dword(ShopArrays[name] + 0x1c) == 0
}

achievement(
    title = "Warning: Read the Forum Post!", points = 0,
    description = "Without the proper save, you'll be locked out of some post-game content. Several common glitches are blocked.",
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
    description = "Complete the SciLab tour and tutorial battle",
    trigger = word(0x009884) == 1 && bit2(0x008090) == 1 && prev(bit3(0x008090)) == 1 && prev(bit4(0x008090)) == 1 &&
              prev(bit5(0x008090)) == 1 && bit3(0x008090) == 0 && bit4(0x008090) == 0 && bit5(0x008090) == 0
)

achievement(
    title = "An Online Quiz",
    points = 2,
    type = "progression",
    description = "Clear round 1 of the N1 Grand Prix",
    trigger = no_glitches_enabled() && in_area("ACDC Square") && keyitem_obtained("YaiCode")
)

achievement(
    title = "Lights Out",
    points = 3,
    type = "progression",
    description = "Defeat FlashMan and break the hypnosis",
    trigger = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") && boss_killed()
)

achievement(
    title = "Out Like a Flash",
    points = 5,
    type = "missable",
    description = "Defeat FlashMan in under 20 seconds during your first encounter",
    trigger = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") 
              && battle_won_under_time(20) && trigger_when(boss_killed())
)

achievement(
    title = "Stress Relief",
    points = 2,
    type = "missable",
    description = "Defeat GutsMan in the park at night after beating FlashMan",
    trigger = no_glitches_enabled() && in_area("ACDC Town") && fighting_boss("GutsMan") && boss_killed()
)

achievement(
    title = "The Guts to Lie",
    points = 3,
    type="missable",
    description = "Defeat GutsMan α to show who the best ACDC netbattler is ",
    trigger = no_glitches_enabled() && in_area("ACDC Town") && fighting_boss("GutsMan Alpha") && boss_killed()
)

achievement(
    title = "A Gambler's Reflection",
    points = 3,
    description = "Bankrupt the gambling Navi in the SciLab Vending Machine Comp",
    // I used a zenny check here, since it's the only way to get that much in this area,
    // and the bitflag for this is a bit unreliable (might be reused / area dependent)
    trigger = no_glitches_enabled() && in_area("SciLab Vending Machine Comp") && (zenny - prev(zenny)) == 6400
)

achievement(
    title = "Crushing Gears",
    type = "missable",
    points = 3,
    description = "Defeat MetalMan during your trip to Yoka Zoo",
    trigger = no_glitches_enabled() && in_area("Hotel Front") && fighting_boss("MetalMan") && boss_killed()
)

achievement(
    title = "Ripping Claws",
    points = 5,
    type = "progression",
    description = "Defeat BeastMan and restore order to Yoka Zoo",
    trigger = no_glitches_enabled() && in_area("Zoo Comp 4") && fighting_boss("BeastMan") && boss_killed()
)

achievement(
    title = "The Japan-Exclusive Promotional Item",
    points = 1,
    description = "Obtain Mr. Famous' personal wristband",
    trigger = no_glitches_enabled() && in_area("Higsby's") && keyitem_obtained("WrstBand")
)

achievement(
    title = "CyberSimon Says: Round 1",
    points = 1,
    description = "Win a game of CyberSimon Says in Yoka Square",
    trigger = no_glitches_enabled() && in_area("Yoka Square") && prev(cybersimon_says) == 59 && cybersimon_says == 60
)

achievement(
    title = "All Washed Up",
    points = 5,
    type = "progression",
    description = "Defeat BubbleMan and end the dishwasher crisis",
    trigger = no_glitches_enabled() && in_area("Yoka Area 1") && fighting_boss("BubbleMan") && boss_killed()
)

achievement(
    title = "CyberSimon Says: Round 2",
    points = 2,
    description = "Win a game of CyberSimon Says in Beach Square",
    trigger = no_glitches_enabled() && in_area("Beach Square") && prev(cybersimon_says) == 89 && cybersimon_says == 90
)

achievement(
    title = "By the Book",
    points = 4,
    type = "missable",
    description = "Defeat KingMan in the TV Station Lobby before defeating DesertMan",
    trigger = no_glitches_enabled() && in_area("TV Station Lobby") && fighting_boss("KingMan") && boss_killed()
)

achievement(
    title = "Quicksand",
    points = 5,
    type = "progression",
    description = "Defeat DesertMan to put an end to the N1 Grand Prix",
    trigger = no_glitches_enabled() && in_area("TV Station Editing Room") && fighting_boss("DesertMan") && boss_killed()
)

achievement(
    title = "Overgrown",
    points = 10,
    type = "progression",
    description = "Defeat PlantMan and restore Seaside Hospital's power",
    trigger = no_glitches_enabled() && in_area("Hospital Comp 5") && fighting_boss("PlantMan") && boss_killed()
)

achievement(
    title = "Triple Cut",
    points = 3,
    description = "Bankrupt the gambling Navi in the TV Station Control Panel Comp",
    // I used a zenny check here, since it's the only way to get that much in this area,
    // and the bitflag for this is a bit unreliable (might be reused / area dependent)
    trigger = no_glitches_enabled() && in_area("TV Station Control Panel Comp") && (zenny - prev(zenny)) == 40500
)

achievement(
    title = "An After-Gamble Brawl",
    points = 5,
    description = "Bankrupt the gambling Navi in the Hospital Vending Machine Comp",
    // I used a zenny check here, since it's the only way to get that much in this area,
    // and the bitflag for this is a bit unreliable (might be reused / area dependent)
    trigger = no_glitches_enabled() && in_area("Hospital Vending Machine Comp") && (zenny - prev(zenny)) == 256000
)

achievement(
    title = "Birthday Party",
    points = 10,
    type = "progression",
    description = "Defeat FlameMan to cool down the Net",
    trigger = no_glitches_enabled() && in_area("Undernet 3") && fighting_boss("FlameMan") && boss_killed()
)

achievement(
    title = "CyberSimon Says: Final Round",
    points = 3,
    description = "Win a game of CyberSimon Says in Under Square",
    trigger = no_glitches_enabled() && in_area("Under Square") && prev(cybersimon_says) == 98 && cybersimon_says == 99
)

achievement(
    title = "Make a Wish",
    points = 5,
    type = "progression",
    description = "Defeat MistMan and claim #2 in the Undernet Ranking",
    trigger = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan") && boss_killed()
)

achievement(
    title = "Spiraling Out of Control",
    points = 10,
    type = "progression",
    description = "Defeat DrillMan after following the trail in the Undernet",
    trigger = no_glitches_enabled() && in_area("Undernet 5") && fighting_boss("DrillMan") && boss_killed()
)

achievement(
    title = "Absorb This!",
    points = 25,
    type = "win_condition",
    description = "Defeat Alpha and save the world",
    trigger = no_glitches_enabled() && in_area("Alpha") && fighting_boss("Alpha") && boss_killed()
)

achievement(
    title = "Long-Time Rivalry",
    points = 5,
    description = "Defeat ProtoMan on Hades Isle",
    trigger = no_glitches_enabled() && in_area("Eternal Hades") && fighting_boss("ProtoMan") && boss_killed()
)

achievement(
    title = "Elemental Edgelord",
    points = 10,
    description = "Defeat DarkMan and survive the assassination attempt",
    trigger = no_glitches_enabled() && in_area("Secret Area 1") && fighting_boss("DarkMan") && boss_killed()
)

achievement(
    title = "Thousand Spears",
    points = 10,
    description = "Defeat JapanMan and avoid being turned into a shish-kebab",
    trigger = no_glitches_enabled() && in_area("Secret Area 2") && fighting_boss("JapanMan") && boss_killed()
)

achievement(
    title = "Mercy Killing",
    points = 25,
    description = "Defeat Serenade and claim the title of UnderKing",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade") && boss_killed()
)

achievement(
    title = "In Power We Trust",
    points = 25,
    description = "Defeat BassGS to prove your bond",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("BassGS") && boss_killed()
)

time_trial_navis_1 = ["FlashMan", "BeastMan", "BubbleMan", "DesertMan"]
achievement(
    title = "Lights, Claws, Soap, and Sand",
    points = 25,
    description = "Beat Serenade's record on the timed battles for FlashMan, BeastMan, BubbleMan and DesertMan",
    trigger = no_glitches_enabled()
           && title_screen_check
           && in_area("Secret Area 1")
           && never(!one_time_trial_unbeaten(time_trial_navis_1))
           && measured(tally(4, array_map(time_trial_navis_1, time_trial_beaten)))
)

time_trial_navis_2 = ["PlantMan", "FlameMan", "DrillMan"]
achievement(
    title = "Vines, Embers, and Holes",
    points = 25,
    description = "Beat Serenade's record on the timed battles for PlantMan, FlameMan, and DrillMan",
    trigger = no_glitches_enabled()
           && title_screen_check
           && in_area("Secret Area 1")
           && never(!one_time_trial_unbeaten(time_trial_navis_2))
           && measured(tally(3, array_map(time_trial_navis_2, time_trial_beaten)))
)

time_trial_navis_3 = ["GutsMan", "MetalMan", "KingMan", "MistMan"]
achievement(
    title = "Fists, Gears, Pawns and Wishes",
    points = 25,
    description = "Beat Serenade's record on the timed battles for GutsMan, MetalMan, KingMan, and MistMan",
    trigger = no_glitches_enabled()
           && title_screen_check
           && in_area("Secret Area 2")
           && never(!one_time_trial_unbeaten(time_trial_navis_3))
           && measured(tally(4, array_map(time_trial_navis_3, time_trial_beaten)))
)

time_trial_navis_4 = ["DarkMan", "JapanMan", "ProtoMan"]
achievement(
    title = "Bats, Spears, and Swords",
    points = 25,
    description = "Beat Serenade's record on the timed battles for DarkMan, JapanMan, and ProtoMan",
    trigger = no_glitches_enabled()
           && title_screen_check
           && in_area("Secret Area 3")
           && never(!one_time_trial_unbeaten(time_trial_navis_4))
           && measured(tally(3, array_map(time_trial_navis_4, time_trial_beaten)))
)

achievement(
    title = "Living up to the Name",
    points = 25,
    description = "Collect all 85 Mega Chips",
    trigger = no_glitches_enabled()
              && prev(sum_of(MegaChips, bitflag_count)) == length(MegaChips) - 1
              && measured(sum_of(MegaChips, bitflag_count) == length(MegaChips))
)

achievement(
    title = "Omega Trial Contestant",
    points = 10,
    description = "Collect 5 V5 navi chips",
    trigger = no_glitches_enabled()
              && prev(sum_of(V5Chips, bitflag_count)) == 4
              && measured(sum_of(V5Chips, bitflag_count) == 5)
)

achievement(
    title = "Omega Trial Combatant",
    points = 25,
    description = "Collect 10 V5 navi chips",
    trigger = no_glitches_enabled()
              && prev(sum_of(V5Chips, bitflag_count)) == 9
              && measured(sum_of(V5Chips, bitflag_count) == 10)
)

achievement(
    title = "Omega Trial Conqueror",
    points = 25,
    description = "Collect all 15 V5 navi chips",
    trigger = no_glitches_enabled()
              && prev(sum_of(V5Chips, bitflag_count)) == length(V5Chips) - 1
              && measured(sum_of(V5Chips, bitflag_count) == length(V5Chips))
)

achievement(
    title = "Holy Shock",
    points = 10,
    description = "Defeat Serenade Ω",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade Omega") && boss_killed()
)

achievement(
    title = "Vanishing World",
    points = 10,
    description = "Defeat Bass Ω",
    trigger = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Bass Omega") && boss_killed()
)

achievement(
    title = "Polymerization",
    points = 25,
    description = "Activate all 32 Program Advances",
    trigger = no_glitches_enabled()
              && prev(sum_of(ProgramAdvances, bitflag_count)) == length(ProgramAdvances) - 1
              && measured(sum_of(ProgramAdvances, bitflag_count) == length(ProgramAdvances))
)

achievement(
    title = "God Hand",
    points = 50,
    description = "Defeat Alpha Ω after unlocking all 7 title stars, obtaining a Giga Chip",
    trigger = no_glitches_enabled() && in_area("Alpha")
           && fighting_boss("Alpha Omega") && boss_killed()
)

achievement(
    title = "Recruiter",
    points = 10,
    description = "Find all 10 regular Virus Breeder recruiting opportunities",
    trigger = no_glitches_enabled()
              && prev(sum_of(VirusBreederRegulars, bitflag_count)) == length(VirusBreederRegulars) - 1
              && measured(sum_of(VirusBreederRegulars, bitflag_count) == length(VirusBreederRegulars))
)

achievement(
    title = "Boss Hunter",
    points = 25,
    description = "Find all 9 of Ω Virus Breeder recruiting opportunities",
    trigger = no_glitches_enabled()
              && prev(sum_of(VirusBreederOmegas, bitflag_count)) == length(VirusBreederOmegas) - 1
              && measured(sum_of(VirusBreederOmegas, bitflag_count) == length(VirusBreederOmegas))
)

///////////////////////
// Beta Boss S-Ranks //
///////////////////////

achievement(
    title = "Blackout",
    points = 10,
    description = "Defeat FlashMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("ACDC Area 2") && fighting_boss("FlashMan Beta") && s_ranked()
)

achievement(
    title = "Declawed",
    points = 10,
    description = "Defeat BeastMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Doghouse Comp") && fighting_boss("BeastMan Beta") && s_ranked()
)

achievement(
    title = "Scrubbed",
    points = 10,
    description = "Defeat BubbleMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Beach Area 1") && fighting_boss("BubbleMan Beta") && s_ranked()
)

achievement(
    title = "Eroded",
    points = 10,
    description = "Defeat DesertMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Old TV Comp") && fighting_boss("DesertMan Beta") && s_ranked()
)

achievement(
    title = "Rusted",
    points = 10,
    description = "Defeat MetalMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Hotel Front") && fighting_boss("MetalMan Beta") && s_ranked()
)

achievement(
    title = "Weeded",
    points = 10,
    description = "Defeat PlantMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Hospital Comp 3") && fighting_boss("PlantMan Beta") && s_ranked()
)

achievement(
    title = "Blown Out",
    points = 10,
    description = "Defeat FlameMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Yoka Area 1") && fighting_boss("FlameMan Beta") && s_ranked()
)

achievement(
    title = "Checkmate",
    points = 10,
    description = "Defeat KingMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Castle Wily") && fighting_boss("KingMan Beta") && s_ranked()
)

achievement(
    title = "Knocked Out",
    points = 10,
    description = "Defeat GutsMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Castle Wily") && fighting_boss("GutsMan Beta") && s_ranked()
)

achievement(
    title = "Distorted",
    points = 10,
    description = "Defeat Bass with an S rank",
    trigger = no_glitches_enabled() && in_area("Alpha") && fighting_boss("Bass") && s_ranked()
)

achievement(
    title = "Smashing Antiques",
    points = 10,
    description = "Defeat MistMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan Beta") && s_ranked()
)

achievement(
    title = "Motor Burnout",
    points = 10,
    description = "Defeat DrillMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Hades Isle Area") && fighting_boss("DrillMan Beta") && s_ranked()
)

achievement(
    title = "Light in the Dark",
    points = 10,
    description = "Defeat DarkMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Undernet 6") && fighting_boss("DarkMan Beta") && s_ranked()
)

achievement(
    title = "Feudal Uprising",
    points = 10,
    description = "Defeat JapanMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Armor Comp") && fighting_boss("JapanMan Beta") && s_ranked()
)

achievement(
    title = "Broken Sword",
    points = 10,
    description = "Defeat ProtoMan β with an S rank",
    trigger = no_glitches_enabled() && in_area("Eternal Hades") && fighting_boss("ProtoMan Beta") && s_ranked()
)

/////////////////
// Other Tasks //
/////////////////

achievement(
    title = "Helpful Hikari",
    points = 25,
    description = "Complete all jobs listed on the Job BBS",
    trigger = no_glitches_enabled()
              && prev(sum_of(Jobs, bitflag_count)) == length(Jobs) - 1
              && measured(sum_of(Jobs, bitflag_count) == length(Jobs))
)

achievement(
    title = "Loremaster",
    points = 3,
    description = "Outwit all 4 of the quiz givers",
    trigger = no_glitches_enabled()
              && prev(sum_of(Quizzes, bitflag_count)) == length(Quizzes) - 1
              && measured(sum_of(Quizzes, bitflag_count) == length(Quizzes))
)

achievement(
    title = "Chip Swap",
    points = 5,
    description = "Fulfill all 10 of the chip trades scattered across the world",
    trigger = no_glitches_enabled()
              && prev(sum_of(Trades, bitflag_count)) == length(Trades) - 1
              && measured(sum_of(Trades, bitflag_count) == length(Trades))
)

achievement(
    title = "Virtual DJ",
    points = 5,
    description = "Collect all of the Spin Key Items",
    trigger = no_glitches_enabled()
              && prev(sum_of(Spinners, has_key_item)) == length(Spinners) - 1
              && measured(sum_of(Spinners, has_key_item) == length(Spinners))
)

achievement(
    title = "Treasure Tomes",
    type = "missable",
    points = 5,
    description = "During the Legendary Tomes job, solve the riddle to collect 300,000 Zenny before returning the Tomes",
    // I used a zenny check here, since it's the only way to get that much in this area,
    // and the bitflag for this is a bit unreliable (might be reused / area dependent)
    trigger = no_glitches_enabled() && in_area("Staff Lounge") && (zenny - prev(zenny)) == 300000
)

achievement(
    title = "Elemental Evolution",
    points = 5,
    description = "Upgrade any Style Change to Level 4",
    trigger = no_glitches_enabled()
              && in_battle
              && prev(style_level) == 3 && style_level == 4
)

////////////////////
// Data Collector //
////////////////////

achievement(
    title = "Grade Manipulation",
    points = 2,
    description = "Collect all of the Blue Mystery Data in the Principal's PC",
    trigger = no_glitches_enabled() && (in_area("Principal's PC 1") || in_area("Principal's PC 2"))
              && prev(sum_of(MysteryData["Principal's PC"], bitflag_count)) == length(MysteryData["Principal's PC"]) - 1
              && measured(sum_of(MysteryData["Principal's PC"], bitflag_count) == length(MysteryData["Principal's PC"]))
)

achievement(
    title = "Squirrel Stash",
    points = 3,
    description = "Collect all of the Blue and Purple Mystery Data in ACDC Town and ACDC Area",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["ACDC Town"], bitflag_count)) == length(MysteryData["ACDC Town"]) - 1
              && measured(sum_of(MysteryData["ACDC Town"], bitflag_count) == length(MysteryData["ACDC Town"]))
)

achievement(
    title = "Experimental Reports",
    points = 2,
    description = "Collect all of the Blue and Purple Mystery Data in the SciLab building and SciLab Area",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["SciLab"], bitflag_count)) == length(MysteryData["SciLab"]) - 1
              && measured(sum_of(MysteryData["SciLab"], bitflag_count) == length(MysteryData["SciLab"]))
)

achievement(
    title = "Zoologist's Notes",
    points = 2,
    description = "Collect all of the Blue Mystery Data in the Zoo Comp",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Zoo Comp"], bitflag_count)) == length(MysteryData["Zoo Comp"]) - 1
              && measured(sum_of(MysteryData["Zoo Comp"], bitflag_count) == length(MysteryData["Zoo Comp"]))
)

achievement(
    title = "Spa Research",
    points = 2,
    description = "Collect all of the Blue and Purple Mystery Data in Yoka and Yoka Area",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Yoka"], bitflag_count)) == length(MysteryData["Yoka"]) - 1
              && measured(sum_of(MysteryData["Yoka"], bitflag_count) == length(MysteryData["Yoka"]))
)

achievement(
    title = "Seaside Search",
    points = 4,
    description = "Collect all of the Blue and Purple Mystery Data in Beach, Beach Area, and Hades Isle",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Beach"], bitflag_count)) == length(MysteryData["Beach"]) - 1
              && measured(sum_of(MysteryData["Beach"], bitflag_count) == length(MysteryData["Beach"]))
)

achievement(
    title = "Medical Data",
    points = 3,
    description = "Collect all of the Blue Mystery Data in the Hospital and Hospital Comp",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Hospital"], bitflag_count)) == length(MysteryData["Hospital"]) - 1
              && measured(sum_of(MysteryData["Hospital"], bitflag_count) == length(MysteryData["Hospital"]))
)

achievement(
    title = "Phishing for Packets",
    points = 4,
    description = "Collect all of the Blue Mystery Data in Undernet 1-4",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Undernet"], bitflag_count)) == length(MysteryData["Undernet"]) - 1
              && measured(sum_of(MysteryData["Undernet"], bitflag_count) == length(MysteryData["Undernet"]))
)

achievement(
    title = "Deep Web Downloads",
    points = 25,
    description = "Collect all of the Blue and Purple Mystery Data in Undernet 5-7",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Deepweb"], bitflag_count)) == length(MysteryData["Deepweb"]) - 1
              && measured(sum_of(MysteryData["Deepweb"], bitflag_count) == length(MysteryData["Deepweb"]))
)

achievement(
    title = "Wily's Wireless Workstation",
    points = 5,
    description = "Collect all of the Blue Mystery Data on WWW Isle",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["WWW"], bitflag_count)) == length(MysteryData["WWW"]) - 1
              && measured(sum_of(MysteryData["WWW"], bitflag_count) == length(MysteryData["WWW"]))
)

achievement(
    title = "Forbidden Knowledge",
    points = 10,
    description = "Collect all of the Blue and Purple Mystery Data in the Secret Area",
    trigger = no_glitches_enabled()
              && prev(sum_of(MysteryData["Secret Area"], bitflag_count)) == length(MysteryData["Secret Area"]) - 1
              && measured(sum_of(MysteryData["Secret Area"], bitflag_count) == length(MysteryData["Secret Area"]))
)

/////////////////////
// Shopping Spree  //
/////////////////////

achievement(
    title = "Shields & Shots",
    points = 1,
    description = "Empty out the chip shop in ACDC Area 2",
    trigger = no_glitches_enabled() && in_area("ACDC Area 2") && shop_emptied("ACDC Area 2")
)

achievement(
    title = "Going Green", points = 1,
    description = "Empty out the chip shop in ACDC Square",
    trigger = no_glitches_enabled() && in_area("ACDC Square") && shop_emptied("ACDC Square")
)

achievement(
    title = "Rocks in the Wind", points = 2,
    description = "Empty out the chip shop in SciLab Square",
    trigger = no_glitches_enabled() && in_area("SciLab Square") && shop_emptied("SciLab Square")
)

achievement(
    title = "Elemental Fury", points = 3,
    description = "Empty out Higsby's chip shop",
    trigger = no_glitches_enabled() && in_area("Higsby's") && shop_emptied("Higsby's")
)

achievement(
    title = "Lava Bombs", points = 5,
    description = "Empty out the chip shop in Yoka Area 1",
    trigger = no_glitches_enabled() && in_area("Yoka Area 1") && shop_emptied("Yoka 1")
)

achievement(
    title = "Yo-Yo Zapper", points = 2,
    description = "Empty out the chip shop in Yoka Square",
    trigger = no_glitches_enabled() && in_area("Yoka Square") && shop_emptied("Yoka Square")
)

achievement(
    title = "Ancient Power", points = 2,
    description = "Empty out the chip shop in Beach Square",
    trigger = no_glitches_enabled() && in_area("Beach Square") && shop_emptied("Beach Square")
)

achievement(
    title = "Gone Fishing", points = 2,
    description = "Empty out the program shop in Beach Square",
    trigger = no_glitches_enabled() && in_area("Beach Square") && shop_emptied("Beach Square Program")
)

achievement(
    title = "Recycling Bugs", points = 5,
    description = "Empty out the bugfrag shop in Undernet 2",
    trigger = no_glitches_enabled() && in_area("Undernet 2") && shop_emptied("Undernet 2")
)

achievement(
    title = "Aura Breaker", points = 3,
    description = "Empty out the chip shop in Under Square",
    trigger = no_glitches_enabled() && in_area("Under Square") && shop_emptied("Under Square")
)

achievement(
    title = "PvP Supply Pack", points = 3,
    description = "Empty out the program shop in Under Square",
    trigger = no_glitches_enabled() && in_area("Under Square") && shop_emptied("Under Square Program")
)

achievement(
    title = "Pawns & Puppets", points = 3,
    description = "Empty out the chip shop in Undernet 4",
    trigger = no_glitches_enabled() && in_area("Undernet 4") && shop_emptied("Undernet 4")
)

achievement(
    title = "Buster Rush", points = 5,
    description = "Empty out the program shop in Undernet 6",
    trigger = no_glitches_enabled() && in_area("Undernet 6") && shop_emptied("Undernet 6")
)

achievement(
    title = "Meteor Impact", points = 5,
    description = "Empty out the chip shop in Secret Area 2",
    trigger = no_glitches_enabled() && in_area("Secret Area 2") && shop_emptied("Secret Area 2")
)

//////////////////
// Leaderboards //
//////////////////

leaderboard(
    title = "Deletion Time: GutsMan",
    description = "Defeat GutsMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("ACDC Town") && fighting_boss("GutsMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlashMan",
    description = "Defeat FlashMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BeastMan",
    description = "Defeat BeastMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Zoo Comp 4") && fighting_boss("BeastMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BubbleMan",
    description = "Defeat BubbleMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Yoka Area 1") && fighting_boss("BubbleMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: KingMan",
    description = "Defeat KingMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("TV Station Lobby") && fighting_boss("KingMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DesertMan",
    description = "Defeat DesertMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("TV Station Editing Room") && fighting_boss("DesertMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: PlantMan",
    description = "Defeat PlantMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Hospital Comp 5") && fighting_boss("PlantMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlameMan",
    description = "Defeat FlameMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Undernet 3") && fighting_boss("FlameMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MistMan",
    description = "Defeat MistMan as fast as you can",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DrillMan",
    description = "Defeat DrillMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Undernet 5") && fighting_boss("DrillMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: Bass",
    description = "Defeat Bass inside of Alpha as fast as you can",
    start  = no_glitches_enabled() && in_area("Alpha") && fighting_boss("Bass") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: ProtoMan",
    description = "Defeat ProtoMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Eternal Hades") && fighting_boss("ProtoMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: ProtoMan Beta",
    description = "Defeat ProtoMan Beta in Eternal Hades as fast as you can",
    start  = no_glitches_enabled() && in_area("Eternal Hades") && fighting_boss("ProtoMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DarkMan",
    description = "Defeat DarkMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && fighting_boss("DarkMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: JapanMan",
    description = "Defeat JapanMan for the first time as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && fighting_boss("JapanMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlashMan Beta",
    description = "Defeat FlashMan Beta in ACDC Area 2 as fast as you can",
    start  = no_glitches_enabled() && in_area("ACDC Area 2") && fighting_boss("FlashMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BeastMan Beta",
    description = "Defeat BeastMan Beta in the Doghouse Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("Doghouse Comp") && fighting_boss("BeastMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BubbleMan Beta",
    description = "Defeat BubbleMan Beta in Beach Area 1 as fast as you can",
    start  = no_glitches_enabled() && in_area("Beach Area 1") && fighting_boss("BubbleMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DesertMan Beta",
    description = "Defeat DesertMan Beta in the Old TV Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("Old TV Comp") && fighting_boss("DesertMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MetalMan",
    description = "Defeat MetalMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Hotel Front") && fighting_boss("MetalMan") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MetalMan Beta",
    description = "Defeat MetalMan Beta in the Hotel Front as fast as you can",
    start  = no_glitches_enabled() && in_area("Hotel Front") && fighting_boss("MetalMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: PlantMan Beta",
    description = "Defeat PlantMan Beta in Hospital Comp 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Hospital Comp 3") && fighting_boss("PlantMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlameMan Beta",
    description = "Defeat FlameMan Beta in Yoka Area 1 as fast as you can",
    start  = no_glitches_enabled() && in_area("Yoka Area 1") && fighting_boss("FlameMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: KingMan Beta",
    description = "Defeat KingMan Beta in Castle Wily as fast as you can",
    start  = no_glitches_enabled() && in_area("Castle Wily") && fighting_boss("KingMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: GutsMan Beta",
    description = "Defeat GutsMan Beta in Castle Wily as fast as you can",
    start  = no_glitches_enabled() && in_area("Castle Wily") && fighting_boss("GutsMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MistMan Beta",
    description = "Defeat MistMan Beta in the NetBattle Machine Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DrillMan Beta",
    description = "Defeat DrillMan Beta in the Hades Isle Area as fast as you can",
    start  = no_glitches_enabled() && in_area("Hades Isle Area") && fighting_boss("DrillMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DarkMan Beta",
    description = "Defeat DarkMan Beta in Undernet 6 as fast as you can",
    start  = no_glitches_enabled() && in_area("Undernet 6") && fighting_boss("DarkMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: JapanMan Beta",
    description = "Defeat JapanMan Beta in the Armor Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("Armor Comp") && fighting_boss("JapanMan Beta") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: Serenade",
    description = "Defeat Serenade in Secret Area 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BassGS",
    description = "Defeat BassGS in Secret Area 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("BassGS") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: FlashMan",
    description = "Complete the time trial for FlashMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("FlashMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["FlashMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: BeastMan",
    description = "Complete the time trial for BeastMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("BeastMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["BeastMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: BubbleMan",
    description = "Complete the time trial for BubbleMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("BubbleMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["BubbleMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: DesertMan",
    description = "Complete the time trial for DesertMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("DesertMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["DesertMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: PlantMan",
    description = "Complete the time trial for PlantMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("PlantMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["PlantMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: FlameMan",
    description = "Complete the time trial for FlameMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("FlameMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["FlameMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: DrillMan",
    description = "Complete the time trial for DrillMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && new_time_trial_record("DrillMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["DrillMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: GutsMan",
    description = "Complete the time trial for GutsMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && new_time_trial_record("GutsMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["GutsMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: MetalMan",
    description = "Complete the time trial for MetalMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && new_time_trial_record("MetalMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["MetalMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: KingMan",
    description = "Complete the time trial for KingMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && new_time_trial_record("KingMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["KingMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: MistMan",
    description = "Complete the time trial for MistMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && new_time_trial_record("MistMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["MistMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: DarkMan",
    description = "Complete the time trial for DarkMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && new_time_trial_record("DarkMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["DarkMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: JapanMan",
    description = "Complete the time trial for JapanMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && new_time_trial_record("JapanMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["JapanMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Time Trial: ProtoMan",
    description = "Complete the time trial for ProtoMan as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && new_time_trial_record("ProtoMan") && title_screen_check,
    cancel = always_false(),
    submit = always_true(),
    value = dword(TimeTrialRecords["ProtoMan"]),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlashMan Omega",
    description = "Defeat FlashMan Omega in Principal's PC 2 as fast as you can",
    start  = no_glitches_enabled() && in_area("Principal's PC 2") && fighting_boss("FlashMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: GutsMan Omega",
    description = "Defeat GutsMan Omega in Dex's HP as fast as you can",
    start  = no_glitches_enabled() && in_area("Dex's HP") && fighting_boss("GutsMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BeastMan Omega",
    description = "Defeat BeastMan Omega in Zoo Comp 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Zoo Comp 3") && fighting_boss("BeastMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MetalMan Omega",
    description = "Defeat MetalMan Omega in Tamako's HP as fast as you can",
    start  = no_glitches_enabled() && in_area("Tamako's HP") && fighting_boss("MetalMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BubbleMan Omega",
    description = "Defeat BubbleMan Omega in Yoka Area 2 as fast as you can",
    start  = no_glitches_enabled() && in_area("Yoka Area 2") && fighting_boss("BubbleMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: KingMan Omega",
    description = "Defeat KingMan Omega in the TV Station Control Panel Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("TV Station Control Panel Comp") && fighting_boss("KingMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DesertMan Omega",
    description = "Defeat DesertMan Omega in the Relay Van Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("Relay Van Comp") && fighting_boss("DesertMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: PlantMan Omega",
    description = "Defeat PlantMan Omega in Hospital Comp 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Hospital Comp 3") && fighting_boss("PlantMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: FlameMan Omega",
    description = "Defeat FlameMan Omega in Undernet 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Undernet 3") && fighting_boss("FlameMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: MistMan Omega",
    description = "Defeat MistMan Omega in the NetBattle Machine Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("MistMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: BowlMan Omega",
    description = "Defeat BowlMan Omega in the NetBattle Machine Comp as fast as you can",
    start  = no_glitches_enabled() && in_area("NetBattle Machine Comp") && fighting_boss("BowlMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DrillMan Omega",
    description = "Defeat DrillMan Omega in Undernet 5 as fast as you can",
    start  = no_glitches_enabled() && in_area("Undernet 5") && fighting_boss("DrillMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: ProtoMan Omega",
    description = "Defeat ProtoMan Omega in Hades Isle Area as fast as you can",
    start  = no_glitches_enabled() && in_area("Hades Isle Area") && fighting_boss("ProtoMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: DarkMan Omega",
    description = "Defeat DarkMan Omega in Secret Area 1 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 1") && fighting_boss("DarkMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: JapanMan Omega",
    description = "Defeat JapanMan Omega in Secret Area 2 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 2") && fighting_boss("JapanMan Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: Serenade Omega",
    description = "Defeat Serenade Omega in Secret Area 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Serenade Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Deletion Time: Bass Omega",
    description = "Defeat Bass Omega in Secret Area 3 as fast as you can",
    start  = no_glitches_enabled() && in_area("Secret Area 3") && fighting_boss("Bass Omega") && boss_killed(),
    cancel = always_false(),
    submit = always_true(),
    value = measured(battle_time),
    lower_is_better = true,
    format = "FRAMES"
)

///////////////////
// Rich Presence //
///////////////////
rich_presence_conditional_display(
    player_max_hp == 0 || zenny < 0,
    "At title screen"
)


rich_presence_conditional_display(
    buster_glitch(),
    "Buster glitch detected! Achievements have been disabled."
)

rich_presence_conditional_display(
    hp_glitch(),
    "HP glitch detected! Achievements have been disabled."
)

rich_presence_conditional_display(
    custom_glitch(),
    "Custom glitch detected! Achievements have been disabled."
)

rich_presence_conditional_display(
    bassgs_detected(),
    "BassGS chip detected! Achievements have been disabled."
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0  && enemy_2_id != 0  && enemy_3_id != 0,
    "In battle against {3}, {4} and {5} | {0} | HP: {1}/{2} | Zenny: {6} | Bugfrags: {7}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_3_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0  && enemy_2_id != 0,
    "In battle against {3} and {4} | {0} | HP: {1}/{2} | Zenny: {5} | Bugfrags: {6}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0  && enemy_3_id != 0,
    "In battle against {3} and {4} | {0} | HP: {1}/{2} | Zenny: {5} | Bugfrags: {6}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_3_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_2_id != 0  && enemy_3_id != 0,
    "In battle against {3} and {4} | {0} | HP: {1}/{2} | Zenny: {5} | Bugfrags: {6}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_lookup("Enemy", enemy_3_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_1_id != 0,
    "In battle against {3} | {0} | HP: {1}/{2} | Zenny: {4} | Bugfrags: {5}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_1_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_2_id != 0,
    "In battle against {3} | {0} | HP: {1}/{2} | Zenny: {4} | Bugfrags: {5}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_2_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_conditional_display(
    in_battle && enemy_3_id != 0,
    "In battle against {3} | {0} | HP: {1}/{2} | Zenny: {4} | Bugfrags: {5}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_battle_hp),
    rich_presence_value("Number", player_battle_max_hp),
    rich_presence_lookup("Enemy", enemy_3_id, EnemyLookup, fallback="Unknown"),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)

rich_presence_display(
    "Exploring {0} | HP: {1}/{2} | Zenny: {3} | Bugfrags: {4}",
    rich_presence_lookup("Area", map_id, AreaLookup, fallback="Unknown Area"),
    rich_presence_value("Number", player_hp),
    rich_presence_value("Number", player_max_hp),
    rich_presence_value("Number", zenny),
    rich_presence_value("Number", bugfrags)
)
