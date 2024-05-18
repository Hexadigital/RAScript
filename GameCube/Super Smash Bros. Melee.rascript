// Super Smash Bros. Melee
// #ID = 9602

CharacterLookup = {
    0x00: "Captain Falcon",
    0x01: "Donkey Kong",
    0x02: "Fox",
    0x03: "Mr. Game & Watch",
    0x04: "Kirby",
    0x05: "Bowser",
    0x06: "Link",
    0x07: "Luigi",
    0x08: "Mario",
    0x09: "Marth",
    0x0A: "Mewtwo",
    0x0B: "Ness",
    0x0C: "Peach",
    0x0D: "Pikachu",
    0x0E: "Ice Climbers",
    0x0F: "Jigglypuff",
    0x10: "Samus",
    0x11: "Yoshi",
    0x12: "Zelda",
    0x13: "Sheik",
    0x14: "Falco",
    0x15: "Young Link",
    0x16: "Dr. Mario",
    0x17: "Roy",
    0x18: "Pichu",
    0x19: "Ganondorf"
}

CharacterToID = {}
for key in CharacterLookup {
    CharacterToID[CharacterLookup[key]] = key
}

area_id = dword_be(0x004d49e8)
character_id = byte(0x00480820)
mode_id = byte(0x00479d30)
// 0x00453130: Pointer to Player Data [32-bit BE]
// +0x228F = Game & Watch: Current/Last Judgement Number [8-bit]
// +0x22C4 = Game & Watch: Judgement Pointer? [32-bit BE] (Zeroed out when hammer is not out, random pointer when hammer is out)
judgement_number = byte(tbyte_be(0x00453131) + 0x228F) + 1
judgement_pointer = dword_be(tbyte_be(0x00453131) + 0x22C4)
hammer_out = judgement_pointer != 0

multiman_melee_character_id = byte(0x004735a3)
multiman_melee_kills = word_be(0x00473596)
multiman_melee_frames_passed = dword_be(0x00473598)
multiman_success = prev(byte(0x00473594)) == 0 && byte(0x00473594) == 1

function mode_check(mode) {
    return mode_id == mode
}

good_modes = [
    0x03, // Classic
    0x04, // Adventure
    0x05, // All-Star
    0x2b, // Event Match
    0x21, // 10-Man Melee
    0x22, // 100-Man Melee
    0x23, // 3-Minute Melee
    0x24, // 15-Minute Melee
    0x25, // Endless Melee
    0x26, // Cruel Melee
]

in_a_good_mode = any_of(good_modes, mode_check)
in_10man_melee = mode_check(0x21)
in_100man_melee = mode_check(0x22)
in_3min_melee = mode_check(0x23)
in_15min_melee = mode_check(0x24)
in_endless_melee = mode_check(0x25)
in_cruel_melee = mode_check(0x26)

p2_damage = word_be(0x00453f70)
p3_damage = word_be(0x00454e00)
p4_damage = word_be(0x00455c90)
p1_stocks = byte(0x0045310e)

// Flat Zone (Event #45) (Game and Watch Forever!)
area_in_event_45 = area_id == 0xF6
// Battlefield (Multi-Man Melee)
area_in_multiman_melee = area_id == 0x11d
playing_as_gameandwatch = character_id == CharacterToID["Mr. Game & Watch"]

function damage_taken(player, amount) {
    if player == "p2" {
        return (p2_damage - prev(p2_damage)) >= amount
    }
    if player == "p3" {
        return (p3_damage - prev(p3_damage)) >= amount
    }
    if player == "p4" {
        return (p4_damage - prev(p4_damage)) >= amount
    }
}

achievement(
    title = "I'm The Strongest!",
    points = 1,
    description = "Land a 9 on a CPU in any single-player mode using Mr. Game & Watch's Judgement",
    trigger = in_a_good_mode
              && playing_as_gameandwatch
              && hammer_out
              && judgement_number == 9
              && (damage_taken("p2", 15) || damage_taken("p3", 15) || damage_taken("p4", 15))
)

//Centurion Get 100+ KOs in Endless Melee 
achievement(
    title = "Centurion",
    points = 10,
    description = "Get 100+ KOs in Endless Melee",
    trigger = in_endless_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && prev(multiman_melee_kills) >= 95
              && prev(multiman_melee_kills) < 100
              && multiman_melee_kills >= 100
              && multiman_melee_kills < 105
)


//Not a Beat 'Em Up Complete 3-Minute Melee
achievement(
    title = "Not a Beat 'Em Up",
    points = 2,
    description = "Complete 3-Minute Melee",
    trigger = in_3min_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && multiman_success
)

//Wired to Survive Complete 15-Minute Melee, unlocking the Kongo Jungle stage
achievement(
    title = "Wired to Survive",
    points = 10,
    description = "Complete 15-Minute Melee, unlocking the Kongo Jungle stage",
    trigger = in_15min_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && multiman_success
)

//Give Me One Second Complete 10-Man Melee in under 12 seconds
achievement(
    title = "Give Me One Second",
    points = 3,
    description = "Complete 10-Man Melee within 12 seconds",
    trigger = in_10man_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && multiman_melee_frames_passed <= 12 * 60
              && multiman_success
)

//Two Four You Complete 100-Man Melee within 240 seconds
achievement(
    title = "Two Four You",
    points = 10,
    description = "Complete 100-Man Melee within 240 seconds",
    trigger = in_100man_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && multiman_melee_frames_passed <= 240 * 60
              && multiman_success
)

//Tough Crowd KO more than 5 opponents in Cruel Melee
achievement(
    title = "Tough Crowd",
    points = 5,
    description = "KO more than 5 opponents in Cruel Melee",
    trigger = in_cruel_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && prev(multiman_melee_kills) < 5
              && multiman_melee_kills >= 5
              && multiman_melee_kills < 10
)

for c in CharacterToID {
    leaderboard(
        title = format("10-Man Melee: {0}", c),
        description = "Complete it as fast as you can!",
        start = in_10man_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && p1_stocks == 1
              && multiman_success,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_frames_passed,
        format = "FRAMES",
        lower_is_better = true
    )
}
for c in CharacterToID {
    leaderboard(
        title = format("100-Man Melee: {0}", c),
        description = "Complete it as fast as you can!",
        start = in_100man_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && p1_stocks == 1
              && multiman_success,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_frames_passed,
        format = "FRAMES",
        lower_is_better = true
    )
}
for c in CharacterToID {
    leaderboard(
        title = format("3-Minute Melee: {0}", c),
        description = "KO as many opponents as you can!",
        start = in_3min_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && p1_stocks == 1
              && multiman_success,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_kills
    )
}
for c in CharacterToID {
    leaderboard(
        title = format("15-Minute Melee: {0}", c),
        description = "KO as many opponents as you can!",
        start = in_15min_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && p1_stocks == 1
              && multiman_success,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_kills
    )
}
for c in CharacterToID {
    leaderboard(
        title = format("Endless Melee: {0}", c),
        description = "KO as many opponents as you can!",
        start = in_endless_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && prev(p1_stocks) == 1
              && p1_stocks == 0,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_kills
    )
}
for c in CharacterToID {
    leaderboard(
        title = format("Cruel Melee: {0}", c),
        description = "KO as many opponents as you can!",
        start = in_cruel_melee
              && area_in_multiman_melee
              && multiman_melee_character_id == CharacterToID[c]
              && prev(p1_stocks) == 1
              && p1_stocks == 0,
        cancel = always_false(),
        submit = always_true(), 
        value = multiman_melee_kills
    )
}
