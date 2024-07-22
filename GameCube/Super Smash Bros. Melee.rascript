// Super Smash Bros. Melee
// #ID = 9602

///////////////////////////////////////////////////////////////////
// As a warning, this file kinda grew in a disordered manner     //
// due to a mix of deadlines and increasing scope. I originally  //
// intended to do only two G&W achievements, but took on random  //
// additional achievements as time went on, and the structure of //
// this code reflects that...                                    //
///////////////////////////////////////////////////////////////////

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
master_hand_in_multiman = byte(0x004735a3) == 0x1a
time_mode = byte(0x0045bf12) == 0x00
stock_mode = byte(0x0045bf12) == 0x01
coin_mode = byte(0x0045bf12) == 0x02
bonus_mode = byte(0x0045bf12) == 0x03
four_stocks = stock_mode && byte(0x0045bf14) == 0x04

screen_id = byte(0x00479d33)
versus_clear = prev(screen_id) == 0x02 && screen_id == 0x04
not_no_contest = byte(0x0047c02c) != 0x07
sp_score = dword_be(0x00472e24)
sp_clear = sp_score > prev(sp_score)

p1_character_id = byte(0x00480820)
p2_character_id = byte(0x00480844)
p3_character_id = byte(0x00480868)
p4_character_id = byte(0x0048088c)

p1_stamina = byte(0x0046b94d)
p2_damage = word_be(0x00453f70)
p2_stamina = byte(0x0046b9f5)
p3_damage = word_be(0x00454e00)
p4_damage = word_be(0x00455c90)
p1_stocks = byte(0x0045310e)
p2_stocks = byte(0x00453f9e)

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

p1_rank = byte(0x0047c085)
p1_won_versus = p1_rank == 0x00
p2_rank = byte(0x0047c12d)
p2_won_versus = p2_rank == 0x00
p2_lost_versus = p2_rank >= 0x01 && p2_rank <= 0x04
p3_rank = byte(0x0047c1d5)
p3_won_versus = p3_rank== 0x00
p3_lost_versus = p3_rank >= 0x01 && p3_rank <= 0x04
p4_rank = byte(0x0047c27d)
p4_won_versus = p4_rank == 0x00
p4_lost_versus = p4_rank >= 0x01 && p4_rank <= 0x04

sp_meteor_bonus = dword(0x00453a5c) != 0

p1_double_ko_bonus = byte(0x0047c4ee) == 0x01
p2_double_ko_bonus = byte(0x0047c9f6) == 0x01
p3_double_ko_bonus = byte(0x0047cefe) == 0x01
p4_double_ko_bonus = byte(0x0047d406) == 0x01
p1_triple_ko_bonus = byte(0x0047c4ef) == 0x01
p2_triple_ko_bonus = byte(0x0047c9f7) == 0x01
p3_triple_ko_bonus = byte(0x0047ceff) == 0x01
p4_triple_ko_bonus = byte(0x0047d407) == 0x01

p1_crowd_bonus = byte(0x0047c4cf) == 0x01
p2_crowd_bonus = byte(0x0047c9d7) == 0x01
p3_crowd_bonus = byte(0x0047cedf) == 0x01
p4_crowd_bonus = byte(0x0047d3e7) == 0x01

p1_bullseye_bonus = byte(0x0047c4e3) == 0x01
p2_bullseye_bonus = byte(0x0047c9eb) == 0x01
p3_bullseye_bonus = byte(0x0047cef3) == 0x01
p4_bullseye_bonus = byte(0x0047d3fb) == 0x01

p1_combo_king_bonus = byte(0x0047c475) == 0x01
p2_combo_king_bonus = byte(0x0047c97d) == 0x01
p3_combo_king_bonus = byte(0x0047ce85) == 0x01
p4_combo_king_bonus = byte(0x0047d38d) == 0x01

p1_berserker_bonus = byte(0x0047c487) == 0x01
p2_berserker_bonus = byte(0x0047c98f) == 0x01
p3_berserker_bonus = byte(0x0047ce97) == 0x01
p4_berserker_bonus = byte(0x0047d39f) == 0x01

