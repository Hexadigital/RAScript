// JoJo's Bizarre Adventure: Heritage for the Future
// #ID = 11817

CharacterLookup = {
    0x00: "Jotaro",
    0x01: "Kakyoin",
    0x02: "Avdol",
    0x03: "Polnareff",
    0x04: "Joseph",
    0x05: "Iggi",
    0x06: "Alessy",
    0x07: "Chaca",
    0x08: "D' Bo",
    0x09: "N'Dool",
    0x0A: "Midler",
    0x0B: "Dio",
    0x0D: "Death 13",
    0x0E: "Shadow Dio",
    0x0F: "JoJo",
    0x10: "Hol Horse",
    0x11: "Iced",
    0x12: "New Kakyoin",
    0x13: "Black Polnareff",
    0x14: "Pet Shop",
    0x16: "Mahrahia",
    0x17: "Hol Horse & Voing",
    0x18: "Robber Soul",
    0x19: "Kan",
}

CharacterToID = {}
for key in CharacterLookup {
    CharacterToID[CharacterLookup[key]] = key
}

PlayableCharacters = [
    "Jotaro",
    "Kakyoin",
    "Avdol",
    "Polnareff",
    "Joseph",
    "Iggi",
    "Alessy",
    "Chaca",
    "D' Bo",
    "Midler",
    "Dio",
    "Hol Horse",
    "Iced",
    "Black Polnareff",
    "Pet Shop",
    "Mahrahia",
    "Shadow Dio",
    "JoJo",
    "New Kakyoin",
    "Hol Horse & Voing",
    "Robber Soul",
    "Kan"
]

ProgressionTypes = {
    "Jotaro": "progression",
    "Kakyoin": "progression",
    "Avdol": "progression",
    "Polnareff": "progression",
    "Joseph": "progression",
    "Iggi": "progression",
    "Alessy": "progression",
    "Chaca": "progression",
    "D' Bo": "progression",
    "Midler": "progression",
    "Dio": "progression",
    "Hol Horse": "progression",
    "Iced": "progression",
    "Black Polnareff": "progression",
    "Pet Shop": "progression",
    "Mahrahia": "progression",
    "Shadow Dio": "",
    "JoJo": "",
    "New Kakyoin": "",
    "Hol Horse & Voing": "",
    "Robber Soul": "",
    "Kan": ""
}

NormalStoryTitles = {
    "Jotaro": "Blazing Fists",
    "Kakyoin": "Emerald Splash",
    "Avdol": "Crossfire Hurricane",
    "Polnareff": "Needle Pierce",
    "Joseph": "Ripple Beat",
    "Iggi": "Sand Crash",
    "Alessy": "Shrink Wrap",
    "Chaca": "Swallow Counter",
    "D' Bo": "Dummy Dive",
    "Midler": "Harpoon Shot",
    "Dio": "The World",
    "Hol Horse": "Mighty Gun",
    "Iced": "Dark Space",
    "Black Polnareff": "Chariot Spirit",
    "Pet Shop": "Ice Lance",
    "Mahrahia": "Magnet of Bast",
    "Shadow Dio": "A Glimpse of Fear",
    "JoJo": "Hamon Cola",
    "New Kakyoin": "Hierophant's Barrier",
    "Hol Horse & Voing": "Glass Shower",
    "Robber Soul": "Yellow Splash",
    "Kan": "Demon Slayer Slash"
}

NormalChallengeTitles = {
    "Jotaro": "Star Breaker",
    "Kakyoin": "Punishment Time",
    "Avdol": "Napalm Bomb",
    "Polnareff": "Last Shot",
    "Joseph": "Hermit Web",
    "Iggi": "Big Sand Wave",
    "Alessy": "Shadow Axe",
    "Chaca": "Dimension Slash",
    "D' Bo": "Junky Carnival",
    "Midler": "Motor Show",
    "Dio": "Checkmate",
    "Hol Horse": "Rapid Fire",
    "Iced": "Madness Throw",
    "Black Polnareff": "Madness Blade",
    "Pet Shop": "Giga Frost Missiles",
    "Mahrahia": "Electric Shock",
    "Shadow Dio": "Time Stop!",
    "JoJo": "Unforgettable Memories",
    "New Kakyoin": "Super Emerald Splash",
    "Hol Horse & Voing": "Pipe Maze",
    "Robber Soul": "Gooey Trap",
    "Kan": "Deadly Wreckage"
}

