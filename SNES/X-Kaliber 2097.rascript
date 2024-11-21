// X-Kaliber 2097
// #ID = 1343

RoomLookup = {
    0x00: "Stage 1, Room 1",
    0x01: "Stage 1, Room 2",
    0x02: "Stage 1, Room 3",
    0x0D: "Stage 1, Versus Tattoo",
    0x03: "Stage 2, Room 1",
    0x04: "Stage 2, Room 2",
    0x05: "Stage 2, Room 3",
    0x0E: "Stage 2, Versus Chainsaw",
    0x09: "Stage 3, Room 1",
    0x0A: "Stage 3, Room 2",
    0x0B: "Stage 3, Room 3",
    0x0F: "Stage 3, Versus Kane",
    0x11: "Stage 4, Room 1",
    0x12: "Stage 4, Room 2",
    0x13: "Stage 4, Room 3",
    0x15: "Stage 4, Versus Dr. Blast",
    0x16: "Stage 5, Room 1",
    0x18: "Stage 5, Versus Raptor",
    0x19: "Stage 6, Room 1",
    0x1B: "Stage 6, Versus Spuke",
    0x1C: "Versus Krux",    
}

RoomToID = {}
for key in RoomLookup {
    RoomToID[RoomLookup[key]] = key
}

DifficultyLookup = {
    0x01: "Hardest",
    0x02: "Expert",
    0x03: "Very Hard",
    0x04: "Hard",
    0x05: "Normal",
    0x06: "Easy",
    0x07: "Very Easy",
    0x08: "Easiest"
}

DifficultyToID = {}
for key in DifficultyLookup {
    DifficultyToID[DifficultyLookup[key]] = key
}

difficulty = byte(0x000a47)
room_id = byte(0x000a0a)
health = byte(0x000a18)
lives_setting = byte(0x000a3d)
continues_setting = byte(0x000a4a)
continues = byte(0x000a46)
boss_health = byte(0x000a28)
lives = byte(0x000a3e)

invincibility_cheat_off = byte(0x000a6d) == 0
invincibility_cheat_on = byte(0x000a6d) == 1
in_demo = byte(0x000a33) == 1
cheat_input_counter = byte(0x000a5f)
disable_if_cheat_detected = disable_when(prev(cheat_input_counter) == 7 && cheat_input_counter == 8)
stage_select_detected = once(prev(room_id) == 0x01 && room_id == RoomToID["Stage 1, Versus Tattoo"]
                          || prev(room_id) == 0x03 && room_id == RoomToID["Stage 2, Versus Chainsaw"]
                          || prev(room_id) == 0x05 && room_id == RoomToID["Stage 3, Versus Kane"]
                          || prev(room_id) == 0x07 && room_id == RoomToID["Stage 4, Versus Dr. Blast"]
                          || prev(room_id) == 0x09 && room_id == RoomToID["Stage 5, Versus Raptor"]
                          || prev(room_id) == 0x0b && room_id == RoomToID["Stage 6, Versus Spuke"])
disable_if_stage_select = disable_when(prev(room_id) == 0x01 && room_id == RoomToID["Stage 1, Versus Tattoo"])
                          && disable_when(prev(room_id) == 0x03 && room_id == RoomToID["Stage 2, Versus Chainsaw"])
                          && disable_when(prev(room_id) == 0x05 && room_id == RoomToID["Stage 3, Versus Kane"])
                          && disable_when(prev(room_id) == 0x07 && room_id == RoomToID["Stage 4, Versus Dr. Blast"])
                          && disable_when(prev(room_id) == 0x09 && room_id == RoomToID["Stage 5, Versus Raptor"])
                          && disable_when(prev(room_id) == 0x0b && room_id == RoomToID["Stage 6, Versus Spuke"])

function room_id_is(name) {
    return room_id == RoomToID[name]
}

// achievement(
//     title = "Stage 1", points = 5, type="progression",
//     description = "Clear Stage 1 (Normal)",
//     id = 10097, badge = "09729", published = "7/8/2014 17:59:58", modified = "1/31/2020 09:38:07",
//     trigger = repeated(10, byte(0x000A0A) == 3) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5)
// )

