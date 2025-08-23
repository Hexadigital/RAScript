// ~Homebrew~ Melanie and the Magic Forest
// #ID = 21558

MapIDLookup = {
    0x104b2713: "the Title Screen",
    0x0b5e5b12: "the Mushroom Village",
    0x0f5d1d12: "the Rocky Trail",
    0x0b57dd12: "the Mushroom Crossroad",
    0x0f5f7d12: "Mama Pup's Kitchen",
    0x0a56a612: "the Northern Trail",
    0x0f4aa513: "the Secret Clubhouse",
    0x0f5ff312: "Mama Pup's Bedroom",
    0x0e4a3613: "the River Trail",
    0x0f573912: "the Southern Trail",
    0x0f5fb812: "Mama Pup's Living Room",
    0x0f581812: "the Southern Crossroad",
    0x0a585312: "Woodsville",
    0x0f54b612: "Amethyst Cave",
    0x0e5adf12: "Mavis' Yard",
    0x0f5c0b12: "Melanie's Yard",
    0x0b593112: "the Lagoon",
    0x0f542312: "the Cave Entrance",
    0x0f5ce212: "Melanie's House",
    0x0b53ad12: "Allie's Farm",
    0x0f53e812: "Allie's House",
    0x0e49ae13: "the River Bridge",
    0x0e5eda12: "the Eastern Trail",
    0x104fbf12: "the Dev's Splash Screen",
    0x0f4f2d12: "the Musician's Splash Screen",
    0x0d4b9d13: "the Scrolling Title",
    0x0f554112: "their Backpack",
    0x0f5da212: "the Portal",
    0x0e5b1a12: "a family's ending cutscene",
    0x0f5a0812: "a gardener's ending cutscene",
    0x0f4aec13: "a club's ending cutscene",
    0x0f58f612: "a dog's ending cutscene",
    0x104b6213: "the Thank You screen",
    0x0d557c12: "the Credits"
}

MapNameLookup = {}
for key in MapIDLookup {
    MapNameLookup[MapIDLookup[key]] = key
}

map_id = dword(0x00c520)
cookie_bitflag = bit0(0x00cbcc)
kiba_ending_bitflag = bit0(0x00cc10)
diakon_radish_address = 0x00cbe4
green_onion_address = 0x00cbea
artichoke_address = 0x00cbec
squash_address = 0x00cbee
daikon_radish_status = byte(diakon_radish_address)
allie_ending_bitflag = bit0(0x00cc0c)
trash_bags_cleared = byte(0x00cbbe)
tournament_ending_bitflag = bit0(0x00cc0a)
have_tote_bag_bitflag = bit0(0x00cc08)
found_pup_total = byte(0x00cba0)
all_pups_found_ending_bitflag = bit0(0x00cc0e)
game_completed_bitflag = bit0(0x00cc40)
at_title = map_id == MapNameLookup["the Dev's Splash Screen"]
       || map_id == MapNameLookup["the Musician's Splash Screen"]
       || map_id == MapNameLookup["the Scrolling Title"]
       || map_id == MapNameLookup["the Title Screen"]
in_game = map_id != MapNameLookup["the Dev's Splash Screen"]
       && map_id != MapNameLookup["the Musician's Splash Screen"]
       && map_id != MapNameLookup["the Scrolling Title"]
       && map_id != MapNameLookup["the Title Screen"]

// TODO
achievement(
    title = "Not for Humans", points = 1, type="progression",
    description = "Accept Mama Pup's cookie.",
    trigger = map_id == MapNameLookup["Mama Pup's Kitchen"] && cookie_bitflag > prev(cookie_bitflag)
)

// TODO
achievement(
    title = "Loyal Follower", points = 2,
    description = "Earn Kiba's affection.",
    trigger = map_id == MapNameLookup["Melanie's House"] && kiba_ending_bitflag > prev(kiba_ending_bitflag)
)

// TODO
achievement(
    title = "World's Fastest Daikon", points = 1, type="progression",
    description = "Grow a Daikon Radish on Allie's Farm.",
    trigger = map_id == MapNameLookup["Allie's Farm"] && prev(daikon_radish_status) == 16 && daikon_radish_status == 32
)

// TODO
achievement(
    title = "Grow n' Go", points = 2,
    description = "Prove the power of Allie N's watering agent.",
    trigger = map_id == MapNameLookup["Allie's House"] && allie_ending_bitflag > prev(allie_ending_bitflag)
)

// TODO
achievement(
    title = "Lagoon Fish", points = 1, type="progression",
    description = "Clean up the trash and meet the Lagoon Fish.",
    trigger = map_id == MapNameLookup["the Lagoon"] && prev(trash_bags_cleared) == 1 && trash_bags_cleared == 2
)