HardStoryTitles = {
    "Jotaro": "Star Platinum The World",
    "Kakyoin": "Hierophant Finish",
    "Avdol": "Scorching Anhk",
    "Polnareff": "Glimpse of Requiem",
    "Joseph": "Overdrive",
    "Iggi": "Sand Storm",
    "Alessy": "Despair",
    "Chaca": "Super Learning",
    "D' Bo": "Resentment",
    "Midler": "Dinner Time",
    "Dio": "Road Roller",
    "Hol Horse": "Trace of Bullets",
    "Iced": "Circle Locus",
    "Black Polnareff": "Invincible Slash",
    "Pet Shop": "Death Penalty",
    "Mahrahia": "Iron Crush",
    "Shadow Dio": "WRYYYYYY!",
    "JoJo": "Hamon Beat! Red Stone of Aja!",
    "New Kakyoin": "True 20 Meter Radius Emerald Splash",
    "Hol Horse & Voing": "Absolute Premonition",
    "Robber Soul": "Coconut Backbreaker",
    "Kan": "The Strongest Sword"
}

FinalStoryEpisodes = {
    "Jotaro": 0x07,
    "Kakyoin": 0x07,
    "Avdol": 0x07,
    "Polnareff": 0x07,
    "Joseph": 0x07,
    "Iggi": 0x07,
    "Alessy": 0x07,
    "Chaca": 0x07,
    "D' Bo": 0x07,
    "Midler": 0x07,
    "Dio": 0x05,
    "Shadow Dio": 0x05,
    "JoJo": 0x05,
    "Hol Horse": 0x07,
    "Iced": 0x07,
    "New Kakyoin": 0x07,
    "Black Polnareff": 0x07,
    "Pet Shop": 0x05,
    "Mahrahia": 0x05,
    "Hol Horse & Voing": 0x05,
    "Robber Soul": 0x05,
    "Kan": 0x05
}

// Default Difficulty = 2
difficulty = low4(0x05c011) + 1

// Default Damage Level = 2
damage_level = low4(0x05c017) + 1

// Default Time Speed = 2
time_speed = low4(0x05c016) + 1

// Default 1P Max Round = 2
sp_max_round = low4(0x05c01b) + 1

// Default 2P Max Round = 2
mp_max_round = low4(0x05c010) + 1

// Event Mode = 0
event_mode = low4(0x05c015)

// Europe = 0x03
region = byte(0x05bfdc)

game_mode = byte(0x032eb7)
story_mode = game_mode == 0
challenge_mode = game_mode == 1

p1_character = byte(0x0314b1)
p2_character = byte(0x034cbc)
p1_health = word(0x0349ce)
p2_health = word(0x034dee)
p1_full_health = p1_health == 0x90
p1_cpu_status = byte(0x034a1b) // 0x01 = CPU Controlled
p2_cpu_status = byte(0x034e3b) // 0x01 = CPU Controlled

stage = byte(0x031459)
rounds_won = byte(0x034863)
challenge_mode_points = dword(0x032eb8)
challenge_mode_submit = stage == 0x09 && rounds_won == 1 && prev(p2_health) > 0xff00 && p2_health == 0

story_mode_score = low4(0x0349ec) + high4(0x0349ec) * 10 + low4(0x0349ed) * 100 + high4(0x0349ed) * 1000 + low4(0x0349ee) * 10000 + high4(0x0349ee) * 100000 + low4(0x0349ef) * 1000000 + high4(0x0349ef) * 10000000
story_mode_submit = rounds_won == 2 && prev(story_mode_score) != 0 && story_mode_score == 0


function default_settings() {
    return region == 0x03
    && damage_level == 2
    && time_speed == 2
    && sp_max_round == 2
    && mp_max_round == 2
    && event_mode == 0
    && p1_cpu_status == 0
}

