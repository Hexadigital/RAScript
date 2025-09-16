// ~Homebrew~ Uma Musume Delish Derby
// #ID = 34313

MapIDLookup = {
    0x00000000: "Reset",
    0x105e0314: "Title Screen",
    0x10581514: "Choose Your Uma",
    0x0f52ef14: "Waiting Room",
    0x1056d214: "Stage Select",
    0x025f3a14: "Track: Area 1",
    0x035f9814: "Track: Area 2",
    0x045ffe14: "Track: Area 3",
    0x05534d14: "Track: Area 4",
    0x0653ab14: "Track: Area 5",
    0x08546214: "Halls: Area 1",
    0x0a550114: "Halls: Area 2",
    0x0b55c314: "Haunted House",
    0x0b561914: "Halls: Area 3",
    0x105d2714: "Piano Room",
    0x105daf14: "Hidden Lab",
    0x0c567714: "Halls: Area 4",
    0x105b3014: "Transition",
    0x10585014: "Results",
    
}

MapNameLookup = {}
for key in MapIDLookup {
    MapNameLookup[MapIDLookup[key]] = key
}

CharIDLookup = {
    0x01: "Oguri Cap",
    0x02: "Meisho Doto",
    0x03: "Seiun Sky",
    0x04: "Special Week",
    0x05: "Vodka",
    0x06: "Twin Turbo",
    0x07: "Mejiro McQueen",
    0x08: "Daiwa Scarlet",
    0x09: "Haru Urara",
    0x0a: "Biwa Hayahide",
    0x0b: "T.M. Opera O",
    0x0c: "Taiki Shuttle",
    0x0d: "Matikanetannhauser",
    0x0e: "Sakura Laurel",
    0x0f: "Marvelous Sunday",
    0x10: "Hishi Miracle",
    0x11: "Nice Nature",
    0x12: "Winning Ticket",
}

CharNameLookup = {}
for key in CharIDLookup {
    CharNameLookup[CharIDLookup[key]] = key
}

CharacterGroups = {
    "Dash": [
        [
            "Oguri Cap",
            "Meisho Doto",
            "Seiun Sky",
        ],
        [
            "Biwa Hayahide",
            "T.M. Opera O",
            "Taiki Shuttle",
        ]
    ],
    "Jump": [
        [
            "Special Week",
            "Vodka",
            "Twin Turbo",
        ],
        [
            "Matikanetannhauser",
            "Sakura Laurel",
            "Marvelous Sunday",
        ]
    ],
    "Stomp": [
        [
            "Mejiro McQueen",
            "Daiwa Scarlet",
            "Haru Urara",
        ],
        [
            "Hishi Miracle",
            "Nice Nature",
            "Winning Ticket",
        ]
    ],
}

Courses = ["Track", "Halls"]

FinalAreas = {
    "Track": "Track: Area 5",
    "Halls": "Halls: Area 4"
}

CheevoNames = {
    "DashTrack": "Land Race",
    "DashHalls": "Running in the Halls",
    "JumpTrack": "Height Advantage",
    "JumpHalls": "Jumping Over Desks",
    "StompTrack": "Leaving Tracks",
    "StompHalls": "Smashing Through",
}

map_id = dword(0x00c520)
time = word(0x00cb9a)
points = word(0x00cb98)
selected_character = byte(0x00cb96)
at_title = map_id == MapNameLookup["Reset"]
       || map_id == MapNameLookup["Title Screen"]
in_game = map_id != MapNameLookup["Reset"]
       && map_id != MapNameLookup["Title Screen"]

character_is_valid = selected_character >= 0x01 && selected_character <= 0x12

// Complete the Track course with any horse
achievement(
    title = "Straightforward",
    type = "progression",
    points = 2,
    description = "Complete the Track course with any horse",
    trigger = character_is_valid
    && prev(map_id) == MapNameLookup[FinalAreas["Track"]]
    && map_id == MapNameLookup["Transition"]
)

// Complete the Halls course with any horse
achievement(
    title = "Obstacle Course",
    type = "progression",
    points = 2,
    description = "Complete the Halls course with any horse",
    trigger = character_is_valid
    && prev(map_id) == MapNameLookup[FinalAreas["Halls"]]
    && map_id == MapNameLookup["Transition"]
)