p1_poser_ko_bonus = byte(0x0047c4e4) == 0x01
p2_poser_ko_bonus = byte(0x0047c9ec) == 0x01
p3_poser_ko_bonus = byte(0x0047cef4) == 0x01
p4_poser_ko_bonus = byte(0x0047d3fc) == 0x01

p1_bird_bonus = byte(0x0047c474) == 0x01
p2_bird_bonus = byte(0x0047c97c) == 0x01
p3_bird_bonus = byte(0x0047ce84) == 0x01
p4_bird_bonus = byte(0x0047d38c) == 0x01

p1_meteor_smash_bonus = byte(0x0047c47a) == 0x01
p2_meteor_smash_bonus = byte(0x0047c47a + (0x508)) == 0x01
p3_meteor_smash_bonus = byte(0x0047c47a + (0x508 * 2)) == 0x01
p4_meteor_smash_bonus = byte(0x0047c47a + (0x508 * 3)) == 0x01

p1_meteor_clear_bonus = byte(0x0047c47b) == 0x01
p2_meteor_clear_bonus = byte(0x0047c47b + (0x508)) == 0x01
p3_meteor_clear_bonus = byte(0x0047c47b + (0x508 * 2)) == 0x01
p4_meteor_clear_bonus = byte(0x0047c47b + (0x508 * 3)) == 0x01

p1_compass_bonus = byte(0x0047c49c) == 0x01
p2_compass_bonus = byte(0x0047c49c + (0x508)) == 0x01
p3_compass_bonus = byte(0x0047c49c + (0x508 * 2)) == 0x01
p4_compass_bonus = byte(0x0047c49c + (0x508 * 3)) == 0x01

p1_shield_buster_bonus = byte(0x0047c4b2) == 0x01
p2_shield_buster_bonus = byte(0x0047c4b2 + (0x508)) == 0x01
p3_shield_buster_bonus = byte(0x0047c4b2 + (0x508 * 2)) == 0x01
p4_shield_buster_bonus = byte(0x0047c4b2 + (0x508 * 3)) == 0x01

// Flat Zone (Event #45) (Game and Watch Forever!)
area_in_event_45 = area_id == 0xF6
// Battlefield (Multi-Man Melee)
area_in_multiman_melee = area_id == 0x11d
playing_as_gameandwatch = byte(0x470778) == CharacterToID["Mr. Game & Watch"]

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
    description = "As P1, land a 9 on any playable character CPU in any single-player mode using Mr. Game & Watch's Judgement",
    trigger = in_a_good_mode
              && playing_as_gameandwatch
              && hammer_out
              && judgement_number == 9
              && (damage_taken("p2", 5) || damage_taken("p3", 5) || damage_taken("p4", 5))
)

//Centurion Get 100+ KOs in Endless Melee 
achievement(
    title = "Centurion",
    points = 10,
    description = "Get 100 KOs or more in Endless Melee",
    trigger = in_endless_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && prev(multiman_melee_kills) >= 95
              && prev(multiman_melee_kills) < 100
              && multiman_melee_kills >= 100
              && multiman_melee_kills < 105
              && !master_hand_in_multiman
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
              && !master_hand_in_multiman
)

//Wired to Survive Complete 15-Minute Melee, unlocking the Kongo Jungle stage
achievement(
    title = "Wired to Survive",
    points = 10,
    description = "Complete 15-Minute Melee",
    trigger = in_15min_melee
              && area_in_multiman_melee
              && p1_stocks == 1
              && multiman_success
              && !master_hand_in_multiman
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
              && !master_hand_in_multiman
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
              && !master_hand_in_multiman
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
              && !master_hand_in_multiman
)

