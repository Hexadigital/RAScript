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

versus_modes = [
    0x02, // Melee
    0x1b, // Tournament Melee
    0x0a, // [Special Melee] Camera Mode
    0x1f, // [Special Melee] Stamina Mode
    0x10, // [Special Melee] Super Sudden Death
    0x1e, // [Special Melee] Giant Melee
    0x1d, // [Special Melee] Tiny Melee
    0x11, // [Special Melee] Invisible Melee
    0x2a, // [Special Melee] Fixed-Camera Mode
    0x2c, // [Special Melee] Single-Button Mode
    0x13, // [Special Melee] Lightning Melee
    0x12, // [Special Melee] Slo-Mo Melee
]

versus_modes_without_ssd = [
    0x02, // Melee
    0x1b, // Tournament Melee
    0x0a, // [Special Melee] Camera Mode
    0x1f, // [Special Melee] Stamina Mode
    0x1e, // [Special Melee] Giant Melee
    0x1d, // [Special Melee] Tiny Melee
    0x11, // [Special Melee] Invisible Melee
    0x2a, // [Special Melee] Fixed-Camera Mode
    0x2c, // [Special Melee] Single-Button Mode
    0x13, // [Special Melee] Lightning Melee
    0x12, // [Special Melee] Slo-Mo Melee
]

in_a_good_mode = any_of(good_modes, mode_check)
in_versus_mode = any_of(versus_modes, mode_check)
in_versus_mode_without_ssd = any_of(versus_modes_without_ssd, mode_check)
in_10man_melee = mode_check(0x21)
in_100man_melee = mode_check(0x22)
in_3min_melee = mode_check(0x23)
in_15min_melee = mode_check(0x24)
in_endless_melee = mode_check(0x25)
in_cruel_melee = mode_check(0x26)

p1_character_id = byte(0x00480820)
p2_character_id = byte(0x00480844)
p3_character_id = byte(0x00480868)
p4_character_id = byte(0x0048088c)

p2_damage = word_be(0x00453f70)
p3_damage = word_be(0x00454e00)
p4_damage = word_be(0x00455c90)
p1_stocks = byte(0x0045310e)

p1_state = word_be(tbyte_be(0x00453131) + 0x72)
p2_state = word_be(tbyte_be(0x00453fc1) + 0x72)
p3_state = word_be(tbyte_be(0x00454e51) + 0x72)
p4_state = word_be(tbyte_be(0x00455ce1) + 0x72)

p1_is_player = byte(0x00480821) == 0x00
p2_is_player = byte(0x00480845) == 0x00
p3_is_player = byte(0x00480869) == 0x00
p4_is_player = byte(0x0048088d) == 0x00
p1_is_cpu = byte(0x00480821) == 0x01
p2_is_cpu = byte(0x00480845) == 0x01
p3_is_cpu = byte(0x00480869) == 0x01
p4_is_cpu = byte(0x0048088d) == 0x01
p1_is_missing = byte(0x00480821) == 0x03
p2_is_missing = byte(0x00480845) == 0x03
p3_is_missing = byte(0x00480869) == 0x03
p4_is_missing = byte(0x0048088d) == 0x03
p1_cpu_level = byte(0x0048082f)
p2_cpu_level = byte(0x00480853)
p3_cpu_level = byte(0x00480877)
p4_cpu_level = byte(0x0048089b)

p1_double_ko_bonus = prev(byte(0x0047c4ee)) == 0x00 && byte(0x0047c4ee) == 0x01
p2_double_ko_bonus = prev(byte(0x0047c9f6)) == 0x00 && byte(0x0047c9f6) == 0x01
p3_double_ko_bonus = prev(byte(0x0047cefe)) == 0x00 && byte(0x0047cefe) == 0x01
p4_double_ko_bonus = prev(byte(0x0047d406)) == 0x00 && byte(0x0047d406) == 0x01
p1_triple_ko_bonus = prev(byte(0x0047c4ef)) == 0x00 && byte(0x0047c4ef) == 0x01
p2_triple_ko_bonus = prev(byte(0x0047c9f7)) == 0x00 && byte(0x0047c9f7) == 0x01
p3_triple_ko_bonus = prev(byte(0x0047ceff)) == 0x00 && byte(0x0047ceff) == 0x01
p4_triple_ko_bonus = prev(byte(0x0047d407)) == 0x00 && byte(0x0047d407) == 0x01

