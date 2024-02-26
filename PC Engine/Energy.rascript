// Energy
// #ID = 13409

area_id = byte(0x0691)
subarea_id = byte(0x0684)
last_subarea_id = byte(0x0685)
player_hp = byte(0x06d7)

item_bitflags = {
    "Power-Up Kit #2":byte(0x075a),
    "Power-Up Kit #4":byte(0x075b),
    "Down-Shot Power Kit":byte(0x075d),
    "Up-Shot Power Kit":byte(0x075e),
    "Red Energy Power-Up Kit":byte(0x0760),
    "White Energy Power-Up Kit":byte(0x0761),
    "Solomon's Flute":byte(0x0763), // progression
    "Liquid Ammonia":byte(0x0764),
    "Edison Band":byte(0x0765),
    "Devil's Charm":byte(0x0766),
    //"Hermit's Glasses":byte(0x0767)
}

item_areas = {
    "Power-Up Kit #2":[0x01, 0x82],
    "Power-Up Kit #4":[0x02, 0x83],
    "Down-Shot Power Kit":[0x09, 0x82],
    "Up-Shot Power Kit":[0x05, 0x84],
    "Red Energy Power-Up Kit":[0x03, 0x84],
    "White Energy Power-Up Kit":[0x06, 0x82],
    "Solomon's Flute":[0x02, 0x84],
    "Liquid Ammonia":[0x04, 0x85],
    "Edison Band":[0x07, 0x80],
    "Devil's Charm":[0x07, 0x85],
    //"Hermit's Glasses":[0x09, 0x82]
}

item_points = {
    "Power-Up Kit #2":2,
    "Power-Up Kit #4":4,
    "Down-Shot Power Kit":10,
    "Up-Shot Power Kit":3,
    "Red Energy Power-Up Kit":5,
    "White Energy Power-Up Kit":10,
    "Solomon's Flute":5,
    "Liquid Ammonia":5,
    "Edison Band":5,
    "Devil's Charm":5,
    //"Hermit's Glasses":100
}

cheevo_names = {
    "Power-Up Kit #2":"Twice the Power",
    "Power-Up Kit #4":"Button Mashing Supreme",
    "Down-Shot Power Kit":"Aiming Low",
    "Up-Shot Power Kit":"Aiming High",
    "Red Energy Power-Up Kit":"Not Quite a Flamethrower",
    "White Energy Power-Up Kit":"Cyrokinesis",
    "Solomon's Flute":"An Unusual Boat",
    "Liquid Ammonia":"A Stinky Cure",
    "Edison Band":"A Spot of Cold",
    "Devil's Charm":"Backtracking Ahead",
    //"Hermit's Glasses":"See the Unseen"
}

function get_total_item_count() {
    i = 0
    for item in item_bitflags {
        i = i + item_bitflags[item]
    }
    i = i + byte(0x0767)
    return i
}

function game_beat() {
    return prev(area_id) == 0x0b
    && prev(subarea_id) == 0x83
    && area_id == 0x0e
    && subarea_id == 0x83
}

function item_obtained(name) {
    return area_id == item_areas[name][0]
    && subarea_id == item_areas[name][1]
    && prev(item_bitflags[name]) == 0
    && item_bitflags[name] == 1
}

function first_boss_reached() {
    return prev(area_id) == 0x03
    && prev(subarea_id) == 0x85
    && area_id == 0x03
    && subarea_id == 0x84
    && item_bitflags["Red Energy Power-Up Kit"] == 0
}

function flying_boss_reached() {
    return prev(area_id) == 0x07
    && prev(subarea_id) == 0x84
    && area_id == 0x07
    && subarea_id == 0x85
    && item_bitflags["Devil's Charm"] == 0
}

function gabron_reached() {
    return prev(area_id) == 0x09
    && prev(subarea_id) == 0x81
    && area_id == 0x09
    && subarea_id == 0x82
    && item_bitflags["Down-Shot Power Kit"] == 0
}

function abaron_defeated() {
    return prev(area_id) == 0x0a
    && prev(subarea_id) == 0x82
    && area_id == 0x06
    && subarea_id == 0x80
}

function first_boss_damageless() {
    // Start when room entered
    return once(first_boss_reached())
    // Trigger when item obtained after defeating boss
    && trigger_when(item_obtained("Red Energy Power-Up Kit"))
    // Cancel if damage taken
    && never(player_hp < prev(player_hp))
    // Cancel if player leaves the area
    && never(subarea_id != 0x84)
}

function flying_boss_damageless() {
    // Start when room entered
    return once(flying_boss_reached())
    // Trigger when item obtained after defeating boss
    && trigger_when(item_obtained("Devil's Charm"))
    // Cancel if damage taken
    && never(player_hp < prev(player_hp))
    // Cancel if player leaves the area
    && never(subarea_id != 0x85)
}

function gabron_damageless() {
    // Start when room entered
    return once(gabron_reached())
    // Trigger when item obtained after defeating boss
    && trigger_when(item_obtained("Down-Shot Power Kit"))
    // Cancel if damage taken
    && never(player_hp < prev(player_hp))
    // Cancel if player leaves the area
    && never(subarea_id != 0x82)
}

for item in item_areas {
    achievement(
        title = cheevo_names[item],
        description = format(
            "Obtain the {0}!",
            item
        ),
        points = item_points[item],
        trigger = item_obtained(item)
    )
}

achievement(
    title = "Rock Crusher",
    description = "Obtain the Red Energy Power-Up Kit without taking damage!",
    points = 5,
    trigger = first_boss_damageless()
)

achievement(
    title = "Eye Poker",
    description = "Obtain the Devil's Charm without taking damage!",
    points = 10,
    trigger = flying_boss_damageless()
)

achievement(
    title = "Worm Roller",
    description = "Obtain the Down-Shot Power Kit without taking damage!",
    points = 10,
    trigger = gabron_damageless()
)

achievement(
    title = "Throw the Third Stone",
    description = "Defeat Abaron!",
    points = 10,
    trigger = abaron_defeated()
)

achievement(
    title = "Until We Meet Again",
    description = "Defeat the final boss and beat the game!",
    points = 25,
    trigger = game_beat()
)

// Create rich presence
rich_presence_conditional_display(subarea_id == 0x00, "At the title screen")

rich_presence_display(
    "{0}/96 Health • {1}/11 Items Collected",
    rich_presence_value("Health", player_hp),
    rich_presence_value("ItemCount", get_total_item_count())
)
