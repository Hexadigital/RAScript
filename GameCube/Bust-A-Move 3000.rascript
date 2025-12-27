// Bust-A-Move 3000
// #ID = 25429

GameModeLookup = {
    0x00: "1P Puzzle",
    0x01: "CPU Battle",
    0x02: "2P Battle",
    0x03: "Options"
}

GameModeNameToID = {}
for key in GameModeLookup {
    GameModeNameToID[GameModeLookup[key]] = key
}

PuzzleModeLookup = {
    0x00: "Training",
    0x01: "Normal",
    0x02: "Classic"
}

PuzzleModeNameToID = {}
for key in PuzzleModeLookup {
    PuzzleModeNameToID[PuzzleModeLookup[key]] = key
}

CharacterLookup = {
    0x03: "Mog",
    0x02: "Catch",
    0x06: "Pinky",
    0x04: "Pukadon",
    0x05: "Miss T",
    0x01: "Mr. @",
    0x07: "Woro",
    0x08: "Tom & Vam",
    0x09: "Fungila",
    0x00: "Katze"
}

CharacterToID = {}
for key in CharacterLookup {
    CharacterToID[CharacterLookup[key]] = key
}

CPUDifficultyLookup = {
    0x00: "Normal",
    0x01: "Expert"
}

CPUDifficultyToID = {}
for key in CPUDifficultyLookup {
    CPUDifficultyToID[CPUDifficultyLookup[key]] = key
}

LetterLookup = {
    0x00: "A",
    0x01: "B",
    0x02: "C",
    0x03: "D",
    0x04: "E",
    0x05: "F",
    0x06: "G",
    0x07: "H",
    0x08: "I",
    0x09: "J",
    0x0A: "K",
    0x0B: "L",
    0x0C: "M",
    0x0D: "N",
    0x0E: "O",
    0x0F: "P",
    0x10: "Q",
    0x11: "R",
    0x12: "S",
    0x13: "T",
    0x14: "U",
    0x15: "V",
    0x16: "W",
    0x17: "X",
    0x18: "Y",
    0x19: "Z",
    0x1A: "?"
}

LetterToID = {}
for key in LetterLookup {
    LetterToID[LetterLookup[key]] = key
}

final_letters = ["U", "V", "W", "?", "X", "Y", "Z"]

// game_mode = byte(0x001b178b) // Old value, prone to breakage
game_mode = byte(0x001513db)
puzzle_mode = byte(0x001513df)
battle_difficulty = byte(0x001b15b3)
round = byte(0x001b1737) + 1
character = byte(0x000e703d)
letter = byte(0x001513f7)
shooter_graphic_pointer = dword(0x001b14fc)
score = byte(0x000e7003) * 10
        + byte(0x000e7002) * 2560
        + byte(0x000e7001) * 655360
        + byte(0x000e7000) * 167772160
another_world = byte(0x001513d7) == 1
in_menu = shooter_graphic_pointer == 0


function round_completed(num) {
    return prev(round) == num && round == num + 1
}

cpu_battle_mode_completed = round_completed(10)

function on_letter(l) {
    return letter == LetterToID[l]
}

function puzzle_letter_completed(l) {
    return on_letter(l) && round_completed(5)
}


// Clear the first stage of regular 1P Puzzle Normal mode!
// 0x00 to 0x01 or 0x02

achievement(
    type = "progression",
    title = "The First Letter",
    points = 1,
    description = "Clear the first stage of regular 1P Puzzle Normal mode!",
    trigger = !another_world
              && game_mode == GameModeNameToID["1P Puzzle"]
              && puzzle_mode == PuzzleModeNameToID["Normal"]
              && any_of(["A", "B"], on_letter)
              && round_completed(5)
)

// Clear the fourth stage of regular 1P Puzzle Normal mode!
// JKLMN -> OPQRST

achievement(
    type = "progression",
    title = "The Fourth Letter",
    points = 3,
    description = "Clear the fourth stage of regular 1P Puzzle Normal mode!",
    trigger = !another_world
              && game_mode == GameModeNameToID["1P Puzzle"]
              && puzzle_mode == PuzzleModeNameToID["Normal"]
              && any_of(["J", "K", "L", "M", "N"], on_letter)
              && round_completed(5)
)

// Clear the final stage of regular 1P Puzzle Normal mode!
// UVW?XYZ, round 0x04 -> 0x05, progression

achievement(
    type = "progression",
    title = "The Final Letter",
    points = 5,
    description = "Clear the final stage of regular 1P Puzzle Normal mode!",
    trigger = !another_world
              && game_mode == GameModeNameToID["1P Puzzle"]
              && puzzle_mode == PuzzleModeNameToID["Normal"]
              && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
              && round_completed(5)
)

// Get ending [UVW?XYZ] in regular 1P Puzzle Normal mode!

for l in final_letters {
    achievement(
        title = format("Bubble Buster: {0}", l),
        points = 10,
        description = format("Clear stage {0} in regular 1P Puzzle Normal mode!", l),
        trigger = !another_world
                  && game_mode == GameModeNameToID["1P Puzzle"]
                  && puzzle_mode == PuzzleModeNameToID["Normal"]
                  && puzzle_letter_completed(l)
    )
}

// Clear the final stage of regular 1P Puzzle Classic mode!
// UVW?XYZ, round 0x04 -> 0x05, progression

achievement(
    type = "progression",
    title = "The Classic Solution",
    points = 5,
    description = "Clear the final stage of regular 1P Puzzle Classic mode!",
    trigger = !another_world
              && game_mode == GameModeNameToID["1P Puzzle"]
              && puzzle_mode == PuzzleModeNameToID["Classic"]
              && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
              && round_completed(5)
)

