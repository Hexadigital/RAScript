// Target Hits
// #ID = 25046

AreaLookup = {
    0x01: "Shooting Range",
    0x02: "Desert Chariots",
    0x03: "Track Wagons"
}

AreaNameToID = {}
for key in AreaLookup {
    AreaNameToID[AreaLookup[key]] = key
}

SceneLookup = {
    0x00: "Scene 1, Stage 1",
    0x01: "Scene 1, Stage 2",
    0x02: "Scene 1, Stage 3",
    0x03: "Scene 2, Stage 1",
    0x04: "Scene 2, Stage 2",
    0x05: "Scene 2, Stage 3",
    0x06: "Scene 3, Stage 1",
    0x07: "Scene 3, Stage 2",
    0x08: "Scene 3, Stage 3",
    0x09: "Scene 4, Stage 1",
    0x0A: "Scene 4, Stage 2",
    0x0B: "Scene 4, Stage 3",
    0x0C: "Scene 5, Stage 1",
    0x0D: "Scene 5, Stage 2",
    0x0E: "Scene 5, Stage 3",
    0x0F: "Scene 6, Stage 1",
    0x10: "Scene 6, Stage 2",
    0x11: "Scene 6, Stage 3",
    0x12: "Ending",
}

SceneNameToID = {}
for key in SceneLookup {
    SceneNameToID[SceneLookup[key]] = key
}

score = word(0x004f8a) + (byte(0x004f88) * 65536) + (byte(0x004f89) * 6777216)

shots_hit = byte(0x0099ec)
bonus_hits = byte(0x00db50)
bonus_hits_track_wagons = byte(0x00dc22)
// perfect_bonus = prev(shots_hit) == 19 && shots_hit == 20
perfect_bonus = prev(bonus_hits) == 1 && bonus_hits == 0 && shots_hit >= 19
perfect_bonus_track_wagons = prev(bonus_hits_track_wagons) == 1 && bonus_hits_track_wagons == 0 && shots_hit >= 19

shooting_range_scene = byte(0x009a28) // used for desert chariots too
track_wagons_scene = byte(0x009a2a)
selected_game = byte(0x009a22)
in_menu = selected_game == 0x00

lives_remaining = byte(0x00db66)
shooting_range_game_over = prev(lives_remaining) == 1 && lives_remaining == 0
&& shooting_range_scene != SceneNameToID["Ending"]
track_wagons_game_over = prev(lives_remaining) == 1 && lives_remaining == 0
&& track_wagons_scene != SceneNameToID["Ending"]

p1_inactive = byte(0x00dbf2) == 0
p1_active = byte(0x00dbf2) == 1
p2_inactive = byte(0x00dbf4) == 0
p2_active = byte(0x00dbf4) == 1

// Clear Scene 1 of any game in single-player as P1! 1p
achievement(
    type = "progression",
    title = "Warning Shot",
    points = 1,
    description = "Clear Scene 1 of any game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && ((selected_game == AreaNameToID["Shooting Range"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 1, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 2, Stage 1"])
              || (selected_game == AreaNameToID["Desert Chariots"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 1, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 2, Stage 1"])
              || (selected_game == AreaNameToID["Track Wagons"]
              && prev(track_wagons_scene) == SceneNameToID["Scene 1, Stage 3"]
              && track_wagons_scene == SceneNameToID["Scene 2, Stage 1"]))
)

// Clear Scene 2 of the Shooting Range in single-player as P1! 3p
achievement(
    type = "progression",
    title = "Shooting Range: Novice",
    points = 3,
    description = "Clear Scene 2 of the Shooting Range game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Shooting Range"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 2, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 3, Stage 1"]
)

// Clear Scene 4 of the Shooting Range in single-player as P1! 5p
achievement(
    type = "progression",
    title = "Shooting Range: Intermediate",
    points = 5,
    description = "Clear Scene 4 of the Shooting Range game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Shooting Range"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 4, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 5, Stage 1"]
)