achievement(
    title = "Another Man With a Bad Tattoo", // Another Man With a Bad Tattoo
    points = 5,
    type = "progression",
    description = "Defeat Tattoo on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 1, Versus Tattoo"] && room_id == RoomToID["Stage 2, Room 1"]
              && disable_when(prev(room_id) == 0x01 && room_id == RoomToID["Stage 1, Versus Tattoo"])
              && never(!any_of(["Stage 1, Versus Tattoo", "Stage 2, Room 1"], room_id_is))
)

// achievement(
//     title = "Stage 2", points = 5, type="progression",
//     description = "Clear Stage 2 (Normal)",
//     id = 10098, badge = "09730", published = "7/8/2014 18:00:01", modified = "3/29/2024 12:41:45",
//     trigger = repeated(10, byte(0x000A0A) == 9) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5) &&
//               never(prev(word_be(0x000A21)) == word_be(0x000A21))
// )

achievement(
    title = "No One in This City Has Manners", // No One in This City Has Manners
    points = 5,
    type = "progression",
    description = "Defeat Chainsaw on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 2, Versus Chainsaw"] && room_id == RoomToID["Stage 3, Room 1"]
              && disable_when(prev(room_id) == 0x03 && room_id == RoomToID["Stage 2, Versus Chainsaw"])
              && never(!any_of(["Stage 2, Versus Chainsaw", "Stage 3, Room 1"], room_id_is))
)

// achievement(
//     title = "Stage 3", points = 5, type="progression",
//     description = "Clear Stage 3 (Normal)",
//     id = 10099, badge = "09731", published = "7/8/2014 18:00:04", modified = "1/31/2020 09:38:04",
//     trigger = repeated(10, byte(0x000A0A) == 17) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5)
// )

achievement(
    title = "You Must Be Kane", // You Must Be Kane
    points = 5,
    type = "progression",
    description = "Defeat Kane on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 3, Versus Kane"] && room_id == RoomToID["Stage 4, Room 1"]
              && disable_when(prev(room_id) == 0x05 && room_id == RoomToID["Stage 3, Versus Kane"])
              && never(!any_of(["Stage 3, Versus Kane", "Stage 4, Room 1"], room_id_is))
)

// achievement(
//     title = "Stage 4", points = 10, type="progression",
//     description = "Clear Stage 4 (Normal)",
//     id = 10100, badge = "09732", published = "7/8/2014 18:00:08", modified = "1/31/2020 09:38:02",
//     trigger = repeated(10, byte(0x000A0A) == 22) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5)
// )

achievement(
    title = "Pardon Me if I'm Not Impressed", // Pardon Me if I'm Not Impressed
    points = 10,
    type = "progression",
    description = "Defeat Dr. Blast on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 4, Versus Dr. Blast"] && room_id == RoomToID["Stage 5, Room 1"]
              && disable_when(prev(room_id) == 0x07 && room_id == RoomToID["Stage 4, Versus Dr. Blast"])
              && never(!any_of(["Stage 4, Versus Dr. Blast", "Stage 5, Room 1"], room_id_is))
)

// achievement(
//     title = "Stage 5", points = 10, type="progression",
//     description = "Clear Stage 5 (Normal)",
//     id = 10101, badge = "09733", published = "7/8/2014 18:00:11", modified = "1/31/2020 09:38:03",
//     trigger = repeated(10, byte(0x000A0A) == 25) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5)
// )

achievement(
    title = "Even if We're Flesh and Blood", // Even if We're Flesh and Blood
    points = 10,
    type = "progression",
    description = "Defeat Raptor on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 5, Versus Raptor"] && room_id == RoomToID["Stage 6, Room 1"]
              && disable_when(prev(room_id) == 0x09 && room_id == RoomToID["Stage 5, Versus Raptor"])
              && never(!any_of(["Stage 5, Versus Raptor", "Stage 6, Room 1"], room_id_is))
)

