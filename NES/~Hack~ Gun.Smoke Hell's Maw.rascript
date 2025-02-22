// ~Hack~ Gun.Smoke: Hell's Maw
// #ID = 32823

StageLookup = {
    1: "Bandit Bill",
    2: "Cutter",
    3: "Devil Hawk"
}

player_bullet_state = byte(0x000b)
end_of_stage = player_bullet_state == 0xf0

stage = byte(0x0041) + 1
last_played_sound_effect = byte(0x004d)
poster_bullet_fired = last_played_sound_effect == 0x21

lives = byte(0x007a)
on_horse = byte(0x0401) == 0x80
game_state = byte(0x26)
loading = game_state == 0x03
in_game = game_state == 0x7D
out_of_game = game_state == 0xA0

game_over = prev(lives) == 1 && lives == 0

shotgun_bought = byte(0x0090) == 0xD0
machine_gun_bought = byte(0x0094) == 0xD0
magnum_bought = byte(0x0098) == 0xD0
smart_bomb_bought = byte(0x009c) == 0xD0

function stage_ended(num) {
    return stage == num && end_of_stage && !prev(poster_bullet_fired) && poster_bullet_fired
}

// Defeat Bandit Bill's crew, 5p
achievement(
    title = "Banning Banditry",
    type = "progression",
    points = 5,
    description = "Defeat Bandit Bill's crew",
    trigger = stage_ended(1)
)

// Defeat Cutter's force, 10p
achievement(
    title = "Cleaning Up Cutter",
    type = "progression",
    points = 10,
    description = "Defeat Cutter's group",
    trigger = stage_ended(2)
)

// Defeat Devil Hawk's army, 25p
achievement(
    title = "Dealing with the Devil",
    type = "win_condition",
    points = 25,
    description = "Defeat Devil Hawk's army",
    trigger = stage_ended(3)
)

// Clear any stage while riding on a horse, 5p
achievement(
    title = "A Friend, Not a Shield",
    points = 5,
    description = "Clear any stage while riding on a horse",
    trigger = stage <= 3 && end_of_stage && on_horse && !prev(poster_bullet_fired) && poster_bullet_fired
)

// Clear all three stages without getting a game over, 10p
achievement(
    title = "Fatal Wounds Can't Keep Me Down",
    points = 10,
    description = "Clear all three stages without dying more than once",
    trigger = once(prev(loading) && in_game) && trigger_when(stage_ended(3)) && never(repeated(2, in_game && lives < prev(lives)))
    && never(out_of_game)
)

// Clear all three stages without buying any subweapons, 10p
achievement(
    title = "Standard is Good Enough",
    points = 10,
    description = "Clear all three stages without buying any weapons or bombs",
    trigger = once(prev(loading) && in_game) && trigger_when(stage_ended(3)) && never(shotgun_bought) && never(machine_gun_bought)
    && never(magnum_bought) && never(smart_bomb_bought) && never(out_of_game)
)

rich_presence_conditional_display(
    in_game,
    "Hunting down {0} • Lives: {1}",
    rich_presence_lookup("Stage", stage, StageLookup),
    rich_presence_value("Number", lives)
)

rich_presence_display(
    "Preparing to march into a storm of bullets"
)
