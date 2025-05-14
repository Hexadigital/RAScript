// ~Homebrew~ Touhou Pocket Festival: Show of Scale
// #ID = 33405

TrackNames = [
    "On Generation",
    "Megaton Moon",
    "Walking Banditry",
    "Hidden Esotericist",
    "Ascension of Being"
]

SceneIDLookup = {
    0x001b528b: "Yama-Ton Slam: Stage 3 Opponent's Hit (Charge)",
    0x03184f8c: "Yama-Ton Slam: Opponent's Hit (Cracking Mountain)",
    0x031853c1: "Yama-Ton Slam: Stage 1 Player's Hit (Cracking Mountain)",
    0x0318540b: "Yama-Ton Slam: Stage 2 Player's Hit (Cracking Mountain)",
    0x03185455: "Yama-Ton Slam: Stage 3 Player's Hit (Cracking Mountain)",
    0x081a5c5e: "The Moriya Scale: Title Screen",
    0x101b4fc7: "Yama-Ton Slam: Player's Hit (Splitting Mountain)",
    0x181a56d3: "Yama-Ton Slam: Start, Yama-",
    0x1b195490: "Youmu's Quick Draw: Duel 1 Loading",
    0x1c165541: "Youmu's Quick Draw: Pre-Title Loading Screen",
    0x20074f42: "The Moriya Scale: In-Game 2",
    0x201b5002: "Yama-Ton Slam: Player's Hit (Launch, Weak)",
    0x281a58f4: "Yama-Ton Slam: Defeat",
    0x2b1959a1: "Power Scalers: Start, No Text",
    0x301b5e91: "The Moriya Scale: Mountain 1",
    0x301b5f03: "The Moriya Scale: Mountain 2",
    0x381a5e1f: "The Moriya Scale: How to Play",
    0x3b195966: "Power Scalers: Start, Power Scalers",
    0x3d084b79: "The Moriya Scale: In-Game 1",
    0x401b50b3: "Yama-Ton Slam: Stage 1 Opponent's Hit (Launch)",
    0x4b195506: "Youmu's Quick Draw: Duel 3 Loading",
    0x501b4c7a: "Yama-Ton Slam: Player's Hit (Charge)",
    0x581a5780: "Yama-Ton Slam: Start, Yama-Ton Slam",
    0x601b5215: "Yama-Ton Slam: Stage 2 Opponent's Hit (Launch)",
    0x681a5698: "Youmu's Quick Draw: Victory",
    0x6b195a17: "Power Scalers: Start, Scalers",
    0x701b5129: "Yama-Ton Slam: Stage 1 Opponent's Hit (Charge)",
    0x781a5d86: "Copyright Warning",
    0x7b1954cb: "Youmu's Quick Draw: Duel 2 Loading",
    0x801b5377: "Yama-Ton Slam: Stage 3 Loading",
    0x88155b73: "Minigame Board",
    0x8b195bb1: "Power Scalers: How to Play",
    0x901b51da: "Yama-Ton Slam: Stage 2 Opponent's Hit (Charge)",
    0x981a5624: "Youmu's Quick Draw: Defeat",
    0xa01b4d5e: "Takane's Jam Shack",
    0xa01b580a: "Power Scalers: In-Game",
    0xa81a5cd6: "The Moriya Scale: Victory",
    0xb01b533c: "Yama-Ton Slam: Stage 2 Loading",
    0xb81a570e: "Yama-Ton Slam: Start, Yama-Ton",
    0xbb195a52: "Power Scalers: Defeat",
    0xc01b5078: "Yama-Ton Slam: Player's Hit (Launch, Splitter)",
    0xc81a55b0: "Youmu's Quick Draw: Title Screen",
    0xcb1959dc: "Power Scalers: Start, Power",
    0xd01b52c6: "Yama-Ton Slam: Stage 3 Opponent's Hit (Launch)",
    0xd1184b35: "Youmu's Quick Draw: Duel 3 In-Game",
    0xd1184e75: "Youmu's Quick Draw: Duel 2 In-Game",
    0xd1184efe: "Youmu's Quick Draw: Duel 1 In-Game",
    0xd81a5d4b: "The Moriya Scale: Defeat",
    0xe01b5164: "Yama-Ton Slam: Stage 1 Loading",
    0xeb195de4: "Title Screen",
    0xf01b503d: "Yama-Ton Slam: Player's Hit (Launch, Strong)",
    0xf81a587f: "Yama-Ton Slam: Victory"
}

