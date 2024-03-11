// Gals Panic S3
// #ID = 15789

difficulties = {
    0x00: "Very Easy",
    0x01: "Easy",
    0x02: "Easy Plus",
    0x03: "Normal",
    0x04: "Normal Plus",
    0x05: "Difficult",
    0x06: "Very Difficult",
    0x07: "Ultra Difficult"
}

speeds = {
    0x00: "Very Slow",
    0x01: "Slow",
    0x02: "Normal",
    0x03: "Fast",
    0x04: "Very Fast"
}

characters = {
    0x0: "Nana",
    0x2: "Ayumi",
    0x4: "Nagomi",
    0x6: "Musashi",
    0x8: "Yomi",
    0xA: "Chen",
    0xC: "Hiyoko",
    0xE: "Haru"
}

stage = byte(0x0a01f0)
character = low4(0x0a01f4)
sp_difficulty = byte(0x196d17)
mp_difficulty = byte(0x196d16)
sp_speed = byte(0x196d1b)
mp_speed = byte(0x196d1a)
sp_lives = byte(0x196d15)
mp_lives = byte(0x196d14)
timer = word(0x0a01ea)
variant = high4(0x0a01f4) == 1
continues_disabled = byte(0x196d22) == 1

sp_normal = sp_difficulty >= 0x03
mp_normal = mp_difficulty >= 0x03
sp_difficult = sp_difficulty >= 0x05
mp_difficult = mp_difficulty >= 0x05

sp_normal_speed = sp_speed >= 0x02
mp_normal_speed = mp_speed >= 0x02


function stage_cleared(num) {
    return prev(stage) == num && stage == num + 1
}


function get_percentage() {
    return low4(0x0a01d9)
           + high4(0x0a01d9) * 10
           + low4(0x0a01da) * 100
}

function get_showtime() {
    return prev(get_percentage()) < 80
           && get_percentage() >= 90
           && get_percentage() < 100
}

function get_showtime_dx() {
    return prev(get_percentage()) < 80
           && get_percentage() == 100
}

function get_variant_showtime() {
    return prev(get_percentage()) < 80
           && get_percentage() >= 90
           && variant
}

function progression_sanity_check() {
    return sp_difficulty <= 0x07
    && mp_difficulty <= 0x07
    && sp_speed <= 0x04
    && mp_speed <= 0x04
}

function title_screen() {
    return stage == 0x00 || stage > 11
    || ((timer == 0x0a3f || timer == 0x0) && stage == 1 && character == 0 && get_percentage() == 2)
}

//////////////////////////////////////
// Progression with no restrictions //
//////////////////////////////////////

achievement(
    id = 406798,
    badge = "460598",
    title = "One Puzzle Down",
    description = "Clear Stage 1 with any settings!",
    points = 1,
    trigger = progression_sanity_check() && stage_cleared(1)
)

achievement(
    id = 406799,
    badge = "460599",
    title = "Casual Gal Fan",
    description = "Clear Stage 3 with any settings!",
    points = 2,
    trigger = progression_sanity_check() && stage_cleared(3)
)

achievement(
    id = 406800,
    badge = "460600",
    title = "Casual Gal Enthusiast",
    description = "Clear Stage 5 with any settings!",
    points = 3,
    trigger = progression_sanity_check() && stage_cleared(5)
)

achievement(
    id = 406801,
    badge = "460601",
    title = "Casual Gal Expert",
    description = "Clear Stage 10 with any settings!",
    points = 5,
    trigger = progression_sanity_check() && stage_cleared(10)
)

///////////////////////////////////////////
// Progression on Normal+, Normal+ Speed //
///////////////////////////////////////////

achievement(
    id = 406802,
    badge = "460602",
    title = "Gal Fan",
    description = "Clear Stage 3 on Normal or higher difficulty and Normal or higher speed!",
    points = 5,
    trigger = sp_normal && sp_normal_speed && stage_cleared(3)
)

achievement(
    id = 406803,
    badge = "460603",
    title = "Gal Enthusiast",
    description = "Clear Stage 5 on Normal or higher difficulty and Normal or higher speed!",
    points = 5,
    trigger = sp_normal && sp_normal_speed && stage_cleared(5)
)

