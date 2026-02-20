// Planet Smashers
// #ID = 13244

lives = byte(0x0080)
wave = byte(0x00b2) + 1
difficulty = byte(0x1a94)
weapon_level = byte(0x007c)
game_status = byte(0x006f)
reset_check = dword(0x0082)
function get_score() {
    return low4(0x1a5c) +
    high4(0x1a5c) * 10 +
    low4(0x1a5d) * 100 +
    high4(0x1a5d) * 1000 +
    low4(0x1a5e) * 10000 +
    high4(0x1a5e) * 100000 +
    low4(0x1a5f) * 1000000 +
    high4(0x1a5f) * 10000000
}
function not_demo() {
    return bit7(0x1a99) != 1
}
function any_difficulty() {
    return difficulty <= 1
}
function hard_difficulty() {
    return difficulty == 1
}
function lives_check() {
    return lives <= 10
}
function wave_cleared(num) {
    return once(prev(wave) == num && wave == num + 1) && repeated(60, wave == num + 1) && never(wave == 0xff) && never(game_reset())
}
function game_beat() {
    return wave == 7 && prev(game_status) == 0 && game_status == 0x48 && never(game_reset())
}
function game_reset() {
    return reset_check == 0
}

achievement(
    title = "Button Saver",
    points = 1,
    description = "Collect your first weapon upgrade!",
    id = 352260,
    badge = "397428",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(weapon_level) == 0 && weapon_level == 1
)

achievement(
    title = "Not a Dreamcast",
    points = 2,
    description = "Clear wave 1 on any difficulty!",
    type = "progression",
    id = 352261,
    badge = "397404", 
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(1)
)

achievement(
    title = "Protecting the Earth",
    points = 3,
    description = "Clear wave 2 on any difficulty!",
    type = "progression",
    id = 352263,
    badge = "397406", 
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(2)
)

achievement(
    title = "Stellar Frisbee",
    points = 4,
    description = "Clear wave 3 on any difficulty!",
    type = "progression",
    id = 352265,
    badge = "397408",
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(3)
)

achievement(
    title = "Space Hex",
    points = 5,
    description = "Clear wave 4 on any difficulty!",
    type = "progression",
    id = 352267,
    badge = "397410",
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(4)
)

achievement(
    title = "Lunar Flower",
    points = 5,
    description = "Clear wave 5 on any difficulty!",
    type = "progression",
    id = 352269,
    badge = "397412",
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(5)
)

achievement(
    title = "Moon Bug",
    points = 5,
    description = "Clear wave 6 on any difficulty!",
    type = "progression",
    id = 352271,
    badge = "397414",
    trigger = not_demo() && any_difficulty() && lives_check()
              && wave_cleared(6)
)

achievement(
    title = "Planet Defender",
    points = 10,
    description = "Clear wave 7 and beat the game on any difficulty!",
    type = "win_condition",
    id = 352302,
    badge = "397416",
    trigger = not_demo() && any_difficulty() && lives_check()
              && game_beat()
)

achievement(
    title = "Not a Dreamcast: Hard",
    points = 3,
    description = "Clear wave 1 on Hard!",
    id = 352262,
    badge = "397405",
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(1)
)

achievement(
    title = "Protecting the Earth: Hard",
    points = 4,
    description = "Clear wave 2 on Hard!",
    id = 352264,
    badge = "397407",
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(2)
)

achievement(
    title = "Stellar Frisbee: Hard",
    points = 5,
    description = "Clear wave 3 on Hard!",
    id = 352266,
    badge = "397409", 
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(3)
)

achievement(
    title = "Space Hex: Hard", points = 5,
    description = "Clear wave 4 on Hard!",
    id = 352268, badge = "397411", published = "9/3/2023 4:23:38 AM", modified = "9/4/2023 7:48:50 PM",
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(4)
)

achievement(
    title = "Lunar Flower: Hard",
    points = 5,
    description = "Clear wave 5 on Hard!",
    id = 352270,
    badge = "397413",
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(5)
)

achievement(
    title = "Moon Bug: Hard",
    points = 10,
    description = "Clear wave 6 on Hard!",
    id = 352272,
    badge = "397415", 
    trigger = not_demo() && hard_difficulty() && lives_check()
              && wave_cleared(6)
)

achievement(
    title = "Planet Defender: Hard",
    points = 10,
    description = "Clear wave 7 and beat the game on Hard!",
    id = 352303,
    badge = "397417",
    trigger = not_demo() && hard_difficulty() && lives_check()
              && game_beat()
)

achievement(
    title = "Alien Wrecker",
    points = 2,
    description = "Reach a score of 100,000!",
    id = 353424,
    badge = "398174",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(get_score()) >= 50000 && prev(get_score()) < 100000
              && get_score() >= 100000 && get_score() < 200000
)

achievement(
    title = "Alien Destroyer",
    points = 3,
    description = "Reach a score of 200,000!",
    id = 353425,
    badge = "398175",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(get_score()) >= 150000 && prev(get_score()) < 200000
              && get_score() >= 200000 && get_score() < 300000
)

achievement(
    title = "Alien Devastator",
    points = 5,
    description = "Reach a score of 400,000!",
    id = 353426,
    badge = "398176",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(get_score()) >= 350000 && prev(get_score()) < 400000
              && get_score() >= 400000 && get_score() < 500000
)

achievement(
    title = "Alien Annihilator",
    points = 10,
    description = "Reach a score of 800,000!",
    id = 353427,
    badge = "398177",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(get_score()) >= 750000 && prev(get_score()) < 800000
              && get_score() >= 800000 && get_score() < 900000
)

achievement(
    title = "Alien Exterminator",
    points = 25,
    description = "Reach a score of 1,000,000!",
    id = 353428,
    badge = "398178",
    trigger = not_demo() && any_difficulty() && lives_check()
              && prev(get_score()) >= 950000 && prev(get_score()) < 1000000
              && get_score() >= 1000000 && get_score() < 1100000
)
