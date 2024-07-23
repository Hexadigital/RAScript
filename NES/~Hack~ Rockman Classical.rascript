// ~Hack~ Rockman Classical
// #ID = 30194

Stages = {
    "Cutman": 0x00,
    "Iceman": 0x01,
    "Elecman": 0x04,
    "Gutsman": 0x05,
    "Bombman": 0x02,
    "Fireman": 0x03,
    "Wily 1": 0x06,
    "Wily 2": 0x07,
    "Wily 3": 0x08,
    "Wily 4": 0x09,
    "Continue Screen": 0x0A,
    "Ending": 0x0B
}

StageLookup = {}
for key in Stages {
    StageLookup[Stages[key]] = key
}

Corridors = {
    "Cutman": 0x14,
    "Iceman": 0x0D,
    "Elecman": 0x10,
    "Gutsman": 0x0F,
    "Bombman": 0x0C,
    "Fireman": 0x10,
    "Wily 1": 0x24,
    "Wily 2": 0x1B,
    "Wily 3": 0x1F,
    "Wily 4": 0x12
}

BossRooms = {}

for c in Corridors {
    BossRooms[c] = Corridors[c] + 1
}

Weapons = {
    "Cutman": bit5(0x005d),
    "Iceman": bit4(0x005d),
    "Elecman": bit2(0x005d),
    "Gutsman": bit3(0x005d),
    "Bombman": bit1(0x005d),
    "Fireman": bit6(0x005d),
    "Invis": bit7(0x005d)
}

WeaponAmmo = {
    "Cutman": byte(0x006b),
    "Iceman": byte(0x006c),
    "Elecman": byte(0x006f),
    "Gutsman": byte(0x0070),
    "Bombman": byte(0x006d),
    "Fireman": byte(0x006e),
    "Invis": byte(0x0071)
}

BossWeaponAmmo = {
    "Cutman": byte(0x006b),
    "Iceman": byte(0x006c),
    "Elecman": byte(0x006f),
    "Gutsman": byte(0x0070),
    "Bombman": byte(0x006d),
    "Fireman": byte(0x006e)
}

stage_id = byte(0x0031)
room_id = byte(0x0028)
lives = byte(0x00a6)
megaman_y = byte(0x0600)
boss_hp = byte(0x06c1)
on_title = stage_id == 0x0a
reset_to_title = stage_id == 0x0a && room_id == 0x00
game_start = prev(on_title) && stage_id == 0x00 && room_id == 0x00

function get_weapon(boss) {
    return prev(Weapons[boss]) == 0 && Weapons[boss] == 1
}

function boss_start() {
    return prev(boss_hp) == 0x1b && boss_hp == 0x1c
}

function lost_life() {
    return lives < prev(lives)
}

function weapon_used(w) {
    return WeaponAmmo[w] < prev(WeaponAmmo[w])
}

function bit_check(boss) {
    return Weapons[boss]
}

// Clear Bombman's stage and unlock his power, 5p
achievement(
    title = "Bombproof",
    type = "progression",
    points = 5,
    description = "Clear Bombman's stage and unlock his power",
    trigger = stage_id == Stages["Bombman"] && room_id == BossRooms["Bombman"] && get_weapon("Bombman")
)