// achievement(
//     title = "Stage 6", points = 10, type="progression",
//     description = "Clear Stage 6 (Normal)",
//     id = 10102, badge = "09735", published = "7/8/2014 18:00:15", modified = "1/31/2020 09:37:59",
//     trigger = repeated(10, byte(0x000A0A) == 28) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5)
// )

achievement(
    title = "Quit Yapping, Spuke!", // Quit Yapping, Spuke!
    points = 10,
    type = "progression",
    description = "Defeat Spuke on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && prev(room_id) == RoomToID["Stage 6, Versus Spuke"] && room_id == RoomToID["Versus Krux"]
              && disable_when(prev(room_id) == 0x0b && room_id == RoomToID["Stage 6, Versus Spuke"])
              && never(!any_of(["Stage 6, Versus Spuke", "Versus Krux"], room_id_is))
)

// achievement(
//     title = "Beat the Game", points = 25, type="win_condition",
//     description = "Beat the Game (Normal)",
//     id = 10103, badge = "09736", published = "7/8/2014 18:00:18", modified = "1/31/2020 09:37:58",
//     trigger = repeated(10, byte(0x000A0A) == 0) && never(byte(0x000A33) == 1) && never(byte(0x000A48) == 11) &&
//               never(byte(0x000A6D) == 1) && repeated(10, byte(0x000A47) == 5) && never(byte(0x000A47) != 5) &&
//               never(byte(0x000A0A) != 0) && repeated(10, byte(0x0015C0) == 177)
// )

achievement(
    title = "The Warlords Have Fallen", // The Warlords Have Fallen
    points = 25,
    type = "win_condition",
    description = "Defeat Krux and beat the game on Normal difficulty or higher",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty <= DifficultyToID["Normal"]
              && never(room_id != RoomToID["Versus Krux"])
              && once(boss_health >= 0x9f)
              && prev(boss_health > 0)
              && boss_health == 0
)

// Clear the game in one session with continues set to 0 on Normal difficulty or higher, Cutting Through a Coin
achievement(
    title = "Cutting Through a Coin",
    points = 25,
    description = "Clear the game in one session with continues set to 0 on Normal difficulty or higher",
    trigger = never(invincibility_cheat_on)
              && !in_demo
              && never(difficulty > DifficultyToID["Normal"])
              && continues_setting == 0
              && continues == 0
              && trigger_when(
                  once(prev(room_id) == RoomToID["Stage 1, Versus Tattoo"] && room_id == RoomToID["Stage 2, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 2, Versus Chainsaw"] && room_id == RoomToID["Stage 3, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 3, Versus Kane"] && room_id == RoomToID["Stage 4, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 4, Versus Dr. Blast"] && room_id == RoomToID["Stage 5, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 5, Versus Raptor"] && room_id == RoomToID["Stage 6, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 6, Versus Spuke"] && room_id == RoomToID["Versus Krux"])
                  && once(
                    room_id == RoomToID["Versus Krux"]
                    && once(boss_health >= 0x9f)
                    && prev(boss_health > 0)
                    && boss_health == 0
                  )
              )
              && disable_if_stage_select
              && never(lives == 0)
)

// Clear the game in one session with continues set to 0 on Very Hard difficulty or higher, No Mercy for the Penniless
achievement(
    title = "No Mercy for the Penniless",
    points = 50,
    description = "Clear the game in one session with continues set to 0 on Very Hard difficulty or higher",
    trigger = never(invincibility_cheat_on)
              && !in_demo
              && never(difficulty > DifficultyToID["Very Hard"])
              && continues_setting == 0
              && continues == 0
              && trigger_when(
                  once(prev(room_id) == RoomToID["Stage 1, Versus Tattoo"] && room_id == RoomToID["Stage 2, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 2, Versus Chainsaw"] && room_id == RoomToID["Stage 3, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 3, Versus Kane"] && room_id == RoomToID["Stage 4, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 4, Versus Dr. Blast"] && room_id == RoomToID["Stage 5, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 5, Versus Raptor"] && room_id == RoomToID["Stage 6, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 6, Versus Spuke"] && room_id == RoomToID["Versus Krux"])
                  && once(
                    room_id == RoomToID["Versus Krux"]
                    && once(boss_health >= 0x9f)
                    && prev(boss_health > 0)
                    && boss_health == 0
                  )
              )
              && disable_if_stage_select
              && never(lives == 0)
)

