// Checkers
// #ID = 28554

top_row = [0x000624, 0x000628, 0x00062c, 0x000630]

skill_levels = {
    0: "low",
    1: "high"    
}

function player_crowned(location) {
    // For some reason this is buggy and can go through every possible value when the CPU moves,
    // So instead we need this to be true for 30 frames
    return repeated(30, (byte(location) == 6 &&
                        never(byte(location) != 6)))
}

function starting_board_state() {
    // CPU row 1
    return prev(byte(0x000624)) == 1 &&
    prev(byte(0x000628)) == 1 &&
    prev(byte(0x00062c)) == 1 &&
    prev(byte(0x000630)) == 1 &&
    // CPU row 2
    prev(byte(0x000634)) == 1 &&
    prev(byte(0x000638)) == 1 &&
    prev(byte(0x00063c)) == 1 &&
    prev(byte(0x000640)) == 1 &&
    // CPU row 3
    prev(byte(0x000644)) == 1 &&
    prev(byte(0x000648)) == 1 &&
    prev(byte(0x00064c)) == 1 &&
    prev(byte(0x000650)) == 1 &&
    // Empty row 1
    prev(byte(0x000654)) == 0 &&
    prev(byte(0x000658)) == 0 &&
    prev(byte(0x00065c)) == 0 &&
    prev(byte(0x000660)) == 0 &&
    // Empty row 2
    prev(byte(0x000664)) == 0 &&
    prev(byte(0x000668)) == 0 &&
    prev(byte(0x00066c)) == 0 &&
    prev(byte(0x000670)) == 0 &&
    // Player row 1
    prev(byte(0x000674)) == 2 &&
    prev(byte(0x000678)) == 2 &&
    prev(byte(0x00067c)) == 2 &&
    prev(byte(0x000680)) == 2 &&
    // Player row 2
    prev(byte(0x000684)) == 2 &&
    prev(byte(0x000688)) == 2 &&
    prev(byte(0x00068c)) == 2 &&
    prev(byte(0x000690)) == 2 &&
    // Player row 3
    prev(byte(0x000694)) == 2 &&
    prev(byte(0x000698)) == 2 &&
    prev(byte(0x00069c)) == 2 &&
    prev(byte(0x0006a0)) == 2
}

function center_rows_are_empty() {
    // Empty row 1
    return byte(0x000654) == 0 &&
    byte(0x000658) == 0 &&
    byte(0x00065c) == 0 &&
    byte(0x000660) == 0 &&
    // Empty row 2
    byte(0x000664) == 0 &&
    byte(0x000668) == 0 &&
    byte(0x00066c) == 0 &&
    byte(0x000670) == 0
}

function is_single_player() => byte(0x0005f8) >= 1
function is_multiplayer() => byte(0x0005f8) == 0

function versus_high_skill() {
    return once(
    starting_board_state() &&
    !center_rows_are_empty() &&
    byte(0x0005fc) == 1
    )
}
function versus_low_skill() {
    return once(
    starting_board_state() &&
    !center_rows_are_empty() &&
    byte(0x0005fc) == 0
    )
}

function player_moves_first() => byte(0x000618) == 7
function player_moves_second() => byte(0x000614) == 7

function key_5_pressed() => byte(0x000878) == 0xbd || byte(0x00087c) == 0xbd
function game_reset() => byte(0x000614) == 0 && byte(0x000618) == 0

function you_win() {
    return (dword(0x0008a8) == 0x7bf &&
    dword(0x0008ac) == 0x74f &&
    dword(0x0008b0) == 0x777) ||
    (dword(0x0008a8) == 0x7b9 &&
    dword(0x0008ac) == 0x749 &&
    dword(0x0008b0) == 0x771)
}

// Royal Arrival
// Crown one of your pieces!

achievement(
    title = "Royal Arrival",
    description = "Crown one of your pieces!",
    points = 1,
    trigger = is_single_player() && any_of(top_row, player_crowned)
)

// The Early Bird [2]
// Win a single-player game [2] where you move first!

achievement(
    title = "The Early Bird",
    description = "Win a single-player game [2] where you move first!",
    points = 2,
    trigger = is_single_player() && player_moves_first() && you_win()
)

// Taking a Handicap [2]
// Win a single-player game [3] where you move second!

achievement(
    title = "Lost the Coin Toss",
    description = "Win a single-player game [3] where you move second!",
    points = 2,
    trigger = is_single_player() && player_moves_second() && you_win()
)

// Testing the Waters [3]
// Win a single-player game against a lo skill [8] opponent!

achievement(
    type = "win_condition",
    title = "Testing the Waters",
    description = "Win a single-player game against a low skill [8] opponent!",
    points = 3,
    trigger = is_single_player() && versus_low_skill() && you_win()
)

// On the Ropes [5]
// Win a single-player game against a hi skill [6] opponent!

achievement(
    type = "win_condition",
    title = "On the Ropes",
    description = "Win a single-player game against a high skill [6] opponent!",
    points = 5,
    trigger = is_single_player() && versus_high_skill() && you_win()
)

// Self-Sufficient [10]
// Win a single-player game against a hi skill opponent without using hints!

achievement(
    title = "Self-Sufficient",
    description = "Win a single-player game against a high skill opponent without pressing 5 or using a hint!",
    points = 10,
    trigger = is_single_player() && versus_high_skill() && trigger_when(you_win())
    && disable_when(key_5_pressed(), until=game_reset())
)

// Create rich presence
rich_presence_conditional_display((player_moves_first() ||player_moves_second()) && is_multiplayer(), "Playing against another human")

rich_presence_conditional_display(player_moves_first() && versus_high_skill(),
    "After making the first move, the player is now facing a high level opponent")


rich_presence_conditional_display(player_moves_first() && versus_low_skill(),
    "After making the first move, the player is now facing a low level opponent")

rich_presence_conditional_display(player_moves_second() && versus_high_skill(),
    "After choosing to wait, the player is now facing a high level opponent")


rich_presence_conditional_display(player_moves_second() && versus_low_skill(),
    "After choosing to wait, the player is now facing a low level opponent")

rich_presence_display("Setting up the board...")
