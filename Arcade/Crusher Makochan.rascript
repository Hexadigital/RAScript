// Crusher Makochan
// #ID = 14867

specials = {
    "Monosashi Blade": 0x02,
    "Randsel Attack": 0x03,
    "Crash Piston Makochan Punch": 0x04
}

coin_reward_setting = byte(0x000006)
percentage_setting = byte(0x000007)
difficulty_setting = byte(0x000009)
autoplay_setting = byte(0x00000a)
continues_setting = byte(0x00000b)
rng_status = word(0x000368)

default_settings = coin_reward_setting == 0x0b
                && percentage_setting == 0x04
                && difficulty_setting == 0x01
                //&& autoplay_setting == 0x00
                && continues_setting == 0x01


level = word(0x00036e) + 1
object_damage = word(0x000412)
object_broken = prev(object_damage) == 0x0b && object_damage == 0x0c

medals = word(0x000400)
function medals_multiplied(multiplier) {
    return medals != 0 && medals == prev(medals) * multiplier
}

// Clear the first stage!
// Stage 1, medals = 2x, 3x, or 4x old value
achievement(
    type = "progression",
    title = "Blockage Breaker",
    points = 2,
    description = "Clear the first stage with default settings!",
    trigger = default_settings
              && prev(level) == 1
              && any_of([2, 3, 4], medals_multiplied)
)

// Clear the second stage!
// Stage 2, medals = 2x or 3x old value
achievement(
    type = "progression",
    title = "Wall Wrecker",
    points = 5,
    description = "Clear the second stage with default settings!",
    trigger = default_settings
              && level == 2
              && any_of([2, 3, 4], medals_multiplied)
)

// Clear the third stage and save the world!
// Stage 3, medals goes up by 50
achievement(
    type = "win_condition",
    title = "Comet Crusher",
    points = 10,
    description = "Clear the third stage and save the world with default settings!",
    trigger = default_settings
              && level == 3
              && medals == prev(medals) + 50
)

// Pull off the Last Chance Desperation Move: Monosashi Blade!
achievement(
    title = "Measured to Cut",
    points = 1,
    description = "Pull off the Last Chance Desperation Move: Monosashi Blade with default settings!",
    trigger = default_settings
              && rng_status == specials["Monosashi Blade"]
              && (any_of([2, 3, 4], medals_multiplied)
              || medals == prev(medals) + 50)
)

// Pull off the Last Chance Desperation Move: Randsel Attack!
achievement(
    title = "Rocket Riot",
    points = 1,
    description = "Pull off the Last Chance Desperation Move: Randsel Attack with default settings!",
    trigger = default_settings
              && rng_status == specials["Randsel Attack"]
              && (any_of([2, 3, 4], medals_multiplied)
              || medals == prev(medals) + 50)
)

// Pull off the Last Chance Desperation Move: Crash Piston Makochan Punch!
achievement(
    title = "Fists of Fury",
    points = 1,
    description = "Pull off the Last Chance Desperation Move: Crash Piston Makochan Punch with default settings!",
    trigger = default_settings
              && rng_status == specials["Crash Piston Makochan Punch"]
              && (any_of([2, 3, 4], medals_multiplied)
              || medals == prev(medals) + 50)
)

// Cash out 51 or more medals at the end of the game!
// Stage 3, medals goes up by 50 and was previously 1 or more
achievement(
    type = "missable",
    title = "Merciless Mako-chan",
    points = 25,
    description = "Cash out 51 or more medals at the end of the game!",
    trigger = default_settings
              && level == 3
              && medals == prev(medals) + 50
              && medals >= 51
)

leaderboard(
    title = "Maximum Medals",
    description = "",
    start = default_settings
         && level == 3
         && medals == prev(medals) + 50,
    cancel = always_false(),
    submit = always_true(), 
    value = medals
)

rich_presence_conditional_display(
    !default_settings,
    "Altered settings, achievements disabled!"
)

rich_presence_conditional_display(
    level == 1 && medals == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    medals == 1,
    "Round {0} • {1} Medal",
    rich_presence_value("Round", level),
    rich_presence_value("Medals", medals)
)

rich_presence_display(
    "Round {0} • {1} Medals",
    rich_presence_value("Round", level),
    rich_presence_value("Medals", medals)
)
