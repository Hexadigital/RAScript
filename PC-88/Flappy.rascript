// Flappy
// #ID = 33474

cheevo_names = {
    5: "Warming Up",
    10: "Now Do Ten More",
    15: "You've Got This",
    20: "You're Getting the Hang of This",
    25: "Is It a Mole or a Bird?",
    30: "Canonically It's a Mole",
    35: "Well, a Mole-like Alien",
    40: "Matching Blues",
    45: "Brick by Brick",
    50: "Fifty is Only a Quarter Way There",
    55: "Stacking Ladders",
    60: "Bouncing Bridges",
    65: "Crab Crusher",
    70: "Shellfish Dinner",
    75: "Pinch and Push",
    80: "Pincer Maneuver",
    85: "Snap Decision",
    90: "Clawful Logic",
    95: "Crustacean Crunch",
    100: "Half Dug",
    105: "Molar Power",
    110: "Tunnel Vision",
    115: "Breaking Ground",
    120: "Pushing Boundaries",
    125: "Burrowing for Balls",
    130: "Truffle Takedown",
    135: "Unicorn Unity",
    140: "Have You Ever Seen a Green Unicorn?",
    145: "Solving Brick Mazes",
    150: "Sliding Savior",
    155: "Mushroom Power",
    160: "Horn Harvester",
    165: "All Falls Before the Balls",
    170: "Cancellation Claws",
    175: "Twenty-Five to Go",
    180: "Fantastic Flappy",
    185: "Sleepy Shrooms",
    190: "Interstellar Champion",
    195: "Just a Few More",
    200: "FIN",
}

stage = byte(0x00b521)
time = word(0x00b524)
lives = byte(0x00b52e)

loading = stage == 0 || stage > 200 || lives >= 100
title_screen = stage == 1 && lives == 0
in_game = stage <= 200 && lives > 0 && lives < 100

function get_type(end_stage) {
    if end_stage == 200 {
        return "win_condition"
    }
    return "progression"
}

function get_points(end_stage) {
    if end_stage == 200 {
        return 25
    } else if end_stage > 100 {
        return 10
    } else if end_stage >= 20 {
        return 5
    } else if end_stage == 15 {
        return 4
    } else if end_stage == 10 {
        return 3
    } else if end_stage == 5 {
        return 2
    }
}

function stage_clear(num) {
    if num == 200 {
        return once(lives > 0 && prev(stage) == num && stage == 1)
    }
    return once(lives > 0 && prev(stage) == num && stage == num + 1)
}

achievement(
        type = get_type(1),
        title = "Thanks for Picking the PC-88!",
        points = 1,
        description = "Clear stage 1",
        trigger = stage_clear(1)
    )

for i in range(0, 39) {
    start_stage = (i * 5) + 1
    if start_stage == 1 {
        start_stage = 2
    }
    end_stage = (i * 5) + 5
    stage_list = range(start_stage, end_stage)
    achievement(
        type = get_type(end_stage),
        title = cheevo_names[end_stage],
        points = get_points(end_stage),
        description = format("Clear stages {0} through {1} in one session", start_stage, end_stage),
        trigger = all_of(stage_list, stage_clear)
    )
}

rich_presence_conditional_display(
    loading,
    "Now loading..."
)

rich_presence_conditional_display(
    title_screen,
    "At the title screen"
)

life_lookup = {
    1: "fe"
}

rich_presence_display(
    "Stage {0} • {1} Li{3} • {2} Time Remaining",
    rich_presence_value("Number", stage),
    rich_presence_value("Number", lives),
    rich_presence_value("Number", time),
    rich_presence_lookup("LifeText", lives, life_lookup, fallback="ves")
)