// Clear Scene 6 of the Shooting Range in single-player as P1! 10p
achievement(
    type = "progression",
    title = "Shooting Range: Expert",
    points = 10,
    description = "Clear Scene 6 of the Shooting Range game in single-player as P1!",
    trigger = prev(p1_active)
              && p2_inactive
              && selected_game == AreaNameToID["Shooting Range"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
              && shooting_range_scene == SceneNameToID["Ending"]
)

// Clear Scene 2 of the Desert Chariots game in single-player as P1! 3p
achievement(
    type = "progression",
    title = "Desert Chariots: Novice",
    points = 3,
    description = "Clear Scene 2 of the Desert Chariots game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Desert Chariots"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 2, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 3, Stage 1"]
)

// Clear Scene 4 of the Desert Chariots game in single-player as P1! 5p
achievement(
    type = "progression",
    title = "Desert Chariots: Intermediate",
    points = 5,
    description = "Clear Scene 4 of the Desert Chariots game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Desert Chariots"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 4, Stage 3"]
              && shooting_range_scene == SceneNameToID["Scene 5, Stage 1"]
)

// Clear Scene 6 of the Desert Chariots game in single-player as P1! 10p
achievement(
    type = "progression",
    title = "Desert Chariots: Expert",
    points = 10,
    description = "Clear Scene 6 of the Desert Chariots game in single-player as P1!",
    trigger = prev(p1_active)
              && p2_inactive
              && selected_game == AreaNameToID["Desert Chariots"]
              && prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
              && shooting_range_scene == SceneNameToID["Ending"]
)

// Clear Scene 2 of the Track Wagons game in single-player as P1! 3p
achievement(
    type = "progression",
    title = "Track Wagons: Novice",
    points = 3,
    description = "Clear Scene 2 of the Track Wagons game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Track Wagons"]
              && prev(track_wagons_scene) == SceneNameToID["Scene 2, Stage 3"]
              && track_wagons_scene == SceneNameToID["Scene 3, Stage 1"]
)

// Clear Scene 4 of the Track Wagons game in single-player as P1! 5p
achievement(
    type = "progression",
    title = "Track Wagons: Intermediate",
    points = 5,
    description = "Clear Scene 4 of the Track Wagons game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Track Wagons"]
              && prev(track_wagons_scene) == SceneNameToID["Scene 4, Stage 3"]
              && track_wagons_scene == SceneNameToID["Scene 5, Stage 1"]
)

// Clear Scene 6 of the Track Wagons game in single-player as P1! 10p
achievement(
    type = "progression",
    title = "Track Wagons: Expert",
    points = 10,
    description = "Clear Scene 6 of the Track Wagons game in single-player as P1!",
    trigger = prev(p1_active)
              && p2_inactive
              && selected_game == AreaNameToID["Track Wagons"]
              && prev(track_wagons_scene) == SceneNameToID["Scene 6, Stage 3"]
              && track_wagons_scene == SceneNameToID["Ending"]
)

// Get a perfect on any bonus round in the Shooting Range game in single-player as P1! 5p
achievement(
    title = "Focused",
    points = 5,
    description = "Get a perfect on any bonus round in the Shooting Range game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Shooting Range"]
              && perfect_bonus
)

// Get a perfect on any bonus round in the Desert Chariots game in single-player as P1! 5p
achievement(
    title = "Desert Eagle",
    points = 5,
    description = "Get a perfect on any bonus round in the Desert Chariots game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Desert Chariots"]
              && perfect_bonus
)

// Get a perfect on any bonus round in the Track Wagons game in single-player as P1! 5p
achievement(
    title = "Rolling Revolver",
    points = 5,
    description = "Get a perfect on any bonus round in the Track Wagons game in single-player as P1!",
    trigger = p1_active
              && p2_inactive
              && selected_game == AreaNameToID["Track Wagons"]
              && perfect_bonus_track_wagons
)

// Complete the Shooting Range game without using a continue in single-player as P1! 25p
achievement(
    title = "Perfect Sniper",
    type = "missable",
    points = 25,
    description = "Complete the Shooting Range game without using a continue in single-player as P1!",
    trigger = p2_inactive
              && selected_game == AreaNameToID["Shooting Range"]
              && once(p1_active
              && prev(shooting_range_scene) == SceneNameToID["Scene 1, Stage 1"]
              && shooting_range_scene == SceneNameToID["Scene 1, Stage 2"])
              && trigger_when(prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
              && shooting_range_scene == SceneNameToID["Ending"])
              && never(p2_active)
              && never(shooting_range_game_over)
              && never(shooting_range_scene < prev(shooting_range_scene))
)

