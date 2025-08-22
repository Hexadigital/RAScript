// ~Homebrew~ Melanie and the Magic Forest
// #ID = 21558
// This is a backup of my original Jr. Dev logic,
// for the original release of the game. (not the 2025 anniversary edition)

MapLookup = {
    0x00: "the Title Screen",
    0x06: "the Mushroom Village",
    0x0E: "the Rocky Trail",
    0x17: "the Mushroom Crossroad",
    0x28: "Mama Pup's Kitchen",
    0x2B: "the Northern Trail",
    0x3A: "the Secret Clubhouse",
    0x43: "Mama Pup's Bedroom",
    0x4A: "the River Trail",
    0x51: "their Backpack",
    0x57: "the Southern Trail",
    0x58: "Mama Pup's Living Room",
    0x80: "the Southern Crossroad",
    0xAC: "the Village",
    0xB5: "Amethyst Cave",
    0xC4: "Mavis' Yard",
    0xC8: "Melanie's Yard",
    0xCC: "the Lagoon",
    0xD0: "the Cave Entrance",
    0xE2: "Melanie's House",
    0xEF: "Allie's Farm",
    0xFB: "Allie's House",
    0xFC: "the River Bridge",
    0xFD: "the Eastern Trail",
}

achievement(
    title = "Not for Humans", points = 1, type="progression",
    description = "Accept Mama Pup's cookie.",
    id = 272016, badge = "301131", published = "12/10/2022 21:20:07", modified = "12/25/2022 04:18:39",
    trigger = byte(0x00C7AC) == 40 && bit0(0x00CB1E) > prev(bit0(0x00CB1E))
)

achievement(
    title = "Loyal Follower", points = 2,
    description = "Earn Kiba's affection.",
    id = 272302, badge = "304359", published = "12/11/2022 02:38:23", modified = "12/25/2022 17:44:32",
    trigger = byte(0x00C7AC) == 226 && bit0(0x00CB9A) > prev(bit0(0x00CB9A))
)

achievement(
    title = "World's Fastest Daikon", points = 1, type="progression",
    description = "Grow a Daikon Radish in Allie's Yard.",
    id = 272017, badge = "301132", published = "12/10/2022 21:29:49", modified = "12/25/2022 04:18:40",
    trigger = byte(0x00C7AC) == 239 && prev(byte(0x00CB6A)) == 16 && byte(0x00CB6A) == 32
)

achievement(
    title = "Grow n' Go", points = 2,
    description = "Prove the power of Allie N's watering agent.",
    id = 272301, badge = "301417", published = "12/11/2022 02:32:14", modified = "12/26/2022 19:00:58",
    trigger = byte(0x00C7AC) == 251 && bit0(0x00CB96) > prev(bit0(0x00CB96))
)

achievement(
    title = "Lagoon Fish", points = 1, type="progression",
    description = "Clean up the trash and meet the Lagoon Fish.",
    id = 272305, badge = "301420", published = "12/11/2022 03:45:45", modified = "12/26/2022 18:39:32",
    trigger = byte(0x00C7AC) == 204 && prev(byte(0x00CB44)) == 1 && byte(0x00CB44) == 2
)

achievement(
    title = "Sprout Fighter", points = 2,
    description = "Ensure that Sprout Kid makes it to the tournament.",
    id = 272309, badge = "301424", published = "12/11/2022 04:49:16", modified = "12/25/2022 04:18:41",
    trigger = byte(0x00C7AC) == 58 && bit0(0x00CB94) > prev(bit0(0x00CB94))
)

achievement(
    title = "Baked Goods", points = 1, type="progression",
    description = "Deliver the Tote Bag to Mavis.",
    id = 272306, badge = "301421", published = "12/11/2022 03:58:18", modified = "12/26/2022 18:39:33",
    trigger = byte(0x00C7AC) == 252 && bit0(0x00CB8E) < prev(bit0(0x00CB8E))
)

