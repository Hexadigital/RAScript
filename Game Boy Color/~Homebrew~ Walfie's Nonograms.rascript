// ~Homebrew~ Walfie's Nonograms
// #ID = 38014

//////////////////
// General Data //
//////////////////

// screen_id = byte(0x00d14f) // v1.0.0
// screen_id = byte(0x00d162) // v1.1.0-private
screen_id = byte(0x00d150) // v1.1.0

Screens = {
    "Level Select": 0x00,
    "Solving Puzzle": 0x01,
    "Credits": 0x02,
    "Game Saved": 0x03,
    "Title Screen": 0x04,
    "How to Play": 0x05,
    "Congratulations": 0x06
}

ScreenIDLookup = {}
for key in Screens {
    ScreenIDLookup[Screens[key]] = key
}

//puzzles_solved = byte(0x00d151) // v1.0.0
//puzzles_solved = byte(0x00d164) // v1.1.0-private
puzzles_solved = byte(0x00d152) // v1.1.0
// current_puzzle_number = byte(0x00d2ff) + 1 // v1.0.0
current_puzzle_number = byte(0x00d300) + 1 // v1.1.0

// how_to_play_page = byte(0x00d302) + 1 // v1.0.0
how_to_play_page = byte(0x00d303) + 1 // v1.1.0-private

current_timer_location = 0x00c110
current_puzzle_seconds = low4(current_timer_location) + (high4(current_timer_location) * 10)
current_puzzle_minutes = low4(current_timer_location + 1) + (high4(current_timer_location + 1) * 10)
current_puzzle_total_time = current_puzzle_seconds + (current_puzzle_minutes * 60)

puzzle_records_start = 0x00a004

/////////////////
// Custom Data //
/////////////////

AchievementNames = {
    5: "Quickly Ripening",
    10: "Press Down to Paws",
    15: "Flightless Falsetto",
    20: "Sneaky Ships",
    25: "Moonlit Mirage",
    30: "Late Night Development",
    35: "Pretty Prawn",
    40: "Cheesy Stirfry",
    45: "Catching Claws",
    50: "Redecorating",
    55: "Milkshake",
    60: "Nutty for Wool",
    65: "Wireless Bleat",
    70: "Pangaea",
    75: "Slippin' on Bamboo",
    80: "Lo-Fi Beeps",
    85: "Hydration",
    90: "Magnetic Neko",
    95: "Jamming Out",
    100: "Desert Turf",
    105: "Tactical Takeout",
    110: "Frozen Flight",
    115: "Pineapple Smoothie",
    120: "Slicing a Slice",
    125: "Lucky Gift",
    130: "Nature's Spotlight",
    135: "Making a Delivery",
    140: "The Perfect Shot",
    145: "Scaly Sharpshooter",
    150: "A Beautiful View"
}

///////////////
// Functions //
///////////////

function get_raw_puzzle_record(num) {
    puzzle_record_offset = (num - 1) * 2
    return word(puzzle_records_start + puzzle_record_offset)
}

function new_puzzle_record(num) {
    return (prev(get_raw_puzzle_record(num)) == 0 && get_raw_puzzle_record(num) > 0) || ((get_raw_puzzle_record(num) < prev(get_raw_puzzle_record(num)) && get_raw_puzzle_record(num) != 0))
}

function any_puzzle_completed_or_updated() {
    puzzles = range(1, 150)
    return any_of(puzzles, new_puzzle_record)
}

// Returns the number of seconds a puzzle took to complete
function get_puzzle_record(num) {
    // Puzzles are stored sequentially, with two bytes representing seconds and minutes in BCD
    puzzle_record_offset = (num - 1) * 2
    puzzle_record_seconds = low4(puzzle_records_start + puzzle_record_offset) + (high4(puzzle_records_start + puzzle_record_offset) * 10)
    puzzle_record_minutes = (low4(puzzle_records_start + puzzle_record_offset + 1) * 60) + (high4(puzzle_records_start + puzzle_record_offset + 1) * 600)
    return puzzle_record_seconds + puzzle_record_minutes
}

