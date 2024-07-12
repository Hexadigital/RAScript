// Universal Studios Theme Park Adventure
// #ID = 30157

Difficulties = {
    "Easy": 0,
    "Normal": 1,
    "Hard": 2
}

DifficultyLookup = {}
for key in Difficulties {
    DifficultyLookup[Difficulties[key]] = key
}

Items = {
    "BTTF Cap": bit0(0x0022d26a),
    "E.T. Cap": bit1(0x0022d26a),
    "Jaws Cap": bit2(0x0022d26a),
    "JP Cap": bit3(0x0022d26a),
    "T-Rex Shoes": bit5(0x0022d26a),
    "Hover Board": bit7(0x0022d26a),
    "Cowboy Hat": bit6(0x0022d26b),
    "Fireman's Helmet": bit7(0x0022d26b),
}

stamps_start = 0x0022d1e3
Stamps = {
    "Jurassic Park": byte(stamps_start),
    "Back to the Future": byte(stamps_start + 1),
    "Wild West": byte(stamps_start + 2),
    "Backdraft": byte(stamps_start + 3),
    "ET": byte(stamps_start + 4),
    "Jaws": byte(stamps_start + 5),
    "Quiz": byte(stamps_start + 6),
    "Universal Studios": byte(stamps_start + 7),
}

Areas = {
    "Out of Game": 0x0000,
    "Shop": 0x0003,
    "Quiz": 0x0102,
    "ET": 0x0104,
    "Wild West": 0x0207,
    "Backdraft": 0x0302,
    "Back to the Future":0x0306,
    "Jurassic Park": 0x0402,
    "Jaws": 0x0501
}

letter_start = 0x0022d203
GoldenLetters = [
    bit0(letter_start),
    bit0(letter_start + 1),
    bit0(letter_start + 2),
    bit0(letter_start + 3),
    bit0(letter_start + 4),
    bit0(letter_start + 5),
    bit0(letter_start + 6),
    bit0(letter_start + 7),
    bit0(letter_start + 8),
    bit0(letter_start + 9),
    bit0(letter_start + 10),
    bit0(letter_start + 11),
    bit0(letter_start + 12),
    bit0(letter_start + 13),
    bit0(letter_start + 14),
    bit0(letter_start + 15)
]

difficulty = byte(0x0022d1e0)
current_area = word_be(0x0022d2f8)
points = dword_be(0x0022d300)
quiz_progress = byte(0x0022d1f9)

function bitflag_count(bitflag) {
    return bitflag
}

function stamp_count(name) {
    return Stamps[name]
}

function item_bought(name) {
    return prev(Items[name]) == 0 && Items[name] == 1
}

function blue_stamp_get(name) {
    return prev(Stamps[name]) == 0 && (Stamps[name] == 1 || Stamps[name] == 2)
}

function red_stamp_get(name) {
    return prev(Stamps[name]) <= 1 && Stamps[name] == 2
}

// Buy the Cowboy Hat 1p
achievement(
    title = "Cowkid",
    points = 1,
    description = "Buy the Cowboy Hat",
    trigger = current_area == Areas["Shop"] && item_bought("Cowboy Hat")
)

// Buy the Fireman's Helmet 2p
achievement(
    title = "Not Legally Certified",
    points = 2,
    description = "Buy the Fireman's Helmet",
    trigger = current_area == Areas["Shop"] && item_bought("Fireman's Helmet")
)

// Buy the BTTF Cap 1p
achievement(
    title = "Time to Wear a Cap",
    points = 1,
    description = "Buy the BTTF Cap",
    trigger = current_area == Areas["Shop"] && item_bought("BTTF Cap")
)

// Buy the E.T. Cap 1p
achievement(
    title = "Lunar Headwear",
    points = 1,
    description = "Buy the E.T. Cap",
    trigger = current_area == Areas["Shop"] && item_bought("E.T. Cap")
)

// Buy the Jaws Cap 1p
achievement(
    title = "Not a Blahaj",
    points = 1,
    description = "Buy the Jaws Cap",
    trigger = current_area == Areas["Shop"] && item_bought("Jaws Cap")
)

// Buy the JP Cap 1p
achievement(
    title = "Does Red Deter Dinosaurs?",
    points = 1,
    description = "Buy the JP Cap",
    trigger = current_area == Areas["Shop"] && item_bought("JP Cap")
)

// Buy the T-Rex Shoes 3p
achievement(
    title = "Stomping in Style",
    points = 3,
    description = "Buy the T-Rex Shoes",
    trigger = current_area == Areas["Shop"] && item_bought("T-Rex Shoes")
)

// Buy the Hover Board 5p
achievement(
    title = "This is Now a Sci-Fi Game",
    points = 5,
    description = "Buy the Hover Board",
    trigger = current_area == Areas["Shop"] && item_bought("Hover Board")
)

// Get any stamp in Jurassic Park 2p
achievement(
    title = "Survival of the Fastest",
    type = "progression",
    points = 2,
    description = "Get any stamp in Jurassic Park",
    trigger = current_area == Areas["Jurassic Park"] && blue_stamp_get("Jurassic Park")
)

// Get a red stamp in Jurassic Park 4p
achievement(
    title = "Dino Destroyer",
    points = 4,
    description = "Get a red stamp in Jurassic Park",
    trigger = current_area == Areas["Jurassic Park"] && red_stamp_get("Jurassic Park")
)

