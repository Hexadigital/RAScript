// Tricky Kick
// #ID = 2335

character_names = {
    0: "Oberon",
    1: "Udon",
    2: "Taro",
    3: "Gonzo",
    4: "Mayumi",
    5: "Suzuki"
}

checkpoints = [5, 10]

levels_completed_address = 0x1fd2

function get_character() => byte(0x007b)
function get_level() => byte(0x007a) + 1
function special_levels_activated() => byte(0x0ba6) == 0x01
function cheats_deactivated() => byte(0x0bd8) == 0x00
function get_blocks_remaining() => byte(0x0b90)

function get_starting_time(special) {
    minute_to_frames = 60*60
    if special == true {
        return 30 * minute_to_frames // 30 Minutes
    } else {
        return 5 * minute_to_frames // 5 Minutes
    }
}

function get_remaining_time() {
    return high4(0x0b9e) * (60*60*10) + // Minutes - Tens
    low4(0x0b9e) * (60*60) + // Minutes - Ones
    high4(0x0b9d) * (60*10) + // Seconds - Tens
    low4(0x0b9d) * (60) + // Seconds - Ones
    high4(0x0b9c) * (10) + // Frames - Tens
    low4(0x0b9c) // Frames - Ones
}

function congratulations() {
    return prev(get_blocks_remaining()) == 1 &&
    get_blocks_remaining() == 0
}

function get_cheevo_value(level, special) {
    value = 10
    if (special == false && level == 5) {
        value = 5
    }
    return value
}

function get_cheevo_title(path, level, special) {
    level_name = "Midpoint"
    if level == 10 {
        level_name = "Journey"
    }
    if special == true {
        return format(
            "{0}'s Special {1}",
            character_names[path],
            level_name
        )  
    } else {
        return format(
            "{0}'s {1}",
            character_names[path],
            level_name
        )
    }
}

function get_leaderboard_title(path, level, special) {
    if special == true {
        return format(
            "{0}'s Special Level {1} Speedrun",
            character_names[path],
            level
        )  
    } else {
        return format(
            "{0}'s Level {1} Speedrun",
            character_names[path],
            level
        )
    }
}

function get_cheevo_description(path, level, special) {
    if special == true {
        return format(
            "Clear Level {0} as {1} in Special Mode!",
            level,
            character_names[path]
        )
    } else {
        return format(
            "Clear Level {0} as {1} in the regular mode!",
            level,
            character_names[path]
        )
    }
}

function get_levels_completed_address(path, special) {
    if special == true {
        return byte(levels_completed_address + path + 6)
    }
    return byte(levels_completed_address + path)
}

function get_cheevo_logic(path, level, special) {
    return prev(get_levels_completed_address(path, special)) == level - 1
    && get_levels_completed_address(path, special) == level
    && cheats_deactivated()
}

function get_leaderboard_logic(path, level, special) {
    logic = get_character() == path
    && get_level() == level
    && get_remaining_time() >= 1
    && congratulations()
    && cheats_deactivated()
    if special == true {
        logic = logic && special_levels_activated()
    } else {
        logic = logic && !special_levels_activated()
    }
    return logic
}

// Create cheevos
for specialness in [false, true] {
    for character in character_names {
        for checkpoint in checkpoints {
            achievement(
                title = get_cheevo_title(character, checkpoint, specialness),
                description = get_cheevo_description(character, checkpoint, specialness),
                points = get_cheevo_value(checkpoint, specialness),
                trigger = get_cheevo_logic(character, checkpoint, specialness)
            )
        }
    }
}

// Create leaderboards
for specialness in [false, true] {
    for character in character_names {
        for level in range(1, 10) {
            leaderboard(
                title = get_leaderboard_title(character, level, specialness),
                description = "Clear the level as fast as you can!",
                start = get_leaderboard_logic(character, level, specialness),
                cancel = always_false(),
                submit = always_true(), 
                value = get_starting_time(specialness) - get_remaining_time(), 
                format = "FRAMES",
                lower_is_better = true
            )
        }
    }
}


// Create rich presence
rich_presence_conditional_display(!cheats_deactivated(), "Using a cheat code")

rich_presence_conditional_display(special_levels_activated(),
    "{0} is on Level {1} with {2} blocks left (Special Mode Activated)",
    rich_presence_lookup("Path", get_character(), character_names),
    rich_presence_value("Level", get_level()),
    rich_presence_value("Blocks", get_blocks_remaining())
)

rich_presence_display(
    "{0} is on Level {1} with {2} blocks left",
    rich_presence_lookup("Path", get_character(), character_names),
    rich_presence_value("Level", get_level()),
rich_presence_value("Blocks", get_blocks_remaining())
)