// Clear the game in one session with continues set to 0 and lives set to 1 on any difficulty, 
achievement(
    title = "It's All Right. It's Over.",
    points = 50,
    description = "Clear the game in one session without losing a life, with continues set to 0 and lives set to 1 on any difficulty",
    trigger = never(invincibility_cheat_on)
              && !in_demo
              && continues_setting == 0
              && continues == 0
              && lives_setting == 1
              && never(lives < prev(lives))
              && trigger_when(
                  once(prev(room_id) == RoomToID["Stage 1, Versus Tattoo"] && room_id == RoomToID["Stage 2, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 2, Versus Chainsaw"] && room_id == RoomToID["Stage 3, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 3, Versus Kane"] && room_id == RoomToID["Stage 4, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 4, Versus Dr. Blast"] && room_id == RoomToID["Stage 5, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 5, Versus Raptor"] && room_id == RoomToID["Stage 6, Room 1"])
                  && once(prev(room_id) == RoomToID["Stage 6, Versus Spuke"] && room_id == RoomToID["Versus Krux"])
                  && once(
                    room_id == RoomToID["Versus Krux"]
                    && once(boss_health >= 0x9f)
                    && prev(boss_health > 0)
                    && boss_health == 0
                  )
              )
              && disable_if_stage_select
              && never(lives == 0)
)

// Starting at the beginning of stage 1, defeat Tattoo on Hardest difficulty (stage select allowed), No One Insults My Rose
achievement(
    title = "No One Insults My Rose",
    points = 10,
    description = "Starting at the beginning of stage 1, defeat Tattoo on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 1, Room 1"] && room_id == RoomToID["Stage 1, Room 2"])
              && once(prev(room_id) == RoomToID["Stage 1, Room 2"] && room_id == RoomToID["Stage 1, Room 3"])
              && once(prev(room_id) == RoomToID["Stage 1, Room 3"] && room_id == RoomToID["Stage 1, Versus Tattoo"])
              && once(prev(room_id) == RoomToID["Stage 1, Versus Tattoo"] && room_id == RoomToID["Stage 2, Room 1"])
              && disable_if_stage_select
              && never(!any_of(["Stage 1, Room 1", "Stage 1, Room 2", "Stage 1, Room 3",
              "Stage 1, Versus Tattoo", "Stage 2, Room 1"], room_id_is))
)

// Starting at the beginning of stage 2, defeat Chainsaw on Hardest difficulty (stage select allowed), You Worthless Sack of Flesh
achievement(
    title = "You Worthless Sack of Flesh",
    points = 10,
    description = "Starting at the beginning of stage 2, defeat Chainsaw on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 2, Room 1"] && room_id == RoomToID["Stage 2, Room 2"])
              && once(prev(room_id) == RoomToID["Stage 2, Room 2"] && room_id == RoomToID["Stage 2, Room 3"])
              && once(prev(room_id) == RoomToID["Stage 2, Room 3"] && room_id == RoomToID["Stage 2, Versus Chainsaw"])
              && once(prev(room_id) == RoomToID["Stage 2, Versus Chainsaw"] && room_id == RoomToID["Stage 3, Room 1"])
              && disable_if_stage_select
              && never(!any_of(["Stage 2, Room 1", "Stage 2, Room 2", "Stage 2, Room 3",
              "Stage 2, Versus Chainsaw", "Stage 3, Room 1"], room_id_is))
)

