// ~Homebrew~ Magical Bocco 20541
// #ID = 33781

LanguageIDLookup = {
    0x00: "English",
    0x01: "Japanese"
}

MapIDLookup = {
    0x41: "Grassy Island",
    0x42: "Northern Underground Grid",
    0x43: "Underground Labyrinth",
    0x44: "Desert",
    0x45: "Dangerous Labyrinth",
    0x46: "Checkered Labyrinth",
    0x47: "Blue Ruins",
    0x48: "Woods",
    0x49: "Final Labyrinth"
}

MapNameLookup = {}
for key in MapIDLookup {
    MapNameLookup[MapIDLookup[key]] = key
}

language_id = byte(0x00b9ff)
map_id = byte(0x0001ed)
boco_hp = byte(0x000206)
cat_hp = byte(0x000207)

function flag_not_previously_flipped(flag) {
    return once(prev(byte(flag)) != 0xfe && never(prev(byte(flag)) == 0xfe))
}

function measured_flag_flipped(flag) {
    return once(byte(flag) == 0xfe && never(byte(flag) != 0xfe))
}

function all_flags_flipped(map, flags) {
    return repeated(60, prev(map_id) == MapNameLookup[map] && never(prev(map_id) != MapNameLookup[map]))
    && tally_of(flags, 1, flag_not_previously_flipped)
    && measured(tally_of(flags, length(flags), measured_flag_flipped), when=map_id == MapNameLookup[map])
}

function chend_found(offset) {
    return ascii_string_equals(0x001e70 + offset, "CHEND")
}

function any_chend_found() {
    return any_of(range(0, 79), chend_found)
}

victory = map_id == MapNameLookup["Blue Ruins"] && any_chend_found()

// Defeat all of the enemies and find all of the treasure on the grassy island
grassy_island_enemies = [0x0010d1, 0x0010e1, 0x001111, 0x001121, 0x001131]
grassy_island_chests = [0x0010f1, 0x001101]
grassy_island_flags = [0x0010d1, 0x0010e1, 0x001111, 0x001121, 0x001131, 0x0010f1, 0x001101]
achievement(
    title = "Island Cleanup",
    points = 2,
    description = "Defeat all of the enemies and open all of the chests on the grassy island",
    trigger = all_flags_flipped("Grassy Island", grassy_island_flags)
)

underground_grid_enemies = [0x0010d1, 0x001141]
underground_grid_chests = [0x001161, 0x0010f1, 0x001101, 0x001131, 0x001151]
achievement(
    title = "Tiled Treasure",
    points = 3,
    description = "Open all of the chests in the northern underground grid",
    trigger = all_flags_flipped("Northern Underground Grid", underground_grid_chests)
)

underground_labyrinth_enemies = [0x001101, 0x001111, 0x001121, 0x001131, 0x001141]
underground_labyrinth_chests = [0x0010f1, 0x0010d1, 0x001191, 0x0010e1, 0x001161, 0x001181]
achievement(
    title = "The Wrong Door",
    points = 2,
    description = "Defeat all of the enemies in the underground labyrinth",
    trigger = all_flags_flipped("Underground Labyrinth", underground_labyrinth_enemies)
)
achievement(
    title = "Wandering for Loot",
    points = 3,
    description = "Open all of the chests in the underground labyrinth",
    trigger = all_flags_flipped("Underground Labyrinth", underground_labyrinth_chests)
)

desert_enemies = [0x001141, 0x001121, 0x001111, 0x001171]
desert_chests = [0x001151, 0x001131, 0x0011a1, 0x001161, 0x001191]
achievement(
    title = "Sand Surfing",
    points = 2,
    description = "Defeat all of the enemies in the desert",
    trigger = all_flags_flipped("Desert", desert_enemies)
)
achievement(
    title = "Hot Milk",
    points = 3,
    description = "Open all of the chests in the desert",
    trigger = all_flags_flipped("Desert", desert_chests)
)