SceneNameLookup = {}
for key in SceneIDLookup {
    SceneNameLookup[SceneIDLookup[key]] = key
}

scene_id = dword(0x00c521)
text_address = 0x00c929

power_scalers_score = word(0x00cb9a)
power_scalers_chances_left = byte(0x00cb9c)

function track_playing_in_shack(name) {
    return once(ascii_string_equals(text_address, name))
}

function scene_name_equals(name) {
    return scene_id == SceneNameLookup[name]
}

// Score 6 points in Power Scalers
achievement(
    title = "I Don't Get It",
    points = 2,
    type = "progression",
    description = "Score 6 points in Power Scalers",
    trigger = scene_id == SceneNameLookup["Power Scalers: In-Game"]
           && prev(power_scalers_score) == 5 && power_scalers_score == 6
)

// Score 10 points in Power Scalers without any mistakes
achievement(
    title = "So Cirno's the Strongest?",
    points = 3,
    description = "Score 10 points in Power Scalers without any mistakes",
    trigger = scene_id == SceneNameLookup["Power Scalers: In-Game"]
           && power_scalers_chances_left == 3
           && trigger_when(prev(power_scalers_score) == 9 && power_scalers_score == 10)
)

// Listen to all five tracks in Takane's Jam Shack
// Text = track names [5]
// Reset if not Takane's Jam Shack
achievement(
    title = "Walking Banditry",
    points = 1,
    description = "Visit Takane's Jam Shack and check out her entire collection",
    trigger = tally_of(TrackNames, 5, track_playing_in_shack)
           && never(scene_id != SceneNameLookup["Takane's Jam Shack"])
)

// Climb all the way up in The Moriya Scale
// The Moriya Scale: In-Game 2 -> The Moriya Scale: Victory
achievement(
    title = "A Faithful Climb",
    points = 3,
    type = "progression",
    description = "Climb all the way up the mountain in The Moriya Scale",
    trigger = prev(scene_id) == SceneNameLookup["The Moriya Scale: In-Game 2"]
           && scene_id == SceneNameLookup["The Moriya Scale: Victory"]
)

// Outmuscle all of the contestants in Yama-Ton Slam
// Yama-Ton Slam: Player's Hit (Splitting Mountain) -> Yama-Ton Slam: Victory
achievement(
    title = "Cirno's Actually Not the Strongest",
    points = 3,
    type = "progression",
    description = "Outmuscle all of the contestants in Yama-Ton Slam",
    trigger = prev(scene_id) == SceneNameLookup["Yama-Ton Slam: Player's Hit (Splitting Mountain)"]
           && scene_id == SceneNameLookup["Yama-Ton Slam: Victory"]
)

