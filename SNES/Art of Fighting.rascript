// Art of Fighting | Ryuuko no Ken
// #ID = 391

// Warning: Unlike my other RATools scripts, a good chunk of things are left as addresses.
// These addresses are being used for the current progression-only achievements, so...

CharacterLookup = {
    0x00:"Ryo",
    0x01:"Robert",
    0x02:"Todo",
    0x03:"Jack",
    0x04:"Lee",
    0x05:"King",
    0x06:"Micky",
    0x07:"John",
    0x08:"Mr. Big",
    0x09:"Mr. Karate",
}

CharacterToID = {}
for key in CharacterLookup {
    CharacterToID[CharacterLookup[key]] = key
}

GameModeLookup = {
    0x00:"Story",
    0x01:"1P vs. 2P",
    0x02:"1P vs. COM",
}

GameModeToID = {}
for key in GameModeLookup {
    GameModeToID[GameModeLookup[key]] = key
}

bonus_game = byte(0x019585)
BonusGameLookup = {
    0x00:"Bottle Cut",
    0x01:"Ice Pillar Smash",
    0x02:"Super Fire Blow",
}

BonusGameToID = {}
for key in BonusGameLookup {
    BonusGameToID[BonusGameLookup[key]] = key
}

cheat_detected = byte(0x019608) == 0x7f && byte(0x000169) == 0x00 && prev(byte(0x00016b)) == 0x02 && byte(0x00016b) == 0x40

function cheats_disabled() {
    return disable_when(cheat_detected)
}

score = word(0x019549) * 10
game_mode = byte(0x019571)
demo = byte(0x019309) == 0xff
reset_detected = byte(0x01956d) == 0
p1_health = word(0x019307)
p1_max_starting_health = p1_health == 0xEF
p1_character = byte(0x0192cd)
p2_character = byte(0x019407)
p1_wins = prev(byte(0x019555)) == 1 && byte(0x019555) == 2
p2_wins = prev(byte(0x019559)) == 1 && byte(0x019559) == 2
normal_difficulty = byte(0x01956d) >= 4
max_difficulty = byte(0x01956d) == 8

// Clear the game using Ryo on Level 8 difficulty with the number of rounds set to 3!
achievement(
    title = "Ryo's Gauntlet",
    badge = "470931",
    points = 50,
    description = "Clear the game using Ryo on Level 8 difficulty with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["Story"] &&
              p1_character == CharacterToID["Ryo"] && p2_character == CharacterToID["Mr. Karate"] &&
              max_difficulty && p1_wins
)

// Clear the game using Robert on Level 8 difficulty with the number of rounds set to 3!
achievement(
    title = "Robert's Gauntlet",
    badge = "470932",
    points = 50,
    description = "Clear the game using Robert on Level 8 difficulty with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["Story"] &&
              p1_character == CharacterToID["Robert"] && p2_character == CharacterToID["Mr. Karate"] &&
              max_difficulty && p1_wins
)

// Clear the game without using a continue using Ryo on Level 4 difficulty or higher with the number of rounds set to 3!
achievement(
    title = "Ryo's Survival Challenge",
    badge = "470933",
    points = 50,
    description = "Clear the game without using a continue using Ryo on Level 4 difficulty or higher with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["Story"] && normal_difficulty &&
              once(p1_character == CharacterToID["Ryo"] && p2_character == CharacterToID["Todo"] && p1_wins) &&
              trigger_when(p1_character == CharacterToID["Ryo"] && p2_character == CharacterToID["Mr. Karate"] && p1_wins) &&
              never(p2_wins) && never(reset_detected)
)

// Clear the game without using a continue using Robert on Level 4 difficulty or higher with the number of rounds set to 3!
achievement(
    title = "Robert's Survival Challenge",
    badge = "470934",
    points = 50,
    description = "Clear the game without using a continue using Robert on Level 4 difficulty or higher with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["Story"] && normal_difficulty &&
              once(p1_character == CharacterToID["Robert"] && p2_character == CharacterToID["Todo"] && p1_wins) &&
              trigger_when(p1_character == CharacterToID["Robert"] && p2_character == CharacterToID["Mr. Karate"] && p1_wins) &&
              never(p2_wins) && never(reset_detected)
)

// Successfully complete the Bottle Cut minigame!
achievement(
    title = "Bottle Cut",
    badge = "470928",
    points = 3,
    description = "Break all the bottles in the Bottle Cut bonus game!",
    trigger = cheats_disabled() && !demo && game_mode == GameModeToID["Story"] &&
              bonus_game == BonusGameToID["Bottle Cut"] &&
              prev(p1_health) >= 0x78 && p1_health == 1
)

// Successfully complete the Ice Pillar Smash minigame!
achievement(
    title = "Ice Pillar Smash",
    badge = "470929",
    points = 4,
    description = "Break all the ice in the Ice Pillar Smash bonus game!",
    trigger = cheats_disabled() && !demo && game_mode == GameModeToID["Story"] &&
              bonus_game == BonusGameToID["Ice Pillar Smash"] &&
              prev(p1_health) >= 0x70 && p1_health == 1
)

