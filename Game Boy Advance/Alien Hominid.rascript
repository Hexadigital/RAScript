// Alien Hominid
// #ID = 5068

// Warning: Unlike my other RATools scripts, a good chunk of things are left as addresses.
// These addresses are being used for the current progression-only achievements, so...

///////////////////////////
// REVISION ACHIEVEMENTS //
///////////////////////////

StageLookup = {
    0x00: "1-1",
    0x01: "1-2",
    0x02: "1-3",
    0x03: "1-4",
    0x04: "2-1",
    0x05: "2-2",
    0x06: "2-3",
    0x07: "2-4",
    0x08: "3-1",
    0x09: "3-2",
    0x0a: "3-3",
    0x0b: "3-4"
}

StageAfter = {
    "1-1": "1-2",
    "1-2": "1-3",
    "1-3": "1-4",
    "1-4": "2-1",
    "2-1": "2-2",
    "2-2": "2-3",
    "2-3": "2-4",
    "2-4": "3-1",
    "3-1": "3-2",
    "3-2": "3-3",
    "3-3": "3-4",
}

hard_cheevo_names = {
    "1-1": "Crash Landing",
    "1-2": "Waste Disposal",
    "1-3": "Tanks for Nothing",
    "1-4": "Helicarrier Takedown",
    "2-1": "Cold Cuts",
    "2-2": "Let's Split Up!",
    "2-3": "Stalin for Time",
    "2-4": "Orbital Defense",
    "3-1": "Scorpion Horde",
    "3-2": "Dig and Be Eaten",
    "3-3": "Pressing Matters",
    "3-4": "The Behemoth"
}

hard_cheevo_points = {
    "1-1": 3,
    "1-2": 4,
    "1-3": 5,
    "1-4": 10,
    "2-1": 4,
    "2-2": 4,
    "2-3": 5,
    "2-4": 10,
    "3-1": 4,
    "3-2": 5,
    "3-3": 5,
    "3-4": 10
}

StageNameToID = {}
for key in StageLookup {
    StageNameToID[StageLookup[key]] = key
}

screen_id = byte(0x000110)
stage = byte(0x000114)
chipper_killed = prev(byte(0x0003f6)) == 1 && byte(0x0003f6) == 0
hard_difficulty = byte(0x000126) == 0x03

function stage_started(name) {
    return once(stage == StageNameToID[name] && prev(screen_id) == 0x23 && screen_id == 0x1a)
}

function stage_complete(name) {
    return stage == StageNameToID[StageAfter[name]] && prev(screen_id) == 0x24 && screen_id == 0x19
}

exited = screen_id == 0x05 || screen_id == 0x00
playing_chipper_minigame = screen_id == 0x2a


for stage_name in StageNameToID {
    if stage_name != "3-4" {
        achievement(
            title = hard_cheevo_names[stage_name],
            points = hard_cheevo_points[stage_name],
            description = format("Clear Level {0} on Hard difficulty!", stage_name),
            trigger = never(exited) && hard_difficulty && stage_started(stage_name) && stage_complete(stage_name)
        )
        leaderboard(
            title = format("Level {0}: Hard Speedrun", stage_name),
            description = "",
            start  = hard_difficulty && stage_started(stage_name),
            cancel = exited,
            submit = hard_difficulty && stage_complete(stage_name),
            value = measured(always_true()),
            format = "FRAMES"
        )
   }
   
}

leaderboard(
        title = "Level 3-4: Hard Speedrun",
        description = "",
        start  = hard_difficulty && stage_started("3-4"),
        cancel = exited || byte(0x000114) != 11,
        submit = hard_difficulty && once(byte(0x0003F6) == 200) && byte(0x0003F6) == 0,
        value = measured(always_true()),
        format = "FRAMES"
    )
    
    // never(byte(0x000114) != 11) && byte(0x000126) < 4 && once(byte(0x0003F6) == 200) && byte(0x0003F6) == 0 &&
    // never(byte(0x000110) < 26) && never(word(0x00033E) < 256)

achievement(
    title = "Shredding Bombs",
    points = 3,
    description = "Complete the Chipper minigame!",
    trigger = playing_chipper_minigame && chipper_killed
)