// Complete Yama-Ton Slam with unrivaled strength, splitting the mountain in two on every stage
// Yama-Ton Slam: Stage 1 Loading -> Yama-Ton Slam: Stage 1 Opponent's Hit (Charge) [hit, challenge start]
// Yama-Ton Slam: Player's Hit (Splitting Mountain) -> Yama-Ton Slam: Stage 2 Loading [1/3]
// Yama-Ton Slam: Player's Hit (Splitting Mountain) -> Yama-Ton Slam: Stage 3 Loading [2/3]
// Yama-Ton Slam: Player's Hit (Splitting Mountain) -> Yama-Ton Slam: Victory [3/3]
// Reset on Yama-Ton Slam: Defeat
// Reset on Yama-Ton Slam: Player's Hit (Launch, Weak)
// Reset on Yama-Ton Slam: Player's Hit (Launch, Strong)
// Reset on Copyright Warning
achievement(
    title = "Upsized Advantage",
    points = 5,
    description = "Complete Yama-Ton Slam with unrivaled strength, splitting the mountain in two on every stage",
    trigger = once(prev(scene_id) == SceneNameLookup["Yama-Ton Slam: Stage 1 Loading"]
           && scene_id == SceneNameLookup["Yama-Ton Slam: Stage 1 Opponent's Hit (Charge)"])
           && trigger_when(
               once(prev(scene_id) == SceneNameLookup["Yama-Ton Slam: Player's Hit (Splitting Mountain)"]
               && scene_id == SceneNameLookup["Yama-Ton Slam: Stage 2 Loading"])
               && once(prev(scene_id) == SceneNameLookup["Yama-Ton Slam: Player's Hit (Splitting Mountain)"]
               && scene_id == SceneNameLookup["Yama-Ton Slam: Stage 3 Loading"])
               && once(prev(scene_id) == SceneNameLookup["Yama-Ton Slam: Player's Hit (Splitting Mountain)"]
               && scene_id == SceneNameLookup["Yama-Ton Slam: Victory"])
           )
           && never(scene_id == SceneNameLookup["Yama-Ton Slam: Defeat"])
           && never(scene_id == SceneNameLookup["Yama-Ton Slam: Player's Hit (Launch, Weak)"])
           && never(scene_id == SceneNameLookup["Yama-Ton Slam: Player's Hit (Launch, Strong)"])
           && never(scene_id == SceneNameLookup["Copyright Warning"])
)

// Prove your speed in Youmu's Quick Draw
// Youmu's Quick Draw: Duel 3 In-Game -> Youmu's Quick Draw: Victory
achievement(
    title = "Flash in the Night",
    points = 3,
    type = "progression",
    description = "Prove your speed in Youmu's Quick Draw",
    trigger = prev(scene_id) == SceneNameLookup["Youmu's Quick Draw: Duel 3 In-Game"]
           && scene_id == SceneNameLookup["Youmu's Quick Draw: Victory"]
)

// Power Scalers Leaderboard
leaderboard(
    title = "Power Scalers: High Score",
    description = "",
    start = scene_id == SceneNameLookup["Power Scalers: In-Game"]
            && prev(power_scalers_chances_left) == 1
            && power_scalers_chances_left == 0,
    cancel = always_false(),
    submit = always_true(), 
    value = power_scalers_score
)

rich_presence_conditional_display(
    scene_id == SceneNameLookup["Copyright Warning"],
    "Learning about trademarks..."
)

rich_presence_conditional_display(
    scene_id == SceneNameLookup["Title Screen"],
    "At the title screen"
)

rich_presence_conditional_display(
    scene_id == SceneNameLookup["Minigame Board"],
    "Trying to decide what to do next..."
)

rich_presence_conditional_display(
    scene_id == SceneNameLookup["Takane's Jam Shack"],
    "Jamming out in Takane's Jam Shack"
)

yamaton_screens = []
for scene_name in SceneNameLookup {
    if substring(scene_name, 0, length=length("Yama-Ton Slam")) == "Yama-Ton Slam" {
        array_push(yamaton_screens, scene_name)
    }
}

rich_presence_conditional_display(
    any_of(yamaton_screens, scene_name_equals),
    "Showing off their strength in Yama-Ton Slam"
)

scalers_screens = []
for scene_name in SceneNameLookup {
    if substring(scene_name, 0, length=length("Power Scalers")) == "Power Scalers" {
        array_push(scalers_screens, scene_name)
    }
}

rich_presence_conditional_display(
    any_of(scalers_screens, scene_name_equals),
    "Showing off their knowledge in Power Scalers"
)

moriya_screens = []
for scene_name in SceneNameLookup {
    if substring(scene_name, 0, length=length("The Moriya Scale")) == "The Moriya Scale" {
        array_push(moriya_screens, scene_name)
    }
}

rich_presence_conditional_display(
    any_of(moriya_screens, scene_name_equals),
    "Showing off their endurance in The Moriya Scale"
)

youmu_screens = []
for scene_name in SceneNameLookup {
    if substring(scene_name, 0, length=length("Youmu's Quick Draw")) == "Youmu's Quick Draw" {
        array_push(youmu_screens, scene_name)
    }
}

rich_presence_conditional_display(
    any_of(youmu_screens, scene_name_equals),
    "Showing off their speed in Youmu's Quick Draw"
)

rich_presence_display(
    "Training..."
)