// Successfully complete the Super Fire Blow minigame!
achievement(
    title = "Super Fire Blow",
    badge = "470930",
    points = 5,
    description = "Perform 5 Hao-Kens in the Super Fire Blow bonus game!",
    trigger = cheats_disabled() && !demo && game_mode == GameModeToID["Story"] &&
              bonus_game == BonusGameToID["Super Fire Blow"] &&
              prev(byte(0x0195b3)) == 1 && byte(0x0195b3) == 0
)

// Win any round in a Story Mode match without taking damage!
achievement(
    title = "Todo-ally Untouchable",
    badge = "470927",
    points = 5,
    description = "Win a round against Todo in Story Mode without taking damage, on Level 4 difficulty or higher!",
    trigger = cheats_disabled() && game_mode == GameModeToID["Story"] &&
              p1_character <= CharacterToID["Robert"] && p2_character == CharacterToID["Todo"] &&
              normal_difficulty && p1_max_starting_health && byte(0x019555) == prev(byte(0x019555)) + 1
)

// Using Todo, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Todo's Revenge",
    badge = "470874",
    points = 5,
    description = "Using Todo, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Todo"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using Jack, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Jack's Revenge",
    badge = "470920",
    points = 5,
    description = "Using Jack, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Jack"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using Lee, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Lee's Revenge",
    badge = "470921",
    points = 5,
    description = "Using Lee, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Lee"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using King, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "King's Revenge",
    badge = "470922",
    points = 5,
    description = "Using King, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["King"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using Micky, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Micky's Revenge",
    badge = "470923",
    points = 5,
    description = "Using Micky, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Micky"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using John, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "John's Revenge",
    badge = "470924",
    points = 5,
    description = "Using John, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["John"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using Mr. Big, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Mr. Big's Revenge",
    badge = "470925",
    points = 5,
    description = "Using Mr. Big, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Mr. Big"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

// Using Mr. Karate, defeat Ryo or Robert in 1P vs. Com Mode on Level 4 difficulty or higher and with the number of rounds set to 3!
achievement(
    title = "Mr. Karate's Revenge",
    badge = "470926",
    points = 5,
    description = "Using Mr. Karate, defeat Ryo or Robert in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == CharacterToID["Mr. Karate"] && p2_character <= CharacterToID["Robert"] &&
              normal_difficulty && p1_wins
)

achievement(
    title = "Mirror Match",
    badge = "470873",
    points = 5,
    description = "Defeat any character using that same character in 1P vs. COM Mode on Level 4 difficulty or higher and with the number of rounds set to 3!",
    trigger = cheats_disabled() && game_mode == GameModeToID["1P vs. COM"] &&
              p1_character == p2_character &&
              normal_difficulty && p1_wins
)