// Character Cheevos and LB's
for c in PlayableCharacters {
    achievement(
        type = ProgressionTypes[c],
        title = NormalStoryTitles[c],
        points = 5,
        description = format("Clear Story Mode as {0} on Difficulty 2 or higher and otherwise default settings!", c),
        trigger = default_settings()
        && p2_cpu_status == 1
        && difficulty >= 2
        && story_mode
        && p1_character == CharacterToID[c]
        && stage == FinalStoryEpisodes[c]
        && prev(rounds_won) == 1
        && rounds_won == 2
    )
    achievement(
        title = HardStoryTitles[c],
        points = 10,
        description = format("Clear Story Mode as {0} on Difficulty 8 and otherwise default settings!", c),
        trigger = default_settings()
        && p2_cpu_status == 1
        && difficulty == 8
        && story_mode
        && p1_character == CharacterToID[c]
        && stage == FinalStoryEpisodes[c]
        && prev(rounds_won) == 1
        && rounds_won == 2
    )
    achievement(
        title = NormalChallengeTitles[c],
        points = 10,
        description = format("Clear Challenge Mode as {0} on Difficulty 2 or higher and otherwise default settings!", c),
        trigger = default_settings()
        && p2_cpu_status == 1
        && difficulty >= 2
        && challenge_mode
        && p1_character == CharacterToID[c]
        && stage == 0x09
        && prev(rounds_won) == 0
        && rounds_won == 1
    )
}
// Story Mode Leaderboards
// story_mode_submit = rounds_won == 2 && prev(story_mode_score) != 0 && story_mode_score == 0
for c in PlayableCharacters {
    leaderboard(
        title = format("Story Mode Difficulty 2+: {0}", c),
        description = "",
        start = default_settings()
        && p2_cpu_status == 1
        && difficulty >= 2
        && story_mode
        && p1_character == CharacterToID[c]
        && stage == FinalStoryEpisodes[c]
        && story_mode_submit,
        cancel = always_false(),
        submit = always_true(), 
        value = prev(story_mode_score)
    )
}
for c in PlayableCharacters {
    leaderboard(
        title = format("Story Mode Difficulty 8: {0}", c),
        description = "",
        start = default_settings()
        && p2_cpu_status == 1
        && difficulty == 8
        && story_mode
        && p1_character == CharacterToID[c]
        && stage == FinalStoryEpisodes[c]
        && story_mode_submit,
        cancel = always_false(),
        submit = always_true(), 
        value = prev(story_mode_score)
    )
}

// Challenge Mode Leaderboards
for c in PlayableCharacters {
    leaderboard(
        title = format("Challenge Mode Difficulty 2+: {0}", c),
        description = "",
        start = default_settings()
        && difficulty >= 2
        && challenge_mode
        && p1_character == CharacterToID[c]
        && challenge_mode_submit,
        cancel = always_false(),
        submit = always_true(), 
        value = challenge_mode_points
    )
}
for c in PlayableCharacters {
    leaderboard(
        title = format("Challenge Mode Difficulty 8: {0}", c),
        description = "",
        start = default_settings()
        && difficulty == 8
        && challenge_mode
        && p1_character == CharacterToID[c]
        && challenge_mode_submit,
        cancel = always_false(),
        submit = always_true(), 
        value = challenge_mode_points
    )
}


// Defeat Death 13 in Story Mode on default settings!
achievement(
    type = "missable",
    title = "End of a Nightmare",
    points = 2,
    description = "Defeat Death 13 in Story Mode on Difficulty 2 or higher and otherwise default settings!",
    trigger = default_settings()
    && p2_cpu_status == 1
    && difficulty >= 2
    && story_mode
    && p2_character == CharacterToID["Death 13"]
    && rounds_won == prev(rounds_won) + 1
)

// Defeat Geb with a perfect in Story Mode on default settings!
achievement(
    type = "missable",
    title = "Staying Dry",
    points = 3,
    description = "Defeat N'Dool with a perfect in Story Mode on Difficulty 2 or higher and otherwise default settings!",
    trigger = default_settings()
    && p2_cpu_status == 1
    && difficulty >= 2
    && story_mode
    && p2_character == CharacterToID["N'Dool"]
    && rounds_won == prev(rounds_won) + 1
    && p1_full_health
)

rich_presence_conditional_display(
    p1_health == 0 && p2_health == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    challenge_mode,
    "Challenge Mode • Stage {0} • {1} vs. {2} • Score: {3}",
    rich_presence_value("Stage", stage + 1),
    rich_presence_lookup("Character", p1_character, CharacterLookup),
    rich_presence_lookup("Character", p2_character, CharacterLookup),
    rich_presence_value("Score", challenge_mode_points)
)

rich_presence_conditional_display(
    story_mode,
    "Story Mode • Episode {0} • {1} vs. {2} • Score: {3}",
    rich_presence_value("Stage", stage + 1),
    rich_presence_lookup("Character", p1_character, CharacterLookup),
    rich_presence_lookup("Character", p2_character, CharacterLookup),
    rich_presence_value("Score", story_mode_score)
)

rich_presence_display(
    "Preparing to fight..."
)