achievement(
    id = 406804,
    badge = "460604",
    title = "Gal Expert",
    description = "Clear Stage 10 on Normal or higher difficulty and Normal or higher speed!",
    points = 10,
    trigger = sp_normal && sp_normal_speed && stage_cleared(10)
)

//////////////////////////////////////////////
// Progression on Difficult+, Normal+ Speed //
//////////////////////////////////////////////

achievement(
    id = 406805,
    badge = "460605",
    title = "Dedicated Gal Fan",
    description = "Clear Stage 3 on Difficult or higher difficulty and Normal or higher speed!",
    points = 5,
    trigger = sp_difficult && sp_normal_speed && stage_cleared(3)
)

achievement(
    id = 406806,
    badge = "460606",
    title = "Dedicated Gal Enthusiast",
    description = "Clear Stage 5 on Difficult or higher difficulty and Normal or higher speed!",
    points = 10,
    trigger = sp_difficult && sp_normal_speed && stage_cleared(5)
)

achievement(
    id = 406807,
    badge = "460607",
    title = "Dedicated Gal Expert",
    description = "Clear Stage 10 on Difficult or higher difficulty and Normal or higher speed!",
    points = 25,
    trigger = sp_difficult && sp_normal_speed && stage_cleared(10)
)

// Getting 90-99% with each character, non-variant, Normal+ difficulty, Normal+ Speed
i = 406808
b = 460580
for char in characters {
    achievement(
        id = i,
        badge = format("{0}", b),
        title = characters[char],
        description = format("Score between 90% to 99% on {0}'s non-variant stage to activate Show Time, on Normal or higher difficulty and Normal or higher speed!", characters[char]),
        points = 10,
        trigger = sp_normal && sp_normal_speed && character == char && !variant && get_showtime()
    )
    i = i + 1
    b = b + 1
}

// Getting 100% with each character, non-variant, Normal+ difficulty, Normal+ Speed
i = 406816
b = 460588
for char in characters {
    achievement(
        id = i,
        badge = format("{0}", b),
        title = format("{0} DX", characters[char]),
        description = format("Score 100% on {0}'s non-variant stage to activate Show Time DX, on Normal or higher difficulty and Normal or higher speed!", characters[char]),
        points = 25,
        trigger = sp_normal && sp_normal_speed && character == char && !variant && get_showtime_dx()
    )
    i = i + 1
    b = b + 1
}

// Getting 90%+ with each character, variant, Normal+ difficulty, Normal+ Speed
i = 406824
b = 460615
for char in characters {
    achievement(
        id = i,
        badge = format("{0}", b),
        title = format("{0} Alternate", characters[char]),
        description = format("Score 90% or higher on {0}'s variant stage to activate Show Time, on Normal or higher difficulty and Normal or higher speed!", characters[char]),
        points = 10,
        trigger = sp_normal && sp_normal_speed && character == char && variant && get_variant_showtime()
    )
    i = i + 1
    b = b + 1
}

// Clearing the game on Normal+, Normal+ Speed with continues disabled
achievement(
    id = 406866,
    badge = "460608",
    title = "Gal Master",
    description = "Beat the game with playable units set to 3 and continues disabled, on Normal or higher difficulty and Normal or higher speed!",
    points = 50,
    trigger = continues_disabled && sp_lives == 0x03 && sp_normal && sp_normal_speed && stage_cleared(10)
)

rich_presence_conditional_display(title_screen(), "At the title screen")
rich_presence_conditional_display(stage == 11, "At the end of the game • {0} Difficulty • {1} Timer Speed",
    rich_presence_lookup("Difficulty", sp_difficulty, difficulties),
    rich_presence_lookup("TimerSpeed", sp_speed, speeds))
rich_presence_display("On stage {0} ({1}) • {2} Difficulty • {3} Timer Speed", 
    rich_presence_value("Stage", stage),
    rich_presence_lookup("Character", character, characters),
    rich_presence_lookup("Difficulty", sp_difficulty, difficulties),
    rich_presence_lookup("TimerSpeed", sp_speed, speeds)
)