// High Score: Ryo L4+
leaderboard(
    title = "High Score: Ryo L4+",
    description = "",
    start = cheats_disabled() && game_mode == GameModeToID["Story"] &&
            p1_character == CharacterToID["Ryo"] && p2_character == CharacterToID["Mr. Karate"] &&
            normal_difficulty && p1_wins,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// High Score: Ryo L8
leaderboard(
    title = "High Score: Ryo L8",
    description = "",
    start = cheats_disabled() && game_mode == GameModeToID["Story"] &&
            p1_character == CharacterToID["Ryo"] && p2_character == CharacterToID["Mr. Karate"] &&
            max_difficulty && p1_wins,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// High Score: Robert L4+
leaderboard(
    title = "High Score: Robert L4+",
    description = "",
    start = cheats_disabled() && game_mode == GameModeToID["Story"] &&
            p1_character == CharacterToID["Robert"] && p2_character == CharacterToID["Mr. Karate"] &&
            normal_difficulty && p1_wins,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)
// High Score: Robert L8
leaderboard(
    title = "High Score: Robert L8",
    description = "",
    start = cheats_disabled() && game_mode == GameModeToID["Story"] &&
            p1_character == CharacterToID["Robert"] && p2_character == CharacterToID["Mr. Karate"] &&
            max_difficulty && p1_wins,
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

// Better rich presence that shows what mode the player is in, and for story mode, their progress and current score.
rich_presence_conditional_display(
    once(cheat_detected),
    "Cheat code detected, achievements disabled!"
)

rich_presence_conditional_display(
    game_mode == GameModeToID["Story"] && score == 0 && p2_character <= CharacterToID["Robert"],
    "At the title screen"
)

rich_presence_conditional_display(
    game_mode == GameModeToID["Story"],
    "In Story Mode • Playing as {0} • L{1} Difficulty • Score: {2}",
    rich_presence_lookup("Character", p1_character, CharacterLookup),
    rich_presence_value("Difficulty", byte(0x01956d)),
    rich_presence_value("Score", score)
)

rich_presence_conditional_display(
    game_mode == GameModeToID["1P vs. 2P"],
    "In 1P vs. 2P Mode • P1: {0} • P2: {1}",
    rich_presence_lookup("Character", p1_character, CharacterLookup),
    rich_presence_lookup("Character", p2_character, CharacterLookup)
)

rich_presence_conditional_display(
    game_mode == GameModeToID["1P vs. COM"],
    "In 1P vs. COM Mode • P1: {0} • CPU: {1}",
    rich_presence_lookup("Character", p1_character, CharacterLookup),
    rich_presence_lookup("Character", p2_character, CharacterLookup)
)

rich_presence_display(
    "Playing Art of Fighting | Ryuuko no Ken"
)

//////////////////////////////////////////
// Legacy Achievements from feifabricio //
//////////////////////////////////////////

achievement(
    title = "Defeat Todo", points = 5, type="progression",
    description = "Defeat Todo with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30384, badge = "31131", published = "12/1/2015 00:43:26", modified = "8/8/2020 18:24:52",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 2 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Jack", points = 5, type="progression",
    description = "Defeat Jack with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30385, badge = "31133", published = "12/1/2015 00:43:30", modified = "5/16/2021 02:52:13",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 3 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Lee", points = 5, type="progression",
    description = "Defeat Lee with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30386, badge = "31135", published = "12/1/2015 00:43:33", modified = "5/16/2021 02:52:15",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 4 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat King", points = 5, type="progression",
    description = "Defeat King with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30387, badge = "31137", published = "12/1/2015 00:43:36", modified = "5/16/2021 02:52:17",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 5 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Micky", points = 5, type="progression",
    description = "Defeat Micky with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30388, badge = "31139", published = "12/1/2015 00:43:40", modified = "5/16/2021 02:52:19",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 6 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat John", points = 5, type="progression",
    description = "Defeat John with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30389, badge = "31141", published = "12/1/2015 00:43:45", modified = "5/16/2021 02:52:21",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 7 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Mr. Big", points = 5, type="progression",
    description = "Defeat Mr. Big with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30390, badge = "31143", published = "12/1/2015 00:43:49", modified = "5/14/2022 04:59:07",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 8 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Mr. Karate", points = 10, type="progression",
    description = "Defeat Mr. Karate with Ryo in story mode on level 4 difficulty or higher and three round matches",
    id = 30399, badge = "31145", published = "12/1/2015 00:44:36", modified = "5/16/2021 02:52:25",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 0 && byte(0x019407) == 9 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Todo Again", points = 5, type="progression",
    description = "Defeat Todo with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30392, badge = "31132", published = "12/1/2015 00:44:04", modified = "5/16/2021 02:52:29",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 2 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Jack Again", points = 5, type="progression",
    description = "Defeat Jack with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30393, badge = "31134", published = "12/1/2015 00:44:07", modified = "5/16/2021 02:52:32",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 3 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Lee Again", points = 5, type="progression",
    description = "Defeat Lee with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30394, badge = "31136", published = "12/1/2015 00:44:12", modified = "5/16/2021 02:52:33",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 4 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat King Again", points = 5, type="progression",
    description = "Defeat King with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30395, badge = "31138", published = "12/1/2015 00:44:22", modified = "5/16/2021 02:52:35",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 5 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Micky Again", points = 5, type="progression",
    description = "Defeat Micky with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30396, badge = "31148", published = "12/1/2015 00:44:25", modified = "5/16/2021 02:52:36",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 6 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat John Again", points = 5, type="progression",
    description = "Defeat John with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30397, badge = "31147", published = "12/1/2015 00:44:29", modified = "5/16/2021 02:52:39",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 7 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Mr. Big Again", points = 5, type="progression",
    description = "Defeat Mr. Big with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30398, badge = "31144", published = "12/1/2015 00:44:33", modified = "5/14/2022 04:59:07",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 8 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "Defeat Mr. Karate Again", points = 10, type="progression",
    description = "Defeat Mr. Karate with Robert in story mode on level 4 difficulty or higher and three round matches",
    id = 30391, badge = "31146", published = "12/1/2015 00:44:00", modified = "5/16/2021 02:52:44",
    trigger = cheats_disabled() && byte(0x01956D) >= 4 &&
              byte(0x0192CD) == 1 && byte(0x019407) == 9 && byte(0x019557) >= 2 && prev(byte(0x019555)) == 1 &&
              byte(0x019555) == 2 && byte(0x019571) == 0
)

achievement(
    title = "[VOID] Perfect", points = 0,
    description = "Win a perfect round from Mr. Karate without winning bonus.",
    
    id = 36881, badge = "37649", published = "6/1/2016 01:12:35", modified = "6/1/2016 01:13:04",
    trigger = word(0x019407) == 9 && never(word(0x019307) != 239) && word(0x019441) == 0 && word(0x019583) == 3 &&
              word(0x01956D) >= 6
)
