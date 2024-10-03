// ~Homebrew~ SWORDSMAN on the ETERNAL JOURNEY
// #ID = 30764

BossRooms = {
    "Big Reab":0x616c,
    "Gardem":0xde6c,
    "Mirage":0x226c,
    "Goatsh":0xc66b,
    "Fighter":0x1a6c,
    "Gooland":0x176c,
    "Stygio 1":0x5868,
    "Stygio 2":0xac68,
    "Hellgardener":0xb26c,
    "Dark Sage":0x4e6b,
    "Steel Wing":0x0b06,
    "Midal":0x546b,
    "Rudy":0x5c6b,
    "Lusty":0xb46b,
    "Demon Lord":0x146b,
    "Red Big Reab":[0x3c69, 0x576c],
    "Diabolo Goatsh":[0x8369, 0xa36c],
    "Doppel Fighter":[0xca69, 0x3b6c],
    "Deep Stygio":[0x1169, 0xae6c],
    "Darkest Sage":[0x5869, 0xfa6c],
    "Painful":0x9f69,
}

BossFlags = {
    "Big Reab":0x00cccf,
    "Gardem":0x00ccdb,
    "Mirage":0x00ccdd,
    "Goatsh":0x00ccdf,
    "Fighter":0x00ccf1,
    "Gooland":0x00ccff,
    "Stygio":0x00cd03,
    "Hellgardener":0x00cd27,
    "Dark Sage":0x00cd2b,
    "Steel Wing":0x00cd55,
    "Midal":0x00cd77,
    "Rudy":0x00cd7b,
    "Lusty":0x00cd7f,
    "Demon Lord":0x00cd81
}

Chests = {
    "Forest": [
        0x00cd93, // Leather Helm
        0x00cd95, // Bandage
        0x00cd99, // Leather Gauntlet
     ],
     "Cathedral": [
        0x00cd9b, // Ointment
        0x00cd9d, // Amethyst Ring
        0x00cd9f, // Cure-All
        0x00cda1, // Spider Silk
        0x00cda3, // Bronze Sword
        0x00cda5, // Copper Helm
        0x00cda7, // Copper Armor
    ],
    "Mountain": [
        0x00cdab, // Iron Boots
        0x00cdad, // Iron Gauntlet
        0x00cdaf, // Ointment
        0x00cdb1, // Steel Sword
        0x00cdb3, // Agate Ring
    ],
    "Underwater": [
        0x00cdb5, // Rutile Ring
        0x00cdb7, // Spider Silk
        0x00cdb9, // Pointy Hat
        0x00cdbb, // Wind Robe
        0x00cdbd, // Silver Sword
    ],
    "Library": [
        0x00cdbf, // Venture Shoes
        0x00cdc1, // Heavy Gauntlet
        0x00cdc3, // Quartz Ring
        0x00cdc5, // Golden Sword
        0x00cdc7, // Drink Medicine
        0x00cdc9, // Life Gem
        0x00cdcb, // Heavy Boots
    ],
    "Castle": [
        0x00cdcd, // Fairy Sword
        0x00cdcf, // Adamant Mail
        0x00cdd1, // Substitute Stone
        0x00cdd3, // Blue Glove
    ],
    "Ruins": [
        0x00cdd5, // Substitute Stone
        0x00cdd7, // Magic Key
        0x00cdd9, // Idaten Netsuke
        0x00cddb, // Golden Mail
        0x00cddd, // Life Gem
        0x00cddf, // Golden Ring
        0x00cde1, // Leather Sandals
        0x00cde3, // Silver Chain
        0x00cde5, // Golden Helm
        0x00cde7, // Holy Blade
        0x00cde9, // Devil Mark
    ]
}

map_id = word(0x00c81e)
in_dojo = map_id == 0xa76b
substitute_stone_received = prev(byte(0x00ccf9)) == 0 && byte(0x00ccf9) == 1
trials_completed = byte(0x00cd67)
minigame_score = word(0x00ca50)

