// ~Homebrew~ Pentacorn Quest
// #ID = 33799

function addr_offset() => ~bit0(0x00FC48) * 0x00C000

golden_acorn_rooms = [
    0x0000,
    0x0001,
    0x0304,
    0x0107,
    0x0104,
    0x0202
]

item_locations = {
    "Green Acorn": 0x0003,
    "Pickaxe": 0x0006,
    "Watering Can": 0x0202,
    "Z80": 0x0302,
    "Dynamite": 0x0006,
    "Trident": 0x0204,
    "Battery": 0x0205,
    "Gold Coin": 0x0200,
    "Ending": 0x0207
}

item_ids = {
    "Green Acorn": 0x13,
    "Pickaxe": 0x14,
    "Watering Can": 0x15,
    "Z80": 0x17,
    "Dynamite": 0x18,
    "Trident": 0x19,
    "Battery": 0x1A,
    "Gold Key": 0x1B,
    "Gold Coin": 0x16,
}

inventory_slots = {
    1: byte(0x002fb4 + addr_offset()),
    2: byte(0x002fb5 + addr_offset()),
    3: byte(0x002fb6 + addr_offset()),
    4: byte(0x002fb7 + addr_offset()),
    5: byte(0x002fb8 + addr_offset()),
    6: byte(0x002fb9 + addr_offset()),
}

map_id = word(0x002f73 + addr_offset())
hp = byte(0x002f77 + addr_offset())
acorns_found = byte(0x002f76 + addr_offset())
ending_bitflag = byte(0x002fb0 + addr_offset())

you_win = map_id == item_locations["Ending"]
    && once(map_id == item_locations["Ending"] && prev(acorns_found) == 2 && acorns_found == 1)
    && prev(ending_bitflag) == 0 && ending_bitflag == 1

////////////////////

function green_acorn_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Green Acorn"]
}

achievement(
    type = "progression",
    title = "Green Power",
    points = 1,
    description = "It may not be golden, but it's still collectable",
    trigger = map_id == item_locations["Green Acorn"]
    && any_of(range(1, 6), green_acorn_collected)
)

function pickaxe_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Pickaxe"]
}

achievement(
    type = "progression",
    title = "Digging Down",
    points = 2,
    description = "Floors will crumble with one swing",
    trigger = map_id == item_locations["Pickaxe"]
    && any_of(range(1, 6), pickaxe_collected)
)

function watering_can_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Watering Can"]
}

achievement(
    type = "progression",
    title = "Into the Sky",
    points = 3,
    description = "Plants grow best with love and water",
    trigger = map_id == item_locations["Watering Can"]
    && any_of(range(1, 6), watering_can_collected)
)

function z80_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Z80"]
}

achievement(
    type = "progression",
    title = "Master Gear Spectrum",
    points = 4,
    description = "This microprocessor continued to be manufactured for almost 50 years",
    trigger = map_id == item_locations["Z80"]
    && any_of(range(1, 6), z80_collected)
)

function dynamite_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Dynamite"]
}

achievement(
    type = "progression",
    title = "Small Bundle of Power",
    points = 5,
    description = "This explosive is waterproof!",
    trigger = map_id == item_locations["Dynamite"]
    && any_of(range(1, 6), dynamite_collected)
)

function trident_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Trident"]
}

function have_trident(slot) {
    return inventory_slots[slot] == item_ids["Trident"]
}

function is_current_map(id) {
    return map_id == id
}

achievement(
    type = "progression",
    title = "Charged and Ready",
    points = 5,
    description = "Power once lost, now reclaimed",
    trigger = map_id == item_locations["Trident"]
    && any_of(range(1, 6), trident_collected)
)

achievement(
    type = "progression",
    title = "Handful of Acorns",
    points = 5,
    description = "Three down, two to go",
    trigger = any_of(golden_acorn_rooms, is_current_map)
    && prev(acorns_found) == 2
    && acorns_found == 3
)

function gold_coin_collected(slot) {
    return prev(inventory_slots[slot]) == 0x00 && inventory_slots[slot] == item_ids["Gold Coin"]
}

achievement(
    type = "progression",
    title = "Gold for Gold",
    points = 5,
    description = "Money can be exchanged for goods and services",
    trigger = map_id == item_locations["Gold Coin"]
    && any_of(range(1, 6), gold_coin_collected)
)

achievement(
    type = "win_condition",
    title = "The Greatest Treasure",
    points = 10,
    description = "Five golden acorns unlock the magical door",
    trigger = you_win
)

function have_pickaxe(slot) {
    return inventory_slots[slot] == item_ids["Pickaxe"]
}

achievement(
    type = "missable",
    title = "No Healing Needed",
    points = 10,
    description = "Collect your first two golden acorns without taking damage",
    trigger = once(
        prev(map_id) == 0x0001
        && (map_id == 0x0002 || map_id == 0x0000)
        && acorns_found == 0
        && hp == 5
        && none_of(range(1, 6), have_pickaxe)
    )
    && trigger_when(
        any_of(golden_acorn_rooms, is_current_map)
        && prev(acorns_found) == 1
        && acorns_found == 2
    )
    && never(hp < prev(hp))
)

leaderboard(
    title = "Speedrun",
    description = "Beat the game as fast as you can",
    start = prev(map_id) == 0x0001
        && (map_id == 0x0002 || map_id == 0x0000)
        && acorns_found == 0
        && hp > 0
        && none_of(range(1, 6), have_pickaxe),
    cancel = hp == 0,
    submit = you_win, 
    value = measured(always_true()),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    title = "Damageless Speedrun",
    description = "Beat the game as fast as you can without taking damage",
    start = prev(map_id) == 0x0001
        && (map_id == 0x0002 || map_id == 0x0000)
        && acorns_found == 0
        && hp == 5
        && none_of(range(1, 6), have_pickaxe),
    cancel = hp < prev(hp),
    submit = you_win, 
    value = measured(always_true()),
    format="FRAMES",
    lower_is_better=true
)

rich_presence_conditional_display(
    map_id == 0xffff,
    "At the title screen"
)

rich_presence_display(
    "Exploring with {0}/5 HP and {1}/5 Golden Acorns",
    rich_presence_value("Number", hp),
    rich_presence_value("Number", acorns_found)
)