p1_crowd_bonus = prev(byte(0x0047c4cf)) == 0x00 && byte(0x0047c4cf) == 0x01
p2_crowd_bonus = prev(byte(0x0047c9d7)) == 0x00 && byte(0x0047c9d7) == 0x01
p3_crowd_bonus = prev(byte(0x0047cedf)) == 0x00 && byte(0x0047cedf) == 0x01
p4_crowd_bonus = prev(byte(0x0047d3e7)) == 0x00 && byte(0x0047d3e7) == 0x01

p1_bullseye_bonus = prev(byte(0x0047c4e3)) == 0x00 && byte(0x0047c4e3) == 0x01
p2_bullseye_bonus = prev(byte(0x0047c9eb)) == 0x00 && byte(0x0047c9eb) == 0x01
p3_bullseye_bonus = prev(byte(0x0047cef3)) == 0x00 && byte(0x0047cef3) == 0x01
p4_bullseye_bonus = prev(byte(0x0047d3fb)) == 0x00 && byte(0x0047d3fb) == 0x01

p1_combo_king_bonus = prev(byte(0x0047c475)) == 0x00 && byte(0x0047c475) == 0x01
p2_combo_king_bonus = prev(byte(0x0047c97d)) == 0x00 && byte(0x0047c97d) == 0x01
p3_combo_king_bonus = prev(byte(0x0047ce85)) == 0x00 && byte(0x0047ce85) == 0x01
p4_combo_king_bonus = prev(byte(0x0047d38d)) == 0x00 && byte(0x0047d38d) == 0x01

p1_berserker_bonus = prev(byte(0x0047c487)) == 0x00 && byte(0x0047c487) == 0x01
p2_berserker_bonus = prev(byte(0x0047c98f)) == 0x00 && byte(0x0047c98f) == 0x01
p3_berserker_bonus = prev(byte(0x0047ce97)) == 0x00 && byte(0x0047ce97) == 0x01
p4_berserker_bonus = prev(byte(0x0047d39f)) == 0x00 && byte(0x0047d39f) == 0x01

// Flat Zone (Event #45) (Game and Watch Forever!)
area_in_event_45 = area_id == 0xF6
// Battlefield (Multi-Man Melee)
area_in_multiman_melee = area_id == 0x11d
playing_as_gameandwatch = character_id == CharacterToID["Mr. Game & Watch"]

items_off = byte(0x0045c370) == 0xff

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
    type = "progression",
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