// TODO
achievement(
    title = "Sprout Fighter", points = 2,
    description = "Ensure that Sprout Kid makes it to the tournament.",
    trigger = map_id == MapNameLookup["the Secret Clubhouse"] && tournament_ending_bitflag > prev(tournament_ending_bitflag)
)

// TODO
achievement(
    title = "Baked Goods", points = 1, type="progression",
    description = "Deliver the Tote Bag to Mavis.",
    trigger = map_id == MapNameLookup["the River Bridge"] && have_tote_bag_bitflag < prev(have_tote_bag_bitflag)
)

// TODO
achievement(
    title = "Bloom Power", points = 3, type="missable",
    description = "Grow four flowers at once.",
    trigger = map_id == MapNameLookup["Allie's Farm"] &&
              measured((bit3(diakon_radish_address) + bit3(green_onion_address) + bit3(artichoke_address) + bit3(squash_address)) == 4)
)

// TODO
achievement(
    title = "Litterquest", points = 4,
    description = "Find all five of Mama Pup's children.",
    trigger = map_id == MapNameLookup["Mama Pup's Kitchen"] && found_pup_total >= 6 && all_pups_found_ending_bitflag > prev(all_pups_found_ending_bitflag)
)

// TODO
achievement(
    title = "Mushroom Spirit", points = 5, type="win_condition",
    description = "Wake up the Mushroom Spirit and beat the game.",
    trigger = map_id == MapNameLookup["the Portal"] && game_completed_bitflag > prev(game_completed_bitflag)
)

// TODO
achievement(
    title = "Melanie's Adventure", points = 5,
    description = "Beat the game with all four cutscenes unlocked.",
    trigger = map_id == MapNameLookup["the Portal"] && measured((tournament_ending_bitflag + allie_ending_bitflag + all_pups_found_ending_bitflag + kiba_ending_bitflag) == 4) &&
              game_completed_bitflag > prev(game_completed_bitflag)
)

// TODO
achievement(
    title = "Wake Up Rush", points = 5,
    description = "Beat the game in less than 8 minutes.",
    trigger = trigger_when(map_id == MapNameLookup["the Portal"]) && trigger_when(game_completed_bitflag > prev(game_completed_bitflag)) &&
              repeated(60, in_game) && unless(repeated(28860, in_game)) &&
              (always_false() || (never(at_title)))
)

// TODO
leaderboard(
    title = "Fastest Clear",
    description = "Beat the game as fast as you can!",
    start  = repeated(60, in_game) && never(at_title),
    cancel = repeated(5, at_title) && never(in_game),
    submit = map_id == MapNameLookup["the Portal"] && game_completed_bitflag > prev(game_completed_bitflag),
    value  = measured(tally(0, in_game)),
    format = "FRAMES"
)

// TODO
leaderboard(
    title = "Fastest 100% Clear",
    description = "Beat the game as fast as you can with all four cutscenes unlocked!",
    start  = repeated(60, in_game) && never(at_title),
    cancel = repeated(5, at_title) && never(in_game),
    submit = map_id == MapNameLookup["the Portal"] && tournament_ending_bitflag == 1 && allie_ending_bitflag == 1 && all_pups_found_ending_bitflag == 1 &&
             kiba_ending_bitflag == 1 && game_completed_bitflag > prev(game_completed_bitflag),
    value  = measured(tally(0, in_game)),
    format = "FRAMES"
)

leaderboard(
    id = 51915, title = "Fastest Clear (Legacy)",
    description = "Beat the original version of the game as fast as you can!",
    start  = always_false(), // repeated(60, byte(0x00CB9E) != 0) && never(byte(0x00CB9E) == 0)
    cancel = repeated(5, byte(0x00CB9E) == 0) && never(byte(0x00CB9E) != 0),
    submit = byte(0x00c7ac) == 6 && bit0(0x00CB9C) > prev(bit0(0x00CB9C)),
    value  = measured(tally(0, byte(0x00CB9E) != 0)),
    format = "FRAMES"
)

leaderboard(
    id = 51916, title = "Fastest 100% Clear (Legacy)",
    description = "Beat the original version of the game as fast as you can with all four cutscenes unlocked!",
    start  = always_false(), // repeated(60, byte(0x00CB9E) != 0) && never(byte(0x00CB9E) == 0)
    cancel = repeated(5, byte(0x00CB9E) == 0) && never(byte(0x00CB9E) != 0),
    submit = byte(0x00c7ac) == 6 && bit0(0x00CB94) == 1 && bit0(0x00CB96) == 1 && bit0(0x00CB98) == 1 &&
             bit0(0x00CB9A) == 1 && bit0(0x00CB9C) > prev(bit0(0x00CB9C)),
    value  = measured(tally(0, byte(0x00CB9E) != 0)),
    format = "FRAMES"
)

// TODO
rich_presence_display("Exploring {0}",
    rich_presence_lookup("Map", map_id, MapIDLookup, fallback="their Journal's contents")
)
