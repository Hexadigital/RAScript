// Kaept'n Blaubaer: Die verrueckte Schatzsuche
// #ID = 26399

// $C138: Stars Remaining [8-bit]
// $C5DA: Progress Marker [8-bit]
//        Klippen Kuste: Zero Levels Completed = 0x00
//        Klippen Kuste: All Levels Completed = 0x0F
//        Sea Crossed from Klippen to Todesklippe = 0x10
//        Todesklippe: All Levels Completed = 0x1F
//        Sea Crossed from Todesklippe to Klabauter = 0x20
//        Klabauter Eiland: All Levels Completed = 0x2F
//        Path to Schatzinel Unlocked = 0x3F
//        Sea Crossed to Schatzinel = 0x40
//        Schatzinel: All Levels Completed = 0x4F
// $C5DB: Progress Marker [8-bit]
//        Sea Crossed from Klippen = 0x0F -> 0x10
//        Stiefelolmen Riff : All Levels Completed = 0x1F
//        Sea Crossed from Stiefelolmen = 0x20
//        Seeschweine Bucht : All Levels Completed = 0x2F
//        Sea Crossed from Seeschweine = 0x30
//        Treasure Chest / Map Found = 0x31

checkpoints = [5, 10, 15]

function p1_five_levels_completed(offset, num) {
    return once(prev(byte(0x00c5da)) == offset + (num - 5)
    && byte(0x00c5da) == offset + num - 4)
    && once(prev(byte(0x00c5da)) == offset + (num - 4)
    && byte(0x00c5da) == offset + num - 3)
    && once(prev(byte(0x00c5da)) == offset + (num - 3)
    && byte(0x00c5da) == offset + num - 2)
    && once(prev(byte(0x00c5da)) == offset + (num - 2)
    && byte(0x00c5da) == offset + num - 1)
    && prev(byte(0x00c5da)) == offset + (num - 1)
    && byte(0x00c5da) == offset + num
    && never(byte(0x00c5da) < offset + (num - 5))
    && never(byte(0x00c5da) > offset + num)
}

function p2_five_levels_completed(offset, num) {
    return once(prev(byte(0x00c5db)) == offset + (num - 5)
    && byte(0x00c5db) == offset + num - 4)
    && once(prev(byte(0x00c5db)) == offset + (num - 4)
    && byte(0x00c5db) == offset + num - 3)
    && once(prev(byte(0x00c5db)) == offset + (num - 3)
    && byte(0x00c5db) == offset + num - 2)
    && once(prev(byte(0x00c5db)) == offset + (num - 2)
    && byte(0x00c5db) == offset + num - 1)
    && prev(byte(0x00c5db)) == offset + (num - 1)
    && byte(0x00c5db) == offset + num
    && never(byte(0x00c5db) < offset + (num - 5))
    && never(byte(0x00c5db) > offset + num)
}

function klippen_kuste_level_completed(num) {
    return p1_five_levels_completed(0x00, num)
}

function todesklippe_level_completed(num) {
    return p1_five_levels_completed(0x10, num)
}

function klabauter_eiland_level_completed(num) {
    return p1_five_levels_completed(0x20, num)
}

function schatzinel_level_completed(num) {
    return p1_five_levels_completed(0x40, num)
}

function stiefelolmen_riff_level_completed(num) {
    return p2_five_levels_completed(0x10, num)
}

function seeschweine_bucht_level_completed(num) {
    return p2_five_levels_completed(0x20, num)
}

function get_cheevo_title(island, level) {
    level_name = "Adept"
    if level == 10 {
        level_name = "Explorer"
    }
    else if level == 15 {
        level_name = "Completionist"
    }
    return format(
            "{0}: {1}",
            island,
            level_name
        )
}

function get_cheevo_description(island, level) {
    return format(
            "Clear puzzles {0} through {1} on {2} in one session!",
            level - 4,
            level,
            island
        )
}

// Klippen Kuste Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Klippen Kuste", c),
        type = "progression",
        description = get_cheevo_description("Klippen Kuste", c),
        points = 3,
        trigger = klippen_kuste_level_completed(c)
    )
}

// Stiefelolmen Riff Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Stiefelolmen Riff", c),
        type = "progression",
        description = get_cheevo_description("Stiefelolmen Riff", c),
        points = 5,
        trigger = stiefelolmen_riff_level_completed(c)
    )
}

// Todesklippe Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Todesklippe", c),
        type = "progression",
        description = get_cheevo_description("Todesklippe", c),
        points = 5,
        trigger = todesklippe_level_completed(c)
    )
}

// Seeschweine Bucht Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Seeschweine Bucht", c),
        type = "progression",
        description = get_cheevo_description("Seeschweine Bucht", c),
        points = 5,
        trigger = seeschweine_bucht_level_completed(c)
    )
}

// Klabauter Eiland Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Klabauter Eiland", c),
        type = "progression",
        description = get_cheevo_description("Klabauter Eiland", c),
        points = 5,
        trigger = klabauter_eiland_level_completed(c)
    )
}

// Schatzinel Puzzles
for c in checkpoints {
    achievement(
        title = get_cheevo_title("Schatz Insel", c),
        type = "progression",
        description = get_cheevo_description("Schatz Insel", c),
        points = 10,
        trigger = schatzinel_level_completed(c)
    )
}

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x2F) && (byte(0x00c5db) <= 0x10),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP1", 
        (high4(0x00c5da) * 15) // Number of Address 1 islands completed
        + low4(0x00c5da) // Plus current progress for furthest Address 1 island
    )
)

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x2F) && (byte(0x00c5db) <= 0x2F),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP2", 
        (high4(0x00c5da) * 15) // Number of Address 1 islands completed
        + low4(0x00c5da) // Plus current progress for furthest Address 1 island
        + ((high4(0x00c5db) - 1) * 15) // Number of Address 2 islands completed
        + low4(0x00c5db) // Plus current progress for furthest Address 2 island
    )
)

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x2F) && (byte(0x00c5db) > 0x2F),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP3", 
        (high4(0x00c5da) * 15) // Number of Address 1 islands completed
        + low4(0x00c5da) // Plus current progress for furthest Address 1 island
        + 30 // Number of Address 2 puzzles completed
    )
)

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x40) && (byte(0x00c5db) <= 0x10),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP4", 
        45 // Number of Address 1 puzzles completed
    )
)

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x40) && (byte(0x00c5db) <= 0x2F),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP5", 
        45// Number of Address 1 puzzles completed
        + ((high4(0x00c5db) - 1) * 15) // Number of Address 2 islands completed
        + low4(0x00c5db) // Plus current progress for furthest Address 2 island
    )
)

rich_presence_conditional_display(
    (byte(0x00c5da) <= 0x40) && (byte(0x00c5db) > 0x2F),
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP6", 
        45 // Number of Address 1 puzzles completed
        + 30 // Number of Address 2 puzzles completed
    )
)

// Only true when on final island
rich_presence_conditional_display(
    byte(0x00c5da) > 0x40,
    "Kaept'n Blaubaer is searching for treasure with {0}/90 puzzles completed",
    rich_presence_value(
        "PuzzleRP7", 
        45 // Number of Address 1 puzzles completed
        + low4(0x00c5da) // Plus current progress for furthest Address 1 island
        + 30 // Number of Address 2 puzzles completed
    )
)

rich_presence_display(
    "Kaept'n Blaubaer is searching for treasure"
)