player_level = word(0x00cba5)
player_form = byte(0x00cbb1)
human_player = player_form == 0
demon_player = player_form == 1
player_current_hp = word(0x00cba7)
player_max_hp = word(0x00cba9)
player_attack = word(0x00cbc1)
player_defense = word(0x00cbc3)
player_mind = word(0x00cbc5)
player_power = word(0x00cbc7)
player_speed = word(0x00cb97)

function cave_trial_completed(num) {
    return prev(trials_completed) == num - 1 && trials_completed == num
}

function boss_defeated(name) {
    return prev(byte(BossFlags[name])) == 0 && byte(BossFlags[name]) == 1
}

function byte_count(bitflag) {
    return byte(bitflag)
}

function boss_count(boss_name) {
    return bit0(BossFlags[boss_name])
}

// Defeat Big Reab (progression)
achievement(
    type = "progression",
    title = "Man vs. Nature",
    points = 2,
    description = "Defeat Big Reab",
    trigger = map_id == BossRooms["Big Reab"]
    && boss_defeated("Big Reab")
)

// Defeat Gardem (progression)
achievement(
    type = "progression",
    title = "Seducing Stone",
    points = 3,
    description = "Defeat Gardem",
    trigger = map_id == BossRooms["Gardem"]
    && boss_defeated("Gardem")
)

// Defeat Mirage (progression)
achievement(
    type = "progression",
    title = "Downfall of Narcissus",
    points = 4,
    description = "Defeat Mirage",
    trigger = map_id == BossRooms["Mirage"]
    && boss_defeated("Mirage")
)

// Defeat Goatsh (progression)
achievement(
    type = "progression",
    title = "Intertwined Tails",
    points = 5,
    description = "Defeat Goatsh",
    trigger = map_id == BossRooms["Goatsh"]
    && boss_defeated("Goatsh")
)

// Defeat the Fighter (progression)
achievement(
    type = "progression",
    title = "Inglorious Path",
    points = 5,
    description = "Defeat the Fighter",
    trigger = map_id == BossRooms["Fighter"]
    && boss_defeated("Fighter")
)

// Defeat Gooland (progression)
achievement(
    type = "progression",
    title = "Oozing Appeal",
    points = 3,
    description = "Defeat Gooland",
    trigger = map_id == BossRooms["Gooland"]
    && boss_defeated("Gooland")
)

// Defeat Stygio (progression)
achievement(
    type = "progression",
    title = "Beach Special",
    points = 5,
    description = "Defeat Stygio",
    trigger = (map_id == BossRooms["Stygio 1"] || map_id == BossRooms["Stygio 2"])
    && boss_defeated("Stygio")
)

// Defeat the Hellgardener (progression)
achievement(
    type = "progression",
    title = "Playing with Thorns",
    points = 3,
    description = "Defeat the Hellgardener",
    trigger = map_id == BossRooms["Hellgardener"]
    && boss_defeated("Hellgardener")
)

// Defeat the Dark Sage (progression)
achievement(
    type = "progression",
    title = "Carnal Magic",
    points = 5,
    description = "Defeat the Dark Sage",
    trigger = map_id == BossRooms["Dark Sage"]
    && boss_defeated("Dark Sage")
)

// Earn the Steel Wing by defending Factory Town (progression)
achievement(
    type = "progression",
    title = "A Change of Pace",
    points = 5,
    description = "Earn the Steel Wing by defending Factory Town",
    trigger = map_id == BossRooms["Steel Wing"]
    && boss_defeated("Steel Wing")
)

// Defeat Midal (progression)
achievement(
    type = "progression",
    title = "Massaging Midal",
    points = 3,
    description = "Defeat Midal",
    trigger = map_id == BossRooms["Midal"]
    && boss_defeated("Midal")
)