// Complete the Desert Chariots game without using a continue in single-player as P1! 25p
achievement(
    title = "Sandy Sharp Shot",
    type = "missable",
    points = 25,
    description = "Complete the Desert Chariots game without using a continue in single-player as P1!",
    trigger = p2_inactive
              && selected_game == AreaNameToID["Desert Chariots"]
              && once(p1_active
              && prev(shooting_range_scene) == SceneNameToID["Scene 1, Stage 1"]
              && shooting_range_scene == SceneNameToID["Scene 1, Stage 2"])
              && trigger_when(prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
              && shooting_range_scene == SceneNameToID["Ending"])
              && never(p2_active)
              && never(shooting_range_game_over)
              && never(shooting_range_scene < prev(shooting_range_scene))
)

// Complete the Track Wagons game without using a continue in single-player as P1! 25p
achievement(
    title = "Wheeled Weapon of War",
    type = "missable",
    points = 25,
    description = "Complete the Track Wagons game without using a continue in single-player as P1!",
    trigger = p2_inactive
              && selected_game == AreaNameToID["Track Wagons"]
              && once(p1_active
              && prev(track_wagons_scene) == SceneNameToID["Scene 1, Stage 1"]
              && track_wagons_scene == SceneNameToID["Scene 1, Stage 2"])
              && trigger_when(prev(track_wagons_scene) == SceneNameToID["Scene 6, Stage 3"]
              && track_wagons_scene == SceneNameToID["Ending"])
              && never(p2_active)
              && never(track_wagons_game_over)
              && never(track_wagons_scene < prev(track_wagons_scene))
)

leaderboard(
    title = "High Score: Shooting Range",
    description = "",
    start = prev(p1_active)
         && p2_inactive
         && selected_game == AreaNameToID["Shooting Range"]
         && prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
         && shooting_range_scene == SceneNameToID["Ending"],
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Desert Chariots",
    description = "",
    start = prev(p1_active)
         && p2_inactive
         && selected_game == AreaNameToID["Desert Chariots"]
         && prev(shooting_range_scene) == SceneNameToID["Scene 6, Stage 3"]
         && shooting_range_scene == SceneNameToID["Ending"],
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

leaderboard(
    title = "High Score: Track Wagons",
    description = "",
    start = prev(p1_active)
         && p2_inactive
         && selected_game == AreaNameToID["Track Wagons"]
         && prev(track_wagons_scene) == SceneNameToID["Scene 6, Stage 3"]
         && track_wagons_scene == SceneNameToID["Ending"],
    cancel = always_false(),
    submit = always_true(), 
    value = score
)

rich_presence_conditional_display(
    in_menu,
    "In a menu"
)

rich_presence_conditional_display(
    p2_active,
    "Playing multiplayer • Achievements disabled"
)

rich_presence_conditional_display(
    selected_game == AreaNameToID["Track Wagons"] && track_wagons_scene == SceneNameToID["Ending"],
    "Watching the ending • Score: {0}",
    rich_presence_value("Round", score)
)

rich_presence_conditional_display(
    selected_game != AreaNameToID["Track Wagons"] && shooting_range_scene == SceneNameToID["Ending"],
    "Watching the ending • Score: {0}",
    rich_presence_value("Round", score)
)

rich_presence_conditional_display(
    selected_game == AreaNameToID["Track Wagons"],
    "{0} • {1} • Score: {2}",
    rich_presence_lookup("Game", selected_game, AreaLookup, fallback="Unknown Game"),
    rich_presence_lookup("Scene", track_wagons_scene, SceneLookup, fallback="Unknown Scene"),
    rich_presence_value("Round", score)
)

rich_presence_display(
    "{0} • {1} • Score: {2}",
    rich_presence_lookup("Game", selected_game, AreaLookup, fallback="Unknown Game"),
    rich_presence_lookup("Scene", shooting_range_scene, SceneLookup, fallback="Unknown Scene"),
    rich_presence_value("Round", score)
)
