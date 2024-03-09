// Son Son II
// #ID = 8907

function get_zenny() {
    return (low4(0x020e) * 10000) +
    (low4(0x020f) * 1000) +
    (low4(0x0210) * 100) +
    (low4(0x0211) * 10) +
    low4(0x0212)
}

function get_score() {
    return (low4(0x0203) * 10000000) +
    (low4(0x0204) * 1000000) +
    (low4(0x0205) * 100000) +
    (low4(0x0206) * 10000) +
    (low4(0x0207) * 1000) +
    (low4(0x0208) * 100) +
    (low4(0x0209) * 10) +
    low4(0x020a)
}

function get_health() => byte(0x02b8)
function get_max_health() => byte(0x02b9)
function get_stage_number() => byte(0x0069) + 1
function get_staff_level() => byte(0x0072) + 1
function get_cucumber() => bit5(0x02c1)
function get_meat_bun() => bit6(0x02c1)
function get_magic_clothes() => bit7(0x02c1)

function get_stage_time() {
    return high4(0x0066) * (60*60*10) + // Minutes - Tens
    low4(0x0066) * (60*60) + // Minutes - Ones
    high4(0x0067) * (60*10) + // Seconds - Tens
    low4(0x0067) * (60) + // Seconds - Ones
    high4(0x0068) * (10) + // Frames - Tens
    low4(0x0068) // Frames - Ones
}

function stage_cleared(stage_number) {
    return prev(get_stage_number()) == (stage_number) &&
    get_stage_number() == (stage_number + 1)
    //prev(bit4(0x018e)) == 1 &&
    //prev(bit3(0x018e)) == 1 &&
    //prev(bit0(0x018e)) == 1 &&
    //bit4(0x018e) == 0 &&
    //bit3(0x018e) == 0 &&
    //bit0(0x018e) == 0
}

function game_beat() {
    return get_stage_number() == 7 && get_health() == 0
    && get_max_health() == 0 && get_zenny() < prev(get_zenny()) 
    && get_score() > prev(get_score()) && get_zenny() == 0
}

// STAGE 1 //
// Standard clear
achievement(
    id = 396342,
    badge = "448377",
    title = "Kokiri Taisen",
    description = "Defeat Kokiri Taisen and clear Stage 1!",
    points = 3,
    trigger = stage_cleared(1)
)

// STAGE 2 //
// Staff Upgrade
achievement(
    id = 396341,
    badge = "448376",
    title = "Pincer Attack",
    description = "Obtain the Level 2 Staff on Stage 2!",
    points = 2,
    trigger = (get_stage_number() == 2) && prev(get_staff_level()) == 1 && get_staff_level() == 2
)

// Standard clear
achievement(
    id = 396343,
    badge = "448378",
    title = "Kogaiji",
    description = "Defeat Kogaiji and clear Stage 2!",
    points = 5,
    trigger = stage_cleared(2)
)

// Grounded: Defeat Kogaiji without the cloud!

// STAGE 3 //
// Meat time
achievement(
    id = 406564,
    badge = "459557",
    title = "Isn't This a Meat Bun?",
    description = "Obtain some pig food in Stage 3!",
    points = 3,
    trigger = get_stage_number() == 3 && prev(get_meat_bun()) == 0 && get_meat_bun() == 1
)

// Staff Upgrade
achievement(
    id = 396518,
    badge = "448435",
    title = "Fly Like an Arrow",
    description = "Obtain the Level 3 Staff on Stage 3 or Stage 4!",
    points = 3,
    trigger = (get_stage_number() == 3 || get_stage_number() == 4) && prev(get_staff_level()) <= 2 && get_staff_level() == 3
)

// Standard clear
achievement(
    id = 396519,
    badge = "448438",
    title = "Mirror Match",
    description = "Defeat the doppleganger and clear Stage 3!",
    points = 5,
    trigger = stage_cleared(3)
)

// STAGE 4 //
// Kappa food
achievement(
    id = 406560,
    badge = "459551",
    title = "Going Vegan",
    description = "Trade for a cucumber in Stage 4!",
    points = 3,
    trigger = get_stage_number() == 4 && prev(get_cucumber()) == 0 && get_cucumber() == 1
)