// Defeat Rudy (progression)
achievement(
    type = "progression",
    title = "Rubbing on Rudy",
    points = 3,
    description = "Defeat Rudy",
    trigger = map_id == BossRooms["Rudy"]
    && boss_defeated("Rudy")
)

// Defeat Lusty (progression)
achievement(
    type = "progression",
    title = "Licking Lusty",
    points = 3,
    description = "Defeat Lusty",
    trigger = map_id == BossRooms["Lusty"]
    && boss_defeated("Lusty")
)

// Defeat the Demon Lord and beat the game (win condition)
achievement(
    type = "win_condition",
    title = "Altering the Curse",
    points = 10,
    description = "Defeat the Demon Lord and beat the game",
    trigger = map_id == BossRooms["Demon Lord"]
    && boss_defeated("Demon Lord")
)

// Obtain the bad ending by defeating the Demon Lord in your Demon form
achievement(
    type = "missable",
    title = "Power Corrupts",
    points = 5,
    description = "Rely on your curse too much, and obtain the bad ending as the cost",
    trigger = map_id == BossRooms["Demon Lord"]
    && demon_player
    && boss_defeated("Demon Lord")
)

// Obtain the good ending by defeating the Demon Lord in your Human form
achievement(
    type = "missable",
    title = "Purification",
    points = 5,
    description = "Prove the strength of humanity, and obtain the good ending as a reward",
    trigger = map_id == BossRooms["Demon Lord"]
    && human_player
    && boss_defeated("Demon Lord")
)

// Receive a Substitute Stone as a gift from the dojo
achievement(
    title = "Lucky Rock",
    points = 1,
    description = "Receive a Substitute Stone as a gift from the dojo",
    trigger = in_dojo
    && substitute_stone_received
)

// Score more than 1,000 points on the Shoot the Monsters minigame in the Amusement Centre
achievement(
    title = "Arcade Addict",
    points = 5,
    description = "Score more than 1,000 points on the Shoot the Monsters minigame in the Amusement Centre",
    trigger = map_id == 0xbd6b
    && minigame_score >= 0x1000
    && minigame_score <= 0x1200
)

// Open all of the chests in the Forest of Beginnings
achievement(
    title = "Nature's Nudist",
    points = 1,
    description = "Open all of the chests in the Forest of Beginnings",
    trigger = prev(sum_of(Chests["Forest"], byte_count)) == length(Chests["Forest"]) - 1
              && measured(sum_of(Chests["Forest"], byte_count) == length(Chests["Forest"]))
)

// Open all of the chests in the Cathedral of Stella
achievement(
    title = "Holey Duty",
    points = 3,
    description = "Open all of the chests in the Cathedral of Stella",
    trigger = prev(sum_of(Chests["Cathedral"], byte_count)) == length(Chests["Cathedral"]) - 1
              && measured(sum_of(Chests["Cathedral"], byte_count) == length(Chests["Cathedral"]))
)

// Open all of the chests in the Mountain Path of the Seeker
achievement(
    title = "Training Arc",
    points = 2,
    description = "Open all of the chests in the Mountain Path of the Seeker",
    trigger = prev(sum_of(Chests["Mountain"], byte_count)) == length(Chests["Mountain"]) - 1
              && measured(sum_of(Chests["Mountain"], byte_count) == length(Chests["Mountain"]))
)

// Open all of the chests in the Underwater Cavern
achievement(
    title = "Tentacled Treasure",
    points = 2,
    description = "Open all of the chests in the Underwater Cavern",
    trigger = prev(sum_of(Chests["Underwater"], byte_count)) == length(Chests["Underwater"]) - 1
              && measured(sum_of(Chests["Underwater"], byte_count) == length(Chests["Underwater"]))
)

// Open all of the chests in the Forgotten Library and the cave right before it
achievement(
    title = "Book Bound",
    points = 3,
    description = "Open all of the chests in the Forgotten Library and the cave right before it",
    trigger = prev(sum_of(Chests["Library"], byte_count)) == length(Chests["Library"]) - 1
              && measured(sum_of(Chests["Library"], byte_count) == length(Chests["Library"]))
)