// Get any stamp in Back to the Future 2p
achievement(
    title = "DeLorean Duel",
    type = "progression",
    points = 2,
    description = "Get any stamp in Back to the Future",
    trigger = current_area == Areas["Back to the Future"] && blue_stamp_get("Back to the Future")
)

// Get a red stamp in Back to the Future 4p
achievement(
    title = "Hovercar Hunter",
    points = 4,
    description = "Get a red stamp in Back to the Future",
    trigger = current_area == Areas["Back to the Future"] && red_stamp_get("Back to the Future")
)

// Get any stamp in The Wild Wild Wild West 2p
achievement(
    title = "Straight Shot",
    type = "progression",
    points = 2,
    description = "Get any stamp in The Wild Wild Wild West",
    trigger = current_area == Areas["Wild West"] && blue_stamp_get("Wild West")
)

// Get a red stamp in The Wild Wild Wild West 4p
achievement(
    title = "Sharp Shooter",
    points = 4,
    description = "Get a red stamp in The Wild Wild Wild West",
    trigger = current_area == Areas["Wild West"] && red_stamp_get("Wild West")
)

// Get any stamp in Back Draft 2p
achievement(
    title = "Dampening Excitement",
    type = "progression",
    points = 2,
    description = "Get any stamp in Backdraft",
    trigger = current_area == Areas["Backdraft"] && blue_stamp_get("Backdraft")
)

// Get a red stamp in Back Draft 4p
achievement(
    title = "Extinguish All Hope",
    points = 5,
    description = "Get a red stamp in Backdraft",
    trigger = current_area == Areas["Backdraft"] && red_stamp_get("Backdraft")
)

// Get any stamp in E.T. Adventure 2p
achievement(
    title = "Not Quite Excitebike",
    type = "progression",
    points = 2,
    description = "Get any stamp in E.T. Adventure",
    trigger = current_area == Areas["ET"] && blue_stamp_get("ET")
)

// Get a red stamp in E.T. Adventure 4p
achievement(
    title = "Top Cyclist",
    points = 4,
    description = "Get a red stamp in E.T. Adventure",
    trigger = current_area == Areas["ET"] && red_stamp_get("ET")
)

// Get any stamp in Jaws 2p
achievement(
    title = "Shark Smasher",
    type = "progression",
    points = 2,
    description = "Get any stamp in Jaws",
    trigger = current_area == Areas["Jaws"] && blue_stamp_get("Jaws")
)

// Get a red stamp in Jaws 4p
achievement(
    title = "Boat Defender",
    points = 4,
    description = "Get a red stamp in Jaws",
    trigger = current_area == Areas["Jaws"] && red_stamp_get("Jaws")
)

// Get any stamp in Quiz 2p
achievement(
    title = "Lucky Guess",
    type = "progression",
    points = 2,
    description = "Get any stamp in Quiz",
    trigger = current_area == Areas["Quiz"] && blue_stamp_get("Quiz")
)

// Get a red stamp in Quiz 3p
achievement(
    title = "Loremaster",
    points = 3,
    description = "Get a red stamp in Quiz",
    trigger = current_area == Areas["Quiz"] && red_stamp_get("Quiz")
)

// Collect 8 of the golden letters 3p
achievement(
    title = "U_I_E_S_L _T_D_O_",
    type = "progression",
    points = 3,
    description = "Collect 8 of the golden letters",
    trigger = prev(sum_of(GoldenLetters, bitflag_count)) == 7
              && measured(sum_of(GoldenLetters, bitflag_count) == 8)
)

// Collect all 16 of the golden letters 5p
achievement(
    title = "UNIVERSAL STUDIOS",
    type = "progression",
    points = 5,
    description = "Collect all 16 of the golden letters",
    trigger = prev(sum_of(GoldenLetters, bitflag_count)) == length(GoldenLetters) - 1
              && measured(sum_of(GoldenLetters, bitflag_count) == length(GoldenLetters))
)

// Collect all 8 stamps and watch some Hollywood Magic 10p
achievement(
    title = "Hollywood Magic",
    type = "win_condition",
    points = 10,
    description = "Collect all 8 stamps and watch the ending",
    trigger = prev(current_area) == Areas["Shop"]
      && current_area == Areas["Out of Game"]
      && points == prev(points)
      && points > 0
      && quiz_progress > 0
)

achievement(
    title = "All This for a Special End Screen?",
    points = 10,
    description = "Collect all 8 stamps and watch the ending on Hard difficulty",
    trigger = difficulty == Difficulties["Hard"]
      && prev(current_area) == Areas["Shop"]
      && current_area == Areas["Out of Game"]
      && points == prev(points)
      && points > 0
      && quiz_progress > 0
)

rich_presence_conditional_display(
    current_area == Areas["Out of Game"] && points == 0,
    "At the main menu"
)

rich_presence_conditional_display(
    current_area == Areas["Out of Game"],
    "Watching the ending • {0}",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown")
)

rich_presence_conditional_display(
    current_area == Areas["Shop"],
    "Checking out the shop • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Quiz"],
    "Thinking hard • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["ET"],
    "Cycling freely • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Wild West"],
    "Wrangling • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Backdraft"],
    "Dealing with the heat • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Back to the Future"],
    "Contemplating time travel • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Jurassic Park"],
    "Playing with dinosaurs • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_conditional_display(
    current_area == Areas["Jaws"],
    "Slightly soaked • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)

rich_presence_display(
    "Exploring the park • {0} • {1}/8 Stamps • {2} Points",
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Stamps, stamp_count)),
    rich_presence_value("Number", points)
)