// Standard Cheevos
for chartype in CharacterGroups {
    for i in range(0, 1) {
        keyword = format("{0}{1}", chartype, Courses[i])
        achievement(
            title = CheevoNames[keyword],
            points = 5,
            description = format(
                                "Complete the {0} course as {1}, {2}, or {3}",
                                Courses[i],
                                CharacterGroups[chartype][i][0],
                                CharacterGroups[chartype][i][1], 
                                CharacterGroups[chartype][i][2]
                            ),
            trigger = (
                        selected_character == CharNameLookup[CharacterGroups[chartype][i][0]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][i][1]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][i][2]]
                      )
                      && prev(map_id) == MapNameLookup[FinalAreas[Courses[i]]]
                      && map_id == MapNameLookup["Transition"]
        )
    }
}

// U=ma^2 = Break into Agnes Tachyon's lab and participate in an experiment
achievement(
    title = "U=ma^2",
    points = 3,
    description = "Break into Agnes Tachyon's lab and participate in an experiment",
    trigger = character_is_valid
    && map_id == MapNameLookup["Hidden Lab"]
    && points > prev(points)
)

// Soaring Through the Sky: Seiun Sky Speedrun
achievement(
    title = "Soaring Through the Sky",
    points = 10,
    description = "Complete the Track course as Seiun Sky in 38 seconds or less",
    trigger = selected_character == CharNameLookup["Seiun Sky"]
    && prev(map_id) == MapNameLookup[FinalAreas["Track"]]
    && map_id == MapNameLookup["Transition"]
    && time <= 38
)

// Haru's Heavenly Harvest: Haru Urara Points
achievement(
    title = "Haru's Heavenly Harvest",
    points = 3,
    description = "Complete the Halls course as Haru Urara with 300 points or more",
    trigger = selected_character == CharNameLookup["Haru Urara"]
    && prev(map_id) == MapNameLookup[FinalAreas["Halls"]]
    && map_id == MapNameLookup["Transition"]
    && points >= 300
)

// Leaderboards
for chartype in CharacterGroups {
    for course in Courses {
        leaderboard(
            title = format("{0}: {1} Type Speedrun", course, chartype),
            description = "",
            start  = prev(map_id) == MapNameLookup[FinalAreas[course]]
                     && map_id == MapNameLookup["Transition"]
                     && (
                        selected_character == CharNameLookup[CharacterGroups[chartype][0][0]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][0][1]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][0][2]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][0]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][1]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][2]]
                      ),
            cancel = always_false(),
            submit = always_true(),
            value  = time,
            lower_is_better = true,
            format = "SECS"
        )
        leaderboard(
            title = format("{0}: {1} Type Point Maniac", course, chartype),
            description = "",
            start  = prev(map_id) == MapNameLookup[FinalAreas[course]]
                     && map_id == MapNameLookup["Transition"]
                     && (
                        selected_character == CharNameLookup[CharacterGroups[chartype][0][0]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][0][1]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][0][2]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][0]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][1]]
                        || selected_character == CharNameLookup[CharacterGroups[chartype][1][2]]
                      ),
            cancel = always_false(),
            submit = always_true(),
            value  = points
        )
    }
}

rich_presence_conditional_display(
    at_title,
    "At the title screen"
)

rich_presence_conditional_display(
    map_id == MapNameLookup["Choose Your Uma"],
    "Selecting a horse"
)

rich_presence_conditional_display(
    map_id == MapNameLookup["Results"],
    "On the results screen"
)

rich_presence_conditional_display(
    map_id == MapNameLookup["Waiting Room"] || map_id == MapNameLookup["Stage Select"],
    "{0} • {1}",
    rich_presence_lookup("Horse", selected_character, CharIDLookup, fallback="Unknown Horse"),
    rich_presence_lookup("Stage", map_id, MapIDLookup, fallback="Unknown Area")
)

rich_presence_display(
    "{0} • {1} • Time: {2} • Points: {3}",
    rich_presence_lookup("Horse", selected_character, CharIDLookup, fallback="Unknown Horse"),
    rich_presence_lookup("Stage", map_id, MapIDLookup, fallback="Unknown Area"),
    rich_presence_value("Number", time),
    rich_presence_value("Number", points)
)