/////////////////////////
// LEGACY ACHIEVEMENTS //
/////////////////////////

achievement(
    title = hard_cheevo_names["3-4"],
    points = hard_cheevo_points["3-4"],
    description = "Clear Level 3-4 and beat the game on Hard difficulty!",
    trigger = never(byte(0x000114) != 11) && byte(0x000126) == 3 && once(byte(0x0003F6) == 200) && byte(0x0003F6) == 0 &&
              never(byte(0x000110) < 26) && never(word(0x00033E) < 256)
)

achievement(
    title = "Fire Shot", points = 1,
    description = "Kill 20 enemies using the orange power-up",
    id = 15517, badge = "15093", published = "10/15/2014 19:50:03", modified = "5/2/2022 00:01:35",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 2 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 2 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Acid Blast", points = 1,
    description = "Kill 20 enemies using the green power-up",
    id = 15518, badge = "15094", published = "10/15/2014 19:50:04", modified = "5/2/2022 00:01:35",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 1 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 1 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Ice Ray", points = 1,
    description = "Kill 20 enemies using the blue power-up",
    id = 15519, badge = "15095", published = "10/15/2014 19:50:06", modified = "5/2/2022 00:01:36",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 3 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 3 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Laser Pulse", points = 1,
    description = "Kill 20 enemies using the red power-up",
    id = 15520, badge = "15096", published = "10/15/2014 19:50:07", modified = "5/2/2022 00:01:36",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 4 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 4 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Megu Cannon", points = 1,
    description = "Kill 20 enemies using the yellow power-up",
    id = 15521, badge = "15097", published = "10/15/2014 19:50:09", modified = "5/2/2022 00:01:36",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 5 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 5 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Photon Burst", points = 1,
    description = "Kill 20 enemies using the purple power-up",
    id = 15522, badge = "15098", published = "10/15/2014 19:50:10", modified = "5/2/2022 00:01:37",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 6 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 6 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Spread Shot", points = 1,
    description = "Kill 20 enemies using the white power-up",
    id = 15523, badge = "15099", published = "10/15/2014 19:50:12", modified = "5/2/2022 00:01:37",
    trigger = measured(tally(20,
                  (byte(0x000110) == 26 && byte(0x000470) == 7 && dword(0x000498) == prev(dword(0x000498)) &&
                  (1 + prev(dword(0x000488))) < dword(0x000488)),
                  byte(0x000110) == 26 && byte(0x000470) == 7 && dword(0x000498) == prev(dword(0x000498)) &&
                  prev(dword(0x000488)) < dword(0x000488))
              )
)

achievement(
    title = "Fowl Play", points = 1,
    description = "Score 1 point in Chicken Lickin'",
    id = 15350, badge = "14948", published = "10/14/2014 07:02:20", modified = "8/27/2022 10:40:43",
    trigger = once(byte(0x000110) == 40 && byte(0x00177C) > prev(byte(0x00177C)))
)

achievement(
    title = "Finger Lickin' Good", points = 5,
    description = "Score 12 points in Chicken Lickin'",
    id = 15351, badge = "14949", published = "10/14/2014 07:02:23", modified = "5/2/2022 00:01:37",
    trigger = measured(repeated(12, byte(0x000110) == 40 && byte(0x00177C) > prev(byte(0x00177C)))) &&
              never(byte(0x00177C) == 0)
)

achievement(
    title = "Born in the U.S.S.R.", points = 1,
    description = "Play Super Soviet Missile Mastar",
    id = 15225, badge = "14845", published = "10/12/2014 22:24:15", modified = "5/13/2020 07:21:05",
    trigger = word(0x0018E8) > 0 && byte(0x000110) == 41
)

achievement(
    title = "Soviet Score System", points = 5,
    description = "Travel over 1,000 km in Super Soviet Missile Mastar",
    id = 15226, badge = "14846", published = "10/12/2014 22:24:17", modified = "7/8/2020 15:58:49",
    trigger = word(0x0018E8) >= 1000 && byte(0x000110) == 41
)

