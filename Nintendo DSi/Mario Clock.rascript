// Mario Clock
// #ID = 27461

character_names = {
    0: "Mario",
    1: "Luigi"
}

function in_game() => ascii_string_equals(0xffe00c, "KWBE")

function marios_collected(num) => (prev(dword(0x06cd1c)) == num - 1) && (dword(0x06cd1c) == num)

function mushroom_collected() => ((prev(byte(0x06ccf5)) == 0) && (byte(0x06ccf5) == 1))

function pow_block_hit() => ((prev(word(0x06cd05)) == 0x1800) && (word(0x06cd05) == 0x17c0))

function mario_above_ceiling() => ((prev(word(0x3eaa7a)) >= 0x0016) && (word(0x3eaa7a) <= 0x0020))

function get_coin_total() => (dword(0x06cd1c) * 100) + dword(0x06cd14)

// Two Heads Tall [1]
// Collect a Super Mushroom!

achievement(
    title = "Two Heads Tall",
    description = "Collect a Super Mushroom!",
    points = 1,
    trigger = in_game() && mushroom_collected()
)

// Warios Dream [1]
// Hit three POW blocks!

achievement(
    title = "Wario's Dream",
    description = "Hit three POW blocks!",
    points = 1,
    trigger = measured(repeated(3, in_game() && pow_block_hit()))
)

// The Other Mario [1]
// Transform into Luigi!

achievement(
    title = "The Other Mario",
    description = "Transform into Luigi!",
    points = 1,
    trigger = in_game() && marios_collected(1)
)

// Rich Plumber [2]
// Collect 500 coins!

achievement(
    title = "Rich Plumber",
    description = "Collect 500 coins!",
    points = 2,
    trigger = in_game() && marios_collected(5)
)

// The End of Time [3]
// Collect 1200 coins and watch the ending!

achievement(
    title = "The End of Time",
    description = "Collect 1200 coins and watch the ending!",
    points = 3,
    trigger = in_game() && marios_collected(12)
)

// The Ceiling Treasure [2]
// Collect 10 coins while running along the top of the ceiling!

achievement(
    title = "The Ceiling Treasure",
    description = "Collect 10 coins while running along the top of the ceiling in the underground level!",
    points = 2,
    trigger = measured(repeated(10, in_game() && mario_above_ceiling() && (dword(0x06cd14) != prev(dword(0x06cd14)))))
)

// Create rich presence

rich_presence_conditional_display(!in_game(),
    "In the DSi menu"
)

rich_presence_display(
    "{0} is running out of time with {1} coins collected",
    rich_presence_lookup("Player", byte(0x06ccf4), character_names),
    rich_presence_value("Coins", get_coin_total())
)