// Starting at the beginning of stage 3, defeat Kane on Hardest difficulty (stage select allowed), The One and Only
achievement(
    title = "The One and Only",
    points = 10,
    description = "Starting at the beginning of stage 3, defeat Kane on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 3, Room 1"] && room_id == RoomToID["Stage 3, Room 2"])
              && once(prev(room_id) == RoomToID["Stage 3, Room 2"] && room_id == RoomToID["Stage 3, Room 3"])
              && once(prev(room_id) == RoomToID["Stage 3, Room 3"] && room_id == RoomToID["Stage 3, Versus Kane"])
              && once(prev(room_id) == RoomToID["Stage 3, Versus Kane"] && room_id == RoomToID["Stage 4, Room 1"])
              && disable_if_stage_select
              && never(!any_of(["Stage 3, Room 1", "Stage 3, Room 2", "Stage 3, Room 3",
              "Stage 3, Versus Kane", "Stage 4, Room 1"], room_id_is))
)

// Starting at the beginning of stage 4, defeat Dr. Blast on Hardest difficulty (stage select allowed), And You're Like an Ant
achievement(
    title = "And You're Like an Ant",
    points = 25,
    description = "Starting at the beginning of stage 4, defeat Dr. Blast on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 4, Room 1"] && room_id == RoomToID["Stage 4, Room 2"])
              && once(prev(room_id) == RoomToID["Stage 4, Room 2"] && room_id == RoomToID["Stage 4, Room 3"])
              && once(prev(room_id) == RoomToID["Stage 4, Room 3"] && room_id == RoomToID["Stage 4, Versus Dr. Blast"])
              && once(prev(room_id) == RoomToID["Stage 4, Versus Dr. Blast"] && room_id == RoomToID["Stage 5, Room 1"])
              && disable_if_stage_select
              && never(!any_of(["Stage 4, Room 1", "Stage 4, Room 2", "Stage 4, Room 3",
              "Stage 4, Versus Dr. Blast", "Stage 5, Room 1"], room_id_is))
)

// Starting at the beginning of stage 5, defeat Raptor on Hardest difficulty (stage select allowed), I Have a Mean Blade
achievement(
    title = "I Have a Mean Blade",
    points = 25,
    description = "Starting at the beginning of stage 5, defeat Raptor on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 5, Room 1"] && room_id == RoomToID["Stage 5, Versus Raptor"])
              && once(prev(room_id) == RoomToID["Stage 5, Versus Raptor"] && room_id == RoomToID["Stage 6, Room 1"])
              && disable_if_stage_select
              && never(!any_of(["Stage 5, Room 1", "Stage 5, Versus Raptor", "Stage 6, Room 1"], room_id_is))
)

// Starting at the beginning of stage 6, defeat Spuke on Hardest difficulty (stage select allowed), I've Come to Take It Back
achievement(
    title = "I've Come to Take It Back",
    points = 25,
    description = "Starting at the beginning of stage 6, defeat Spuke on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && once(prev(room_id) == RoomToID["Stage 6, Room 1"] && room_id == RoomToID["Stage 6, Versus Spuke"])
              && once(prev(room_id) == RoomToID["Stage 6, Versus Spuke"] && room_id == RoomToID["Versus Krux"])
              && disable_if_stage_select
              && never(!any_of(["Stage 6, Room 1", "Stage 6, Versus Spuke", "Versus Krux"], room_id_is))
)

// Defeat Krux and beat the game on Hardest difficulty (stage select allowed), 
achievement(
    title = "Your Planet's Mine",
    points = 25,
    description = "Defeat Krux and beat the game on Hardest difficulty (stage select allowed)",
    trigger = invincibility_cheat_off
              && !in_demo
              && difficulty == DifficultyToID["Hardest"]
              && never(room_id != RoomToID["Versus Krux"])
              && once(boss_health == 0xc7)
              && prev(boss_health > 0)
              && boss_health == 0
              && disable_if_stage_select
)

rich_presence_conditional_display(
    lives == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    in_demo,
    "Watching a demo"
)

rich_presence_display(
    "{0} | {1} Difficulty | HP: {2}/160 | Lives: {3} | Continues: {4}",
    rich_presence_lookup("Area", room_id, RoomLookup, fallback="Unknown Area"),
    rich_presence_lookup("Difficulty", difficulty, DifficultyLookup, fallback="Unknown"),
    rich_presence_value("Number", health),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", continues)
)