achievement(
    title = "Soviet Nuke Master", points = 10,
    description = "Travel over 3,000 km in Super Soviet Missile Mastar",
    id = 15227, badge = "14849", published = "10/12/2014 22:30:10", modified = "7/8/2020 15:58:47",
    trigger = word(0x0018E8) >= 3000 && byte(0x000110) == 41
)

achievement(
    title = "Crash Landing [old]", points = 3, type="progression",
    description = "Clear Level 1-1",
    id = 15212, badge = "266365", published = "10/12/2014 20:33:41", modified = "5/2/2022 00:01:38",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 0 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 1 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Waste Disposal [old]", points = 3, type="progression",
    description = "Clear Level 1-2",
    id = 15213, badge = "266366", published = "10/12/2014 20:33:42", modified = "5/2/2022 00:01:38",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 1 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 2 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Tanks for Nothing [old]", points = 3, type="progression",
    description = "Clear Level 1-3",
    id = 15214, badge = "266367", published = "10/12/2014 20:33:44", modified = "5/2/2022 00:01:39",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 2 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 3 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Get to the Choppa!", points = 5, type="progression",
    description = "Clear Level 1-4 on any difficulty!",
    id = 15215, badge = "266368", published = "10/12/2014 20:33:46", modified = "5/2/2022 00:01:39",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 3 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 4 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Cold Cuts [old]", points = 4, type="progression",
    description = "Clear Level 2-1",
    id = 15216, badge = "266369", published = "10/12/2014 20:33:48", modified = "4/2/2024 14:44:12",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 4 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 5 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Let's Split Up! [old]", points = 4, type="progression",
    description = "Clear Level 2-2",
    id = 15217, badge = "266370", published = "10/12/2014 20:33:50", modified = "5/2/2022 00:01:40",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 5 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 6 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Stalin for Time [old]", points = 4, type="progression",
    description = "Clear Level 2-3",
    id = 15218, badge = "266371", published = "10/12/2014 20:33:52", modified = "5/2/2022 00:01:40",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 6 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 7 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Shield Spawner", points = 5, type="progression",
    description = "Clear Level 2-4 on any difficulty!",
    id = 15219, badge = "266372", published = "10/12/2014 20:33:53", modified = "5/2/2022 00:01:40",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 7 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 8 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Scorpion Horde [old]", points = 5, type="progression",
    description = "Clear Level 3-1",
    id = 15220, badge = "266373", published = "10/12/2014 20:33:55", modified = "5/2/2022 00:01:41",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 8 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 9 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Dig and Be Eaten [old]", points = 5, type="progression",
    description = "Clear Level 3-2",
    id = 15221, badge = "266374", published = "10/12/2014 20:33:56", modified = "5/2/2022 00:01:41",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 9 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 10 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Pressing Matters [old]", points = 5, type="progression",
    description = "Clear Level 3-3",
    id = 15222, badge = "266375", published = "10/12/2014 20:33:58", modified = "5/2/2022 00:01:41",
    trigger = never(byte(0x000110) == 5) &&
              once(byte(0x000114) == 10 && prev(byte(0x000110)) == 35 && byte(0x000110) == 26) && byte(0x000114) == 11 &&
              prev(byte(0x000110)) == 36 && byte(0x000110) == 25
)

achievement(
    title = "Phone Home", points = 10, type="win_condition",
    description = "Clear Level 3-4 and beat the game on any difficulty!",
    id = 15223, badge = "14843", published = "10/12/2014 20:33:59", modified = "5/2/2022 00:01:42",
    trigger = never(byte(0x000114) != 11) && byte(0x000126) < 4 && once(byte(0x0003F6) == 200) && byte(0x0003F6) == 0 &&
              never(byte(0x000110) < 26) && never(word(0x00033E) < 256)
)

leaderboard(
    id = 4684, title = "Chicken Lickin",
    description = "Give The Chicken A Lickin",
    start  = byte(0x000110) == 40,
    cancel = byte(0x000110) == 9 && word(0x00177C) == 0,
    submit = byte(0x000110) == 9 && word(0x00177C) > 0,
    value = word(0x00177C),
    format = "SCORE"
)