dangerous_labyrinth_enemies = [0x0010d1, 0x001101, 0x001111, 0x001121, 0x001131, 0x0011d1, 0x0011e1]
dangerous_labyrinth_chests = [0x0011a1, 0x0010f1, 0x001181, 0x0011b1, 0x001141, 0x001191, 0x001161]
achievement(
    title = "Home Utilities",
    points = 3,
    description = "Defeat all of the enemies in the dangerous labyrinth",
    trigger = all_flags_flipped("Dangerous Labyrinth", dangerous_labyrinth_enemies)
)
achievement(
    title = "Fried and Spiced",
    points = 4,
    description = "Open all of the chests in the dangerous labyrinth",
    trigger = all_flags_flipped("Dangerous Labyrinth", dangerous_labyrinth_chests)
)

checkered_labyrinth_enemies = [0x0010d1, 0x0010e1, 0x001161, 0x001151, 0x001131, 0x001121, 0x001101, 0x0010c1, 0x0011f1, 0x001201]
checkered_labyrinth_chests = [0x001191, 0x0011a1, 0x001181, 0x0011b1, 0x0011c1, 0x001141, 0x0010f1, 0x001111, 0x0011d1]
achievement(
    title = "Barking Blades",
    points = 5,
    description = "Defeat all of the enemies in the checkered labyrinth",
    trigger = all_flags_flipped("Checkered Labyrinth", checkered_labyrinth_enemies)
)
achievement(
    title = "Checking Chests",
    points = 4,
    description = "Open all of the chests in the checkered labyrinth",
    trigger = all_flags_flipped("Checkered Labyrinth", checkered_labyrinth_chests)
)

blue_ruins_enemies = [0x001101, 0x001111, 0x001121, 0x001131]
blue_ruins_chests = []
achievement(
    title = "Mooving Out",
    points = 3,
    description = "Defeat all of the enemies in the blue ruins",
    trigger = all_flags_flipped("Blue Ruins", blue_ruins_enemies)
)

woods_enemies = [0x001111, 0x001121, 0x001141, 0x001131, 0x001151, 0x001161]
woods_chests = [0x0010e1, 0x001101, 0x0010d1, 0x0010f1]
achievement(
    title = "Weeding the Woods",
    points = 3,
    description = "Defeat all of the enemies in the woods",
    trigger = all_flags_flipped("Woods", woods_enemies)
)
achievement(
    title = "Tree Trunk Trove",
    points = 2,
    description = "Open all of the chests in the woods",
    trigger = all_flags_flipped("Woods", woods_chests)
)

final_labyrinth_enemies = [0x001111, 0x001121, 0x001131, 0x001141, 0x001151, 0x001161, 0x001171, 0x001181]
final_labyrinth_chests = [0x0011a1, 0x0010f1, 0x0010e1, 0x0010c1, 0x0010d1]
achievement(
    title = "Batteries Not Included",
    points = 3,
    description = "Defeat all of the enemies in the final labyrinth",
    trigger = all_flags_flipped("Final Labyrinth", final_labyrinth_enemies)
)
achievement(
    title = "The Ultimate Treasure",
    points = 4,
    description = "Open all of the chests in the final labyrinth",
    trigger = all_flags_flipped("Final Labyrinth", final_labyrinth_chests)
)

achievement(
    title = "To New Lands",
    type = "win_condition",
    points = 10,
    description = "Restore power to the teleporter and use it",
    trigger = victory
)

leaderboard(
    title = "High Health Run",
    description = "Beat the game with as much health remaining as you can!",
    start = victory,
    cancel = always_false(),
    submit = always_true(), 
    value = boco_hp + cat_hp
)

leaderboard(
    title = "Low Health Run",
    description = "Beat the game with as little health remaining as you can!",
    lower_is_better = true,
    start = victory,
    cancel = always_false(),
    submit = always_true(), 
    value = boco_hp + cat_hp
)

rich_presence_conditional_display(
    language_id <= 1 && map_id >= 0x41 && map_id <= 0x49,
    "Exploring the {0} • {1} • Boco HP: {2} • Cat HP: {3}",
    rich_presence_lookup("Map", map_id, MapIDLookup, fallback="Unknown"),
    rich_presence_lookup("Language", language_id, LanguageIDLookup, fallback="Unknown"),
    rich_presence_value("Number", boco_hp),
    rich_presence_value("Number", cat_hp)
    
)

rich_presence_display(
    "At the title screen"
)