//Shield Buster Break the Shield of any CPU Lv 5 or Higher
achievement(
    title = "Shield Buster",
    points = 3,
    description = "Break the Shield of any CPU Lv 5 or Higher in VS. Mode",
    trigger = in_versus_mode
              && (( // P1 player, other CPU
              p1_is_player
              && (p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && prev(p2_state) == 0xB3 // Shielding
              && p2_state == 0xCD) // Shield Break
              || (p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && prev(p3_state) == 0xB3 // Shielding
              && p3_state == 0xCD) // Shield Break
              || (p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && prev(p4_state) == 0xB3 // Shielding
              && p4_state == 0xCD) // Shield Break
              ) || ( // P2 player, other CPU
              p2_is_player
              && (p1_is_cpu
              && p1_cpu_level >= 5
              && p1_cpu_level <= 9
              && prev(p1_state) == 0xB3 // Shielding
              && p1_state == 0xCD) // Shield Break
              || (p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && prev(p3_state) == 0xB3 // Shielding
              && p3_state == 0xCD) // Shield Break
              || (p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && prev(p4_state) == 0xB3 // Shielding
              && p4_state == 0xCD) // Shield Break
              ) || ( // P3 player, other CPU
              p3_is_player
              && (p1_is_cpu
              && p1_cpu_level >= 5
              && p1_cpu_level <= 9
              && prev(p1_state) == 0xB3 // Shielding
              && p1_state == 0xCD) // Shield Break
              || (p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && prev(p2_state) == 0xB3 // Shielding
              && p2_state == 0xCD) // Shield Break
              || (p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && prev(p4_state) == 0xB3 // Shielding
              && p4_state == 0xCD) // Shield Break
              ) || ( // P4 player, other CPU
              p4_is_player
              && (p1_is_cpu
              && p1_cpu_level >= 5
              && p1_cpu_level <= 9
              && prev(p1_state) == 0xB3 // Shielding
              && p1_state == 0xCD) // Shield Break
              || (p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && prev(p2_state) == 0xB3 // Shielding
              && p2_state == 0xCD) // Shield Break
              || (p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && prev(p3_state) == 0xB3 // Shielding
              && p3_state == 0xCD) // Shield Break
              ))
)

// Twosday KO Two Lv. 5+ CPUs with One Attack in VS. Mode
achievement(
    title = "Twosday",
    points = 5,
    description = "Get a Double KO bonus against two or more Lv. 5+ CPUs in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && (( // P1 player, other CPU
                  p1_is_player
                  && p1_double_ko_bonus
                  && ((p2_is_cpu
                  && p2_cpu_level >= 5
                  && p2_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p3_is_cpu
                  && p3_cpu_level >= 5
                  && p3_cpu_level <= 9)
                  || p3_is_missing)
                  && ((p4_is_cpu
                  && p4_cpu_level >= 5
                  && p4_cpu_level <= 9)
                  || p4_is_missing)
              ) || ( // P2 player, other CPU
                  p2_is_player
                  && p2_double_ko_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p1_is_missing)
                  && ((p3_is_cpu
                  && p3_cpu_level >= 5
                  && p3_cpu_level <= 9)
                  || p3_is_missing)
                  && ((p4_is_cpu
                  && p4_cpu_level >= 5
                  && p4_cpu_level <= 9)
                  || p4_is_missing)
              ) || ( // P3 player, other CPU
                  p3_is_player
                  && p3_double_ko_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p1_is_missing)
                  && ((p2_is_cpu
                  && p2_cpu_level >= 5
                  && p2_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p4_is_cpu
                  && p4_cpu_level >= 5
                  && p4_cpu_level <= 9)
                  || p4_is_missing)
              ) || ( // P4 player, other CPU
                  p4_is_player
                  && p4_double_ko_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p1_is_missing)
                  && ((p2_is_cpu
                  && p2_cpu_level >= 5
                  && p2_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p3_is_cpu
                  && p3_cpu_level >= 5
                  && p3_cpu_level <= 9)
                  || p3_is_missing)
              ))
)