function get_total_puzzle_time() {
    puzzles = range(1, 150)
    return sum_of(puzzles, get_puzzle_record)
}

// Returns 1 if the puzzle is solved, 0 otherwise
function is_puzzle_solved(num) {
    return get_raw_puzzle_record(num) / get_raw_puzzle_record(num)
}

function get_number_of_puzzles_solved() {
    puzzles = range(1, 150)
    return sum_of(puzzles, is_puzzle_solved)
}

function get_number_of_puzzles_solved_subset(start, end) {
    puzzles = range(start, end)
    return sum_of(puzzles, is_puzzle_solved)
}

function get_achievement_points(num) {
    if num <= 10 {
        return 2
    }
    if num <= 35 {
        return 3
    }
    if num <= 75 {
        return 4
    }
    if num <= 150 {
        return 5
    }
    return 0
}

////////////////////////////////////////
// Base achievements and leaderboards //
////////////////////////////////////////

for i in range(1, 150/5) {
    min = (i - 1) * 5 + 1
    max = i * 5
    achievement(
        title = AchievementNames[max],
        type = "progression",
        description = format("Solve puzzles {0} through {1}", min, max),
        points = get_achievement_points(max),
        trigger = screen_id == Screens["Solving Puzzle"]
        && current_puzzle_number >= min
        && current_puzzle_number <= max
        && prev(get_number_of_puzzles_solved_subset(min, max)) == 4
        && measured(get_number_of_puzzles_solved_subset(min, max) == 5)
    )
}

achievement(
    title = "Congratulations!!",
    type = "win_condition",
    description = format("You've completed all of the puzzles!"),
    points = 10,
    trigger = prev(screen_id) == Screens["Solving Puzzle"] && screen_id == Screens["Congratulations"] && puzzles_solved == 150
)

for i in range(1, 150) {
    leaderboard(
        title = format("Puzzle #{0}: Best Time", i),
        description = "Solve the puzzle as fast as you can!",
        start = screen_id == Screens["Solving Puzzle"]
                && current_puzzle_number == i
                && new_puzzle_record(i),
        cancel = always_false(),
        submit = always_true(), 
        value = get_puzzle_record(i), 
        format = "SECS",
        lower_is_better = true
    )
}

leaderboard(
    title = "Total Time",
    description = "Solve all of the puzzles as fast as you can!",
    start = screen_id == Screens["Solving Puzzle"]
            && puzzles_solved == 150
            && any_puzzle_completed_or_updated(),
    cancel = always_false(),
    submit = always_true(), 
    value = get_total_puzzle_time(),
    format = "SECS",
    lower_is_better = true
)

///////////////////
// Rich Presence //
///////////////////

PluralCheck = {
    1: ""
}

rich_presence_conditional_display(
    screen_id == Screens["Level Select"],
    "Selecting a puzzle • {0} Puzzle{1} Completed",
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_conditional_display(
    screen_id == Screens["Credits"],
    "Reading the credits • {0} Puzzle{1} Completed",
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_conditional_display(
    screen_id == Screens["Congratulations"],
    "Congratulations! • 150 Puzzles Completed"
)

rich_presence_conditional_display(
    screen_id == Screens["Game Saved"],
    "Game saved! • {0} Puzzle{1} Completed",
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_conditional_display(
    screen_id == Screens["Title Screen"],
    "At the title screen • {0} Puzzle{1} Completed",
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_conditional_display(
    screen_id == Screens["How to Play"],
    "Reading the manual • Page {0} • {1} Puzzle{2} Completed",
    rich_presence_value("Number", how_to_play_page),
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_conditional_display(
    screen_id == Screens["Solving Puzzle"],
    "Solving puzzle #{0} • Current Time: {1} • {2} Puzzle{3} Completed",
    rich_presence_value("Number", current_puzzle_number),
    rich_presence_value("Seconds", current_puzzle_total_time, "SECS"),
    rich_presence_value("Number", puzzles_solved),
    rich_presence_lookup("SwitchPlural", puzzles_solved, PluralCheck, fallback="s")
)

rich_presence_display(
    "Contemplating nonograms"
)