// Defeat Bombman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "Large Range Explosives",
    type = "missable",
    points = 10,
    description = "Defeat Bombman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Bombman"] && room_id == BossRooms["Bombman"]
           && once(boss_start()) && trigger_when(get_weapon("Bombman"))
           && never(stage_id != Stages["Bombman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Clear Elecman's stage and unlock his power, 5p
achievement(
    title = "Resistor",
    type = "progression",
    points = 5,
    description = "Clear Elecman's stage and unlock his power",
    trigger = stage_id == Stages["Elecman"] && room_id == BossRooms["Elecman"] && get_weapon("Elecman")
)

// Defeat Elecman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "A Shocking Victory",
    type = "missable",
    points = 10,
    description = "Defeat Elecman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Elecman"] && room_id == BossRooms["Elecman"]
           && once(boss_start()) && trigger_when(get_weapon("Elecman"))
           && never(stage_id != Stages["Elecman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Clear Gutsman's stage and unlock his power, 5p
achievement(
    title = "Unbreakable",
    type = "progression",
    points = 5,
    description = "Clear Gutsman's stage and unlock his power",
    trigger = stage_id == Stages["Gutsman"] && room_id == BossRooms["Gutsman"] && get_weapon("Gutsman")
)

// Defeat Gutsman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "Float Like a Butterfly",
    type = "missable",
    points = 10,
    description = "Defeat Gutsman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Gutsman"] && room_id == BossRooms["Gutsman"]
           && once(boss_start()) && trigger_when(get_weapon("Gutsman"))
           && never(stage_id != Stages["Gutsman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Clear Iceman's stage and unlock his power, 10p
achievement(
    title = "Blanched",
    type = "progression",
    points = 10,
    description = "Clear Iceman's stage and unlock his power",
    trigger = stage_id == Stages["Iceman"] && room_id == BossRooms["Iceman"] && get_weapon("Iceman")
)

// Defeat Iceman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "Cracking the Ice",
    type = "missable",
    points = 10,
    description = "Defeat Iceman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Iceman"] && room_id == BossRooms["Iceman"]
           && once(boss_start()) && trigger_when(get_weapon("Iceman"))
           && never(stage_id != Stages["Iceman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Clear Cutman's stage and unlock his power, 5p
achievement(
    title = "Uncuttable",
    type = "progression",
    points = 5,
    description = "Clear Cutman's stage and unlock his power",
    trigger = stage_id == Stages["Cutman"] && room_id == BossRooms["Cutman"] && get_weapon("Cutman")
)

// Defeat Cutman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "Holey Scissors",
    type = "missable",
    points = 10,
    description = "Defeat Cutman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Cutman"] && room_id == BossRooms["Cutman"]
           && once(boss_start()) && trigger_when(get_weapon("Cutman"))
           && never(stage_id != Stages["Cutman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Clear Fireman's stage and unlock his power, 5p
achievement(
    title = "Nonflammable",
    type = "progression",
    points = 5,
    description = "Clear Fireman's stage and unlock his power",
    trigger = stage_id == Stages["Fireman"] && room_id == BossRooms["Fireman"] && get_weapon("Fireman")
)

// Defeat Fireman on his stage and unlock his power without using weapons, 10p
achievement(
    title = "Shooting Out Flames",
    type = "missable",
    points = 10,
    description = "Defeat Fireman on his stage and unlock his power without using weapons",
    trigger = stage_id == Stages["Fireman"] && room_id == BossRooms["Fireman"]
           && once(boss_start()) && trigger_when(get_weapon("Fireman"))
           && never(stage_id != Stages["Fireman"]) && never(lost_life())
           && never(any_of(WeaponAmmo, weapon_used)) && never(on_title)
)

// Defeat the Green Devil, 10p
achievement(
    title = "Green & Mean",
    type = "progression",
    points = 10,
    description = "Defeat the Green Devil",
    trigger = prev(stage_id) == Stages["Wily 1"] && stage_id == Stages["Wily 2"]
)

// Defeat the Copy Robot, 10p
achievement(
    title = "Can't Copy These Bombs",
    type = "progression",
    points = 10,
    description = "Defeat the Copy Robot",
    trigger = prev(stage_id) == Stages["Wily 2"] && stage_id == Stages["Wily 3"]
)

// Defeat CWU-01P, 10p
achievement(
    title = "Pop!",
    type = "progression",
    points = 10,
    description = "Defeat CWU-01P",
    trigger = prev(stage_id) == Stages["Wily 3"] && stage_id == Stages["Wily 4"]
)

// Put an end to Wily's machinations, 10p
achievement(
    title = "A Classical Ending",
    type = "win_condition",
    points = 10,
    description = "Put an end to Wily's machinations",
    trigger = prev(stage_id) == Stages["Wily 4"] && stage_id == Stages["Ending"]
)

// Clear all four of Wily's stages using only the Mega Buster and Invis Tool, 25p
achievement(
    title = "Lemon Juice Can Be Used for Invisible Messages",
    type = "missable",
    points = 25,
    description = "Clear all four of Wily's stages using only the Mega Buster and Invis Tool",
    trigger = once(prev(stage_id) < Stages["Wily 1"] && stage_id == Stages["Wily 1"])
           && trigger_when(prev(stage_id) == Stages["Wily 4"] && stage_id == Stages["Ending"])
           && never(stage_id < Stages["Wily 1"])
           && never(any_of(BossWeaponAmmo, weapon_used)) && never(reset_to_title)
)

// Clear the game without using a continue, 25p
achievement(
    title = "Single Coin Classic",
    type = "missable",
    points = 25,
    description = "Clear the game without using a continue",
    trigger = once(game_start)
           && trigger_when(prev(stage_id) == Stages["Wily 4"] && stage_id == Stages["Ending"])
           && never(on_title)
)

// Find the only intentionally placed 1-up in the game, 2p
// Wily 1 Life: Y > 0xAC, Stage = 0x06, Room = 0x22, Lives += 1
achievement(
    title = "A Small Mercy",
    points = 2,
    description = "Find the only 1-up in the game",
    trigger = stage_id == Stages["Wily 1"] && room_id == 0x22
           && megaman_y > 0xaa && lives == prev(lives) + 1
)

leaderboard(
    title = "Wily Speedrun",
    description = "Clear all four of Wily's stages as fast as you can",
    start  = stage_id == Stages["Wily 1"] && prev(room_id) != 0x1B && room_id == 0x1B,
    cancel = stage_id < Stages["Wily 1"] || reset_to_title,
    submit = prev(stage_id) == Stages["Wily 4"] && stage_id == Stages["Ending"],
    value = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

rich_presence_conditional_display(
    reset_to_title,
    "At the title screen"
)

rich_presence_display(
    "{0} | Weapons: {1}/7 | Lives: {2}",
    rich_presence_lookup("Stage", stage_id, StageLookup, fallback="Unknown"),
    rich_presence_value("Number", sum_of(Weapons, bit_check)),
    rich_presence_value("Number", lives)
)