// Open all of the chests in the Queen's Castle
achievement(
    title = "Royal Romp",
    points = 5,
    description = "Open all of the chests in the Queen's Castle",
    trigger = prev(sum_of(Chests["Castle"], byte_count)) == length(Chests["Castle"]) - 1
              && measured(sum_of(Chests["Castle"], byte_count) == length(Chests["Castle"]))
)

// Open all of the chests in the Palace Ruins and the cave right before it
achievement(
    title = "Degradation",
    points = 4,
    description = "Open all of the chests in the Palace Ruins and the cave right before it",
    trigger = prev(sum_of(Chests["Ruins"], byte_count)) == length(Chests["Ruins"]) - 1
              && measured(sum_of(Chests["Ruins"], byte_count) == length(Chests["Ruins"]))
)

// Defeat the Red Big Reab in the Cave of Trials
achievement(
    title = "Not My Kind of Bear",
    points = 5,
    description = "Defeat the Red Big Reab in the Cave of Trials",
    trigger = (map_id == BossRooms["Red Big Reab"][0] || map_id == BossRooms["Red Big Reab"][1])
    && cave_trial_completed(1)
)

// Defeat Diabolo Goatsh in the Cave of Trials
achievement(
    title = "The Devil's Promise",
    points = 5,
    description = "Defeat Diabolo Goatsh in the Cave of Trials",
    trigger = (map_id == BossRooms["Diabolo Goatsh"][0] || map_id == BossRooms["Diabolo Goatsh"][1])
    && cave_trial_completed(2)
)

// Defeat the Doppel Fighter in the Cave of Trials
achievement(
    title = "Not Quite Selfcest",
    points = 5,
    description = "Defeat the Doppel Fighter in the Cave of Trials",
    trigger = (map_id == BossRooms["Doppel Fighter"][0] || map_id == BossRooms["Doppel Fighter"][1])
    && cave_trial_completed(3)
)

// Defeat Deep Stygio in the Cave of Trials
achievement(
    title = "Plundering the Abyss",
    points = 10,
    description = "Defeat Deep Stygio in the Cave of Trials",
    trigger = (map_id == BossRooms["Deep Stygio"][0] || map_id == BossRooms["Deep Stygio"][1])
    && cave_trial_completed(4)
)

// Defeat the Darkest Sage in the Cave of Trials
achievement(
    title = "The Boundaries of Immorality",
    points = 10,
    description = "Defeat the Darkest Sage in the Cave of Trials",
    trigger = (map_id == BossRooms["Darkest Sage"][0] || map_id == BossRooms["Darkest Sage"][1])
    && cave_trial_completed(5)
)

// Defeat Painful in the Cave of Trials
achievement(
    title = "S&M",
    points = 10,
    description = "Defeat Painful in the Cave of Trials",
    trigger = map_id == BossRooms["Painful"]
    && cave_trial_completed(6)
)

rich_presence_conditional_display(
    player_level == 0,
    "On the title screen"
)

form_lookup = {
    0: "Human"
}

rich_presence_display(
    "{0} Form • Level: {1} • HP: {2}/{3} • ATK: {4} • DEF: {5} • MND: {6} • POW: {7} • SPD: {8} • {9}/14 Bosses Defeated",
    rich_presence_lookup("Form", player_form, form_lookup, fallback="Demonic"),
    rich_presence_value("Number", player_level),
    rich_presence_value("Number", player_current_hp),
    rich_presence_value("Number", player_max_hp),
    rich_presence_value("Number", player_attack),
    rich_presence_value("Number", player_defense),
    rich_presence_value("Number", player_mind),
    rich_presence_value("Number", player_power),
    rich_presence_value("Number", player_speed),
    rich_presence_value("Number", sum_of(BossFlags, boss_count))
)