// Staff Upgrade
achievement(
    id = 406561,
    badge = "459553",
    title = "Poseidon's Recommendation",
    description = "Obtain the Level 4 Staff on Stage 4!",
    points = 4,
    trigger = get_stage_number() == 4 && prev(get_staff_level()) <= 3 && get_staff_level() == 4
)

// Standard clear
achievement(
    id = 406562,
    badge = "459556",
    title = "Fiery Vengence",
    description = "Defeat Ryuriki Taisen and clear Stage 4!",
    points = 5,
    trigger = stage_cleared(4)
)

// STAGE 5 //
// Staff Upgrade
achievement(
    id = 406594,
    badge = "460082",
    title = "Gilius Thunderhead",
    description = "Obtain the Level 5 Staff on Stage 5 or Stage 6!",
    points = 5,
    trigger = (get_stage_number() == 5 || get_stage_number() == 6) && prev(get_staff_level()) <= 4 && get_staff_level() == 5
)

// Standard clear
achievement(
    id = 406595,
    badge = "460083",
    title = "Gold and Silver, Silver and Gold",
    description = "Defeat Kin Kaku and clear Stage 5!",
    points = 10,
    trigger = stage_cleared(5)
)

// STAGE 6 //
// Standard clear
achievement(
    id = 406596,
    badge = "460085",
    title = "Moving With the Wind",
    description = "Defeat Rasetsu and clear Stage 6!",
    points = 10,
    trigger = stage_cleared(6)
)

// STAGE 7 //
// Staff Upgrade
achievement(
    id = 406597,
    badge = "460086",
    title = "Elemental Advantage",
    description = "Obtain the Level 6 Staff on Stage 7!",
    points = 10,
    trigger = get_stage_number() == 7 && prev(get_staff_level()) <= 5 && get_staff_level() == 6
)

// New Robes
achievement(
    id = 406598,
    badge = "460087",
    title = "The End of the Swap",
    description = "Trade for some new clothes in Stage 7!",
    points = 5,
    trigger = get_stage_number() == 7 && prev(get_magic_clothes()) == 0 && get_magic_clothes() == 1
)

// Standard clear
achievement(
    id = 406599,
    badge = "460088",
    title = "The Final Rescue",
    description = "Defeat Gyumao and beat the game!",
    points = 25,
    trigger = game_beat()
)

// Collect a Yashichi to increase your max health! (0x0e -> 0x10, 3p)
achievement(
    id = 406577,
    badge = "459559",
    title = "The Capcom Standard",
    description = "Collect a Yashichi to increase your max health!",
    points = 3,
    trigger = prev(get_max_health()) == 0x0e && get_max_health() == 0x10
)
// Collect enough Yashichi to max out your health bar! (0x16 -> 0x18, 10p)
achievement(
    id = 406578,
    badge = "459560",
    title = "Sturdy Son",
    description = "Collect enough Yashichi to max out your health bar!",
    points = 10,
    trigger = prev(get_max_health()) == 0x16 && get_max_health() == 0x18
)

// Speedrun leaderboards
for i in range(1, 6) {
    leaderboard(
        id = 88652 + i,
        title = format("Stage {0} Speedrun", i),
        description = format("Clear Stage {0} as fast as you can!", i),
        start = stage_cleared(i),
        cancel = always_false(),
        submit = always_true(), 
        value = prev(get_stage_time()), 
        format = "FRAMES",
        lower_is_better = true
    )
}

leaderboard(
    id = 88659,
    title = "Stage 7 Speedrun",
    description = "Clear Stage 7 as fast as you can!",
    start = game_beat(),
    cancel = always_false(),
    submit = always_true(), 
    value = prev(get_stage_time()), 
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    id = 91789,
    title = "High Score",
    description = "Beat the game with as high of a score as you can!",
    start = game_beat(),
    cancel = always_false(),
    submit = always_true(), 
    value = get_score(), 
    format = "VALUE"
)

rich_presence_conditional_display(
    get_stage_number() == 1 && get_max_health() == 0, 
    "At the title screen"
)

rich_presence_display(
    "Stage {0} • {1}/{2} HP • Staff Level {3} • Zenny: {4} • Score: {5}",
    rich_presence_value("Stage", get_stage_number()),
    rich_presence_value("Health", get_health()),
    rich_presence_value("Max Health", get_max_health()),
    rich_presence_value("Staff", get_staff_level()),
    rich_presence_value("Zenny", get_zenny()),
    rich_presence_value("Score", get_score())
)