// Oh Baby a Triple! KO Three Lv. 3+ CPUs with One Attack in VS. Mode
achievement(
    title = "Oh Baby, a Triple!",
    points = 10,
    description = "Get a Triple KO bonus against three Lv. 3+ CPUs in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && (( // P1 player, other CPU
                  p1_is_player
                  && p1_triple_ko_bonus
                  && p2_is_cpu
                  && p2_cpu_level >= 3
                  && p2_cpu_level <= 9
                  && p3_is_cpu
                  && p3_cpu_level >= 3
                  && p3_cpu_level <= 9
                  && p4_is_cpu
                  && p4_cpu_level >= 3
                  && p4_cpu_level <= 9
              ) || ( // P2 player, other CPU
                  p2_is_player
                  && p2_triple_ko_bonus
                  && p1_is_cpu
                  && p1_cpu_level >= 3
                  && p1_cpu_level <= 9
                  && p3_is_cpu
                  && p3_cpu_level >= 3
                  && p3_cpu_level <= 9
                  && p4_is_cpu
                  && p4_cpu_level >= 3
                  && p4_cpu_level <= 9
              ) || ( // P3 player, other CPU
                  p3_is_player
                  && p3_triple_ko_bonus
                  && p1_is_cpu
                  && p1_cpu_level >= 3
                  && p1_cpu_level <= 9
                  && p2_is_cpu
                  && p2_cpu_level >= 3
                  && p2_cpu_level <= 9
                  && p4_is_cpu
                  && p4_cpu_level >= 3
                  && p4_cpu_level <= 9
              ) || ( // P4 player, other CPU
                  p4_is_player
                  && p4_triple_ko_bonus
                  && p1_is_cpu
                  && p1_cpu_level >= 3
                  && p1_cpu_level <= 9
                  && p2_is_cpu
                  && p2_cpu_level >= 3
                  && p2_cpu_level <= 9
                  && p3_is_cpu
                  && p3_cpu_level >= 3
                  && p3_cpu_level <= 9
              ))
)

achievement(
    title = "They Love Me",
    points = 1,
    description = "Get a Crowd Favourite bonus by getting the crowd to chant your name in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && ((
                  p1_is_player
                  && p1_crowd_bonus
              ) || (
                  p2_is_player
                  && p2_crowd_bonus
              ) || (
                  p3_is_player
                  && p3_crowd_bonus
              ) || (
                  p4_is_player
                  && p4_crowd_bonus
              ))
)

achievement(
    title = "Bullseye!",
    points = 2,
    description = "As Mewtwo or Samus, get the Bull's-eye KO Bonus with items turned off in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && items_off
              && ((
                  p1_is_player
                  && (p1_character_id == CharacterToID["Samus"]
                      || p1_character_id == CharacterToID["Mewtwo"])
                  && p1_bullseye_bonus
              ) || (
                  p2_is_player
                  && (p2_character_id == CharacterToID["Samus"]
                      || p2_character_id == CharacterToID["Mewtwo"])
                  && p2_bullseye_bonus
              ) || (
                  p3_is_player
                  && (p3_character_id == CharacterToID["Samus"]
                      || p3_character_id == CharacterToID["Mewtwo"])
                  && p3_bullseye_bonus
              ) || (
                  p4_is_player
                  && (p4_character_id == CharacterToID["Samus"]
                      || p4_character_id == CharacterToID["Mewtwo"])
                  && p4_bullseye_bonus
              ))
)

achievement(
    title = "Hungrybox Tribute",
    points = 10,
    description = "As Jigglypuff, get the Combo King bonus in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && items_off
              && ((
                  p1_is_player
                  && p1_character_id == CharacterToID["Jigglypuff"]
                  && p1_combo_king_bonus
              ) || (
                  p2_is_player
                  && p2_character_id == CharacterToID["Jigglypuff"]
                  && p2_combo_king_bonus
              ) || (
                  p3_is_player
                  && p3_character_id == CharacterToID["Jigglypuff"]
                  && p3_combo_king_bonus
              ) || (
                  p4_is_player
                  && p4_character_id == CharacterToID["Jigglypuff"]
                  && p4_combo_king_bonus
              ))
)

achievement(
    title = "Flexing the Triforce of Power",
    points = 10,
    description = "As Ganondorf, get the Berserker bonus in any VS. Mode except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && ((
                  p1_is_player
                  && p1_character_id == CharacterToID["Ganondorf"]
                  && p1_berserker_bonus
              ) || (
                  p2_is_player
                  && p2_character_id == CharacterToID["Ganondorf"]
                  && p2_berserker_bonus
              ) || (
                  p3_is_player
                  && p3_character_id == CharacterToID["Ganondorf"]
                  && p3_berserker_bonus
              ) || (
                  p4_is_player
                  && p4_character_id == CharacterToID["Ganondorf"]
                  && p4_berserker_bonus
              ))
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