achievement(
    title = "Bloom Power", points = 3, type="missable",
    description = "Grow four flowers at once.",
    id = 272334, badge = "301449", published = "12/11/2022 05:21:21", modified = "12/25/2022 04:18:41",
    trigger = byte(0x00C7AC) == 239 &&
              measured((bit3(0x00CB6A) + bit3(0x00CB70) + bit3(0x00CB72) + bit3(0x00CB74)) == 4)
)

achievement(
    title = "Litterquest", points = 4,
    description = "Find all five of Mama Pup's children.",
    id = 272308, badge = "301423", published = "12/11/2022 04:24:22", modified = "12/25/2022 04:18:42",
    trigger = byte(0x00C7AC) == 40 && byte(0x00CB26) == 6 && bit0(0x00CB98) > prev(bit0(0x00CB98))
)

achievement(
    title = "Mushroom Spirit", points = 5, type="win_condition",
    description = "Wake up the Mushroom Spirit and beat the game.",
    id = 272332, badge = "301447", published = "12/11/2022 05:05:38", modified = "12/26/2022 18:39:33",
    trigger = byte(0x00C7AC) == 6 && bit0(0x00CB9C) > prev(bit0(0x00CB9C))
)

achievement(
    title = "Melanie's Adventure", points = 5,
    description = "Beat the game with all four cutscenes unlocked.",
    id = 272333, badge = "301448", published = "12/11/2022 05:11:24", modified = "12/25/2022 04:24:27",
    trigger = byte(0x00C7AC) == 6 && measured((bit0(0x00CB94) + bit0(0x00CB96) + bit0(0x00CB98) + bit0(0x00CB9A)) == 4) &&
              bit0(0x00CB9C) > prev(bit0(0x00CB9C))
)

achievement(
    title = "Wake Up Rush", points = 5,
    description = "Beat the game in less than 8 minutes.",
    id = 272338, badge = "301453", published = "12/11/2022 07:01:59", modified = "12/26/2022 18:02:29",
    trigger = trigger_when(byte(0x00C7AC) == 6) && trigger_when(bit0(0x00CB9C) > prev(bit0(0x00CB9C))) &&
              repeated(60, byte(0x00CB9E) != 0) && unless(repeated(28860, byte(0x00CB9E) != 0)) &&
              (always_false() || (never(byte(0x00CB9E) == 0)))
)

leaderboard(
    id = 51915, title = "Fastest Clear",
    description = "Beat the game as fast as you can!",
    start  = repeated(60, byte(0x00CB9E) != 0) && never(byte(0x00CB9E) == 0),
    cancel = repeated(5, byte(0x00CB9E) == 0) && never(byte(0x00CB9E) != 0),
    submit = byte(0x00C7AC) == 6 && bit0(0x00CB9C) > prev(bit0(0x00CB9C)),
    value  = measured(tally(0, byte(0x00CB9E) != 0)),
    format = "FRAMES"
)

leaderboard(
    id = 51916, title = "Fastest 100% Clear",
    description = "Beat the game as fast as you can with all four cutscenes unlocked!",
    start  = repeated(60, byte(0x00CB9E) != 0) && never(byte(0x00CB9E) == 0),
    cancel = repeated(5, byte(0x00CB9E) == 0) && never(byte(0x00CB9E) != 0),
    submit = byte(0x00C7AC) == 6 && bit0(0x00CB94) == 1 && bit0(0x00CB96) == 1 && bit0(0x00CB98) == 1 &&
             bit0(0x00CB9A) == 1 && bit0(0x00CB9C) > prev(bit0(0x00CB9C)),
    value  = measured(tally(0, byte(0x00CB9E) != 0)),
    format = "FRAMES"
)

rich_presence_display("Exploring {0}",
    rich_presence_lookup("Map", byte(0x00C7AC), MapLookup, fallback="an Unknown Location")
)