// Get ending [UVW?XYZ] in regular 1P Puzzle Classic mode!

for l in final_letters {
    achievement(
        title = format("Classic Champion: {0}", l),
        points = 10,
        description = format("Clear stage {0} in regular 1P Puzzle Classic mode!", l),
        trigger = !another_world
                  && game_mode == GameModeNameToID["1P Puzzle"]
                  && puzzle_mode == PuzzleModeNameToID["Classic"]
                  && puzzle_letter_completed(l)
    )
}


// Clear CPU Battle mode on Normal or Expert with any character!

achievement(
    type = "progression",
    title = "Bubble Battle",
    points = 5,
    description = "Clear CPU Battle mode on Normal with any character!",
    trigger = game_mode == GameModeNameToID["CPU Battle"]
              && round_completed(10)
)

// Clear CPU Battle mode on Expert with any character!
achievement(
    title = "The Grand Bubble War",
    points = 10,
    description = "Clear CPU Battle mode on Expert with any character!",
    trigger = game_mode == GameModeNameToID["CPU Battle"]
              && battle_difficulty == CPUDifficultyToID["Expert"]
              && round_completed(10)
)

// Clear CPU Battle mode using character name!
battle_chars = ["Mog", "Catch", "Pinky", "Pukadon", "Miss T",  
                "Mr. @", "Woro", "Tom & Vam", "Fungila", "Katze"]
for c in battle_chars {
    achievement(
        title = format("{0}'s Conquest", c),
        points = 5,
        description = format("Clear CPU Battle mode using {0}!", c),
        trigger = game_mode == GameModeNameToID["CPU Battle"]
                  && character == CharacterToID[c]
                  && round_completed(10)
    )
}

// Get ending [UVW?XYZ] in Another World's 1P Puzzle Normal mode!

for l in final_letters {
    achievement(
        title = format("Ghost Buster: {0}", l),
        points = 10,
        description = format("Clear stage {0} in Another World's 1P Puzzle Normal mode!", l),
        trigger = another_world
                  && game_mode == GameModeNameToID["1P Puzzle"]
                  && puzzle_mode == PuzzleModeNameToID["Normal"]
                  && puzzle_letter_completed(l)
    )
}

// Get ending [UVW?XYZ] in Another World's 1P Puzzle Classic mode!

for l in final_letters {
    achievement(
        title = format("Crypt Classic: {0}", l),
        points = 10,
        description = format("Clear stage {0} in Another World's 1P Puzzle Classic mode!", l),
        trigger = another_world
                  && game_mode == GameModeNameToID["1P Puzzle"]
                  && puzzle_mode == PuzzleModeNameToID["Classic"]
                  && puzzle_letter_completed(l)
    )
}

leaderboard(
    title = "Regular Normal Puzzle: High Score",
    description = "",
    start = !another_world
            && game_mode == GameModeNameToID["1P Puzzle"]
            && puzzle_mode == PuzzleModeNameToID["Normal"]
            && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
            && once(round_completed(5))
            && repeated(180, round == 6)
            && never(round < 5),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Regular Classic Puzzle: High Score",
    description = "",
    start = !another_world
            && game_mode == GameModeNameToID["1P Puzzle"]
            && puzzle_mode == PuzzleModeNameToID["Classic"]
            && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
            && once(round_completed(5))
            && repeated(180, round == 6)
            && never(round < 5),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "CPU Battle Normal: High Score",
    description = "",
    start = game_mode == GameModeNameToID["CPU Battle"]
            && battle_difficulty == CPUDifficultyToID["Normal"]
            && once(round_completed(10))
            && repeated(180, round == 11)
            && never(round < 10),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "CPU Battle Expert: High Score",
    description = "",
    start = game_mode == GameModeNameToID["CPU Battle"]
            && battle_difficulty == CPUDifficultyToID["Expert"]
            && once(round_completed(10))
            && repeated(180, round == 11)
            && never(round < 10),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Another World's Normal Puzzle: High Score",
    description = "",
    start = another_world
            && game_mode == GameModeNameToID["1P Puzzle"]
            && puzzle_mode == PuzzleModeNameToID["Normal"]
            && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
            && once(round_completed(5))
            && repeated(180, round == 6)
            && never(round < 5),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "Another World's Classic Puzzle: High Score",
    description = "",
    start = another_world
            && game_mode == GameModeNameToID["1P Puzzle"]
            && puzzle_mode == PuzzleModeNameToID["Classic"]
            && any_of(["U", "V", "W", "?", "X", "Y", "Z"], on_letter)
            && once(round_completed(5))
            && repeated(180, round == 6)
            && never(round < 5),
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    !in_menu && game_mode == GameModeNameToID["1P Puzzle"],
    "In 1P Puzzle mode • Round {0}{1} • Score: {2}",
    rich_presence_lookup("Letter", letter, LetterLookup),
    rich_presence_value("Round", round),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    !in_menu && game_mode == GameModeNameToID["CPU Battle"] && round == 11,
    "In CPU Battle mode • {0} • Celebrating • Score: {1}",
    rich_presence_lookup("CPUDifficulty", battle_difficulty, CPUDifficultyLookup),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    !in_menu && game_mode == GameModeNameToID["CPU Battle"],
    "In CPU Battle mode • {0} • Round {1} • Score: {2}",
    rich_presence_lookup("CPUDifficulty", battle_difficulty, CPUDifficultyLookup),
    rich_presence_value("Round", round),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    !in_menu && game_mode == GameModeNameToID["2P Battle"],
    "In 2P Battle mode"
)

rich_presence_display(
    "In a menu"
)