//Shield Buster Break the Shield of any CPU Lv 5 or Higher
achievement(
    title = "Shield Buster",
    points = 3,
    description = "Earn the \"Shield Buster\" bonus by breaking the shield of a Level 5 CPU or higher in any VS. mode match",
    trigger = in_versus_mode
              && versus_clear
              && (( // P1 player, other CPU
                  p1_is_player
                  && p1_shield_buster_bonus
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
                  && p2_shield_buster_bonus
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
                  && p3_shield_buster_bonus
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
                  && p4_shield_buster_bonus
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

// Twosday KO Two Lv. 5+ CPUs with One Attack in VS. Mode
achievement(
    title = "Twosday",
    points = 5,
    description = "Earn the \"Double KO\" bonus by defeating two or more Level 5 CPUs or higher with a single attack in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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
    description = "Earn the \"Triple KO\" bonus by defeating three Level 3 CPUs or higher with a single attack in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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
    description = "Earn the \"Crowd Favorite\" bonus by getting the crowd to chant your name in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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
    description = "Earn the \"Bull's-eye KO\" bonus as Mewtwo or Samus with items turned off in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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
    description = "Earn the \"Combo King\" bonus by keeping up a good combo as Jigglypuff in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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
    description = "Earn the \"Berserker\" bonus by using 60 attacks within a minute as Ganondorf in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
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

achievement(
    title = "The Little Kicks",
    points = 1,
    description = "Earn the \"Poser KO\" bonus by defeating an opponent with a taunt as Luigi in any VS. mode match",
    trigger = in_versus_mode
              && versus_clear
              && ((
                  p1_is_player
                  && p1_character_id == CharacterToID["Luigi"]
                  && p1_poser_ko_bonus
              ) || (
                  p2_is_player
                  && p2_character_id == CharacterToID["Luigi"]
                  && p2_poser_ko_bonus
              ) || (
                  p3_is_player
                  && p3_character_id == CharacterToID["Luigi"]
                  && p3_poser_ko_bonus
              ) || (
                  p4_is_player
                  && p4_character_id == CharacterToID["Luigi"]
                  && p4_poser_ko_bonus
              ))
)

achievement(
    title = "You Swim in the Air Now Too?",
    points = 5,
    description = "Earn the \"Bird of Prey\" bonus by using only aerial attacks as Falco in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
              && ((
                  p1_is_player
                  && p1_won_versus
                  && p1_character_id == CharacterToID["Falco"]
                  && p1_bird_bonus
              ) || (
                  p2_is_player
                  && p2_won_versus
                  && p2_character_id == CharacterToID["Falco"]
                  && p2_bird_bonus
              ) || (
                  p3_is_player
                  && p3_won_versus
                  && p3_character_id == CharacterToID["Falco"]
                  && p3_bird_bonus
              ) || (
                  p4_is_player
                  && p4_won_versus
                  && p4_character_id == CharacterToID["Falco"]
                  && p4_bird_bonus
              ))
)

achievement(
    title = "Meteor Shower",
    points = 2,
    description = "Earn the \"Meteor Smash\" bonus by defeating any opponent using a meteor smash in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
              && ((
                  p1_is_player
                  && p1_meteor_smash_bonus
              ) || (
                  p2_is_player
                  && p2_meteor_smash_bonus
              ) || (
                  p3_is_player
                  && p3_meteor_smash_bonus
              ) || (
                  p4_is_player
                  && p4_meteor_smash_bonus
              ))
)

achievement(
    title = "Get Out of My Stage!",
    points = 3,
    description = "Earn the \"Meteor Clear\" bonus by ending with a meteor smash in Classic, Adventure, or All-Star Mode",
    trigger = (mode_id == 0x03 || mode_id == 0x04 || mode_id == 0x05)
              && sp_clear
              && sp_meteor_bonus
)

achievement(
    title = "Ragdoll",
    points = 3,
    description = "Earn the \"Compass Tosser\" bonus by using all four throws and winning against a Level 5 CPU or higher in any VS. mode match except Super Sudden Death",
    trigger = in_versus_mode_without_ssd
              && versus_clear
              && ((
                  p1_is_player
                  && p1_won_versus
                  && p1_compass_bonus
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
              ) || (
                  p2_is_player
                  && p2_won_versus
                  && p2_compass_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p3_is_cpu
                  && p3_cpu_level >= 5
                  && p3_cpu_level <= 9)
                  || p3_is_missing)
                  && ((p4_is_cpu
                  && p4_cpu_level >= 5
                  && p4_cpu_level <= 9)
                  || p4_is_missing)
              ) || (
                  p3_is_player
                  && p3_won_versus
                  && p3_compass_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p2_is_cpu
                  && p2_cpu_level >= 5
                  && p2_cpu_level <= 9)
                  || p2_is_missing)
                  && ((p4_is_cpu
                  && p4_cpu_level >= 5
                  && p4_cpu_level <= 9)
                  || p4_is_missing)
              ) || (
                  p4_is_player
                  && p4_won_versus
                  && p4_compass_bonus
                  && ((p1_is_cpu
                  && p1_cpu_level >= 5
                  && p1_cpu_level <= 9)
                  || p2_is_missing)
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

achievement(
    title = "Mewtwo Strikes Back",
    points = 3,
    description = "As P1, win a Stamina Mode match against a Level 5 or higher Pikachu or Mewtwo in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x1f // [Special Melee] Stamina Mode
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Pikachu"]
              && p2_character_id == CharacterToID["Mewtwo"])
              || (p1_character_id == CharacterToID["Mewtwo"]
              && p2_character_id == CharacterToID["Pikachu"]))
              && once(p1_stamina == 150 && p2_stamina == 150)
              && prev(p2_stamina) > 0
              && p2_stamina == 0
              && never(mode_id != 0x1f)
)

achievement(
    title = "First Blood",
    points = 3,
    description = "As P1, win a 4-stock Super Sudden Death match against a Level 5 or higher Marth or Roy in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x10 // [Special Melee] Super Sudden Death
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Marth"]
              && p2_character_id == CharacterToID["Roy"])
              || (p1_character_id == CharacterToID["Roy"]
              && p2_character_id == CharacterToID["Marth"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Cream Puff Throwdown",
    points = 3,
    description = "As P1, win a 4-stock Giant Melee match against a Level 5 or higher Kirby or Jigglypuff in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x1e // [Special Melee] Giant Melee
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Kirby"]
              && p2_character_id == CharacterToID["Jigglypuff"])
              || (p1_character_id == CharacterToID["Jigglypuff"]
              && p2_character_id == CharacterToID["Kirby"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Kaiju at Scale",
    points = 3,
    description = "As P1, win a 4-stock Tiny Melee match against a Level 5 or higher Bowser or Donkey Kong in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x1d // [Special Melee] Tiny Melee
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Bowser"]
              && p2_character_id == CharacterToID["Donkey Kong"])
              || (p1_character_id == CharacterToID["Donkey Kong"]
              && p2_character_id == CharacterToID["Bowser"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Will-o'-the-wisp",
    points = 3,
    description = "As P1, win a 4-stock Invisible Melee match against a Level 5 or higher Captain Falcon or Ganondorf in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x11 // [Special Melee] Invisible Melee
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Captain Falcon"]
              && p2_character_id == CharacterToID["Ganondorf"])
              || (p1_character_id == CharacterToID["Ganondorf"]
              && p2_character_id == CharacterToID["Captain Falcon"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Shader Pack",
    points = 3,
    description = "As P1, win a 4-stock Fixed-Camera Mode match with both characters set to Mr. Game & Watch, against a level 5 or higher CPU on the Flat Zone stage",
    trigger = mode_id == 0x2a // [Special Melee] Fixed-Camera Mode
              && area_id == 0x1b
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && p1_character_id == CharacterToID["Mr. Game & Watch"]
              && p2_character_id == CharacterToID["Mr. Game & Watch"]
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "It's Dangerous to Go Alone",
    points = 3,
    description = "As P1, win a 4-stock Single-Button Mode match against a Level 5 or higher Link or Young Link in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x2c // [Special Melee] Single-Button Mode
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Link"]
              && p2_character_id == CharacterToID["Young Link"])
              || (p1_character_id == CharacterToID["Young Link"]
              && p2_character_id == CharacterToID["Link"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Shooting Stars",
    points = 3,
    description = "As P1, win a 4-stock Lightning Melee match against a Level 5 or higher Fox or Falco in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x13 // [Special Melee] Lightning Melee
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Fox"]
              && p2_character_id == CharacterToID["Falco"])
              || (p1_character_id == CharacterToID["Falco"]
              && p2_character_id == CharacterToID["Fox"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Kaizo Training",
    points = 3,
    description = "As P1, win a 4-stock Slo-Mo Melee match against a Level 5 or higher Mario or Luigi in P2's slot, fighting against the character you did not play as",
    trigger = mode_id == 0x12 // [Special Melee] Slo-Mo Melee
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_missing
              && p4_is_missing
              && ((p1_character_id == CharacterToID["Mario"]
              && p2_character_id == CharacterToID["Luigi"])
              || (p1_character_id == CharacterToID["Luigi"]
              && p2_character_id == CharacterToID["Mario"]))
              && four_stocks
              && p1_stocks >= 1
              && prev(p2_stocks) == 1
              && p2_stocks == 0
)

achievement(
    title = "Time is Running Short",
    points = 5,
    description = "As P1, win a free-for-all timed battle in regular Melee mode against three Level 5 or higher CPUs, using Ness, Kirby, Ice Climbers, and Pichu (Time set to 4 minutes)",
    trigger = mode_id == 0x02 // Melee
              && time_mode
              && byte(0x0045bf13) == 4 // Time set to 4:00
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && (p1_character_id == CharacterToID["Ness"]
                 || p1_character_id == CharacterToID["Kirby"]
                 || p1_character_id == CharacterToID["Ice Climbers"]
                 || p1_character_id == CharacterToID["Pichu"]
                 )
              && (p2_character_id == CharacterToID["Ness"]
                 || p2_character_id == CharacterToID["Kirby"]
                 || p2_character_id == CharacterToID["Ice Climbers"]
                 || p2_character_id == CharacterToID["Pichu"]
                 )
              && (p3_character_id == CharacterToID["Ness"]
                 || p3_character_id == CharacterToID["Kirby"]
                 || p3_character_id == CharacterToID["Ice Climbers"]
                 || p3_character_id == CharacterToID["Pichu"]
                 )
              && (p4_character_id == CharacterToID["Ness"]
                 || p4_character_id == CharacterToID["Kirby"]
                 || p4_character_id == CharacterToID["Ice Climbers"]
                 || p4_character_id == CharacterToID["Pichu"]
                 )
              && p1_character_id != p2_character_id
              && p1_character_id != p3_character_id
              && p1_character_id != p4_character_id
              && p2_character_id != p3_character_id
              && p2_character_id != p4_character_id
              && p3_character_id != p4_character_id
              && p1_won_versus
              && p2_lost_versus
              && p3_lost_versus
              && p4_lost_versus
              && not_no_contest
              && versus_clear
)

achievement(
    title = "Fighting in Style",
    points = 5,
    description = "As P1, win a free-for-all bonus battle in regular Melee mode against three Level 5 or higher CPUs, using Captain Falcon, Samus, Zelda, and Dr. Mario (Time set to 4 minutes)",
    trigger = mode_id == 0x02 // Melee
              && bonus_mode
              && byte(0x0045bf13) == 4 // Time set to 4:00
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && (p1_character_id == CharacterToID["Captain Falcon"]
                 || p1_character_id == CharacterToID["Samus"]
                 || p1_character_id == CharacterToID["Zelda"]
                 || p1_character_id == CharacterToID["Sheik"]
                 || p1_character_id == CharacterToID["Dr. Mario"]
                 )
              && (p2_character_id == CharacterToID["Captain Falcon"]
                 || p2_character_id == CharacterToID["Samus"]
                 || p2_character_id == CharacterToID["Zelda"]
                 || p2_character_id == CharacterToID["Sheik"]
                 || p2_character_id == CharacterToID["Dr. Mario"]
                 )
              && (p3_character_id == CharacterToID["Captain Falcon"]
                 || p3_character_id == CharacterToID["Samus"]
                 || p3_character_id == CharacterToID["Zelda"]
                 || p3_character_id == CharacterToID["Sheik"]
                 || p3_character_id == CharacterToID["Dr. Mario"]
                 )
              && (p4_character_id == CharacterToID["Captain Falcon"]
                 || p4_character_id == CharacterToID["Samus"]
                 || p4_character_id == CharacterToID["Zelda"]
                 || p4_character_id == CharacterToID["Sheik"]
                 || p4_character_id == CharacterToID["Dr. Mario"]
                 )
              && p1_character_id != p2_character_id
              && p1_character_id != p3_character_id
              && p1_character_id != p4_character_id
              && p2_character_id != p3_character_id
              && p2_character_id != p4_character_id
              && p3_character_id != p4_character_id
              && p1_won_versus
              && p2_lost_versus
              && p3_lost_versus
              && p4_lost_versus
              && not_no_contest
              && versus_clear
)

achievement(
    title = "WELCOME TO WARIO WORLD",
    points = 5,
    description = "As P1, win a free-for-all coin battle in regular Melee mode against three Level 5 or higher CPUs, using only characters from the Mario franchise (Time set to 4 minutes)",
    trigger = mode_id == 0x02 // Melee
              && coin_mode
              && byte(0x0045bf13) == 4 // Time set to 4:00
              && p1_is_player
              && p2_is_cpu
              && p2_cpu_level >= 5
              && p2_cpu_level <= 9
              && p3_is_cpu
              && p3_cpu_level >= 5
              && p3_cpu_level <= 9
              && p4_is_cpu
              && p4_cpu_level >= 5
              && p4_cpu_level <= 9
              && (p1_character_id == CharacterToID["Dr. Mario"]
                 || p1_character_id == CharacterToID["Mario"]
                 || p1_character_id == CharacterToID["Luigi"]
                 || p1_character_id == CharacterToID["Bowser"]
                 || p1_character_id == CharacterToID["Peach"]
                 || p1_character_id == CharacterToID["Yoshi"]
                 )
              && (p2_character_id == CharacterToID["Dr. Mario"]
                 || p2_character_id == CharacterToID["Mario"]
                 || p2_character_id == CharacterToID["Luigi"]
                 || p2_character_id == CharacterToID["Bowser"]
                 || p2_character_id == CharacterToID["Peach"]
                 || p2_character_id == CharacterToID["Yoshi"]
                 )
              && (p3_character_id == CharacterToID["Dr. Mario"]
                 || p3_character_id == CharacterToID["Mario"]
                 || p3_character_id == CharacterToID["Luigi"]
                 || p3_character_id == CharacterToID["Bowser"]
                 || p3_character_id == CharacterToID["Peach"]
                 || p3_character_id == CharacterToID["Yoshi"]
                 )
              && (p4_character_id == CharacterToID["Dr. Mario"]
                 || p4_character_id == CharacterToID["Mario"]
                 || p4_character_id == CharacterToID["Luigi"]
                 || p4_character_id == CharacterToID["Bowser"]
                 || p4_character_id == CharacterToID["Peach"]
                 || p4_character_id == CharacterToID["Yoshi"]
                 )
              && p1_won_versus
              && p2_lost_versus
              && p3_lost_versus
              && p4_lost_versus
              && not_no_contest
              && versus_clear
)

for c in CharacterToID {
    if c != "Sheik" {
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
}
for c in CharacterToID {
    if c != "Sheik" {
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
}
for c in CharacterToID {
    if c != "Sheik" {
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
}
for c in CharacterToID {
    if c != "Sheik" {
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
}
for c in CharacterToID {
    if c != "Sheik" {
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
}
for c in CharacterToID {
    if c != "Sheik" {
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
}

