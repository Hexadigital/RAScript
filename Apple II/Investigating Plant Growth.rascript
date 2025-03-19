// Investigating Plant Growth
// #ID = 31972

DifficultyRPLookup = {
    0: "a Trainee",
    1: "an Assistant",
    2: "a Leader"
}

VegDescs = {
    "Bean":        "beans",
    "Beet":        "beets",
    "Cabbage":     "cabbage",
    "Carrot":      "carrots",
    "Cauliflower": "cauliflower",
    "Celery":      "celery",
    "Corn":        "corn",
    "Cucumber":    "cucumbers",
    "Eggplant":    "eggplant",
    "Lettuce":     "lettuce",
    "Muskmelon":   "muskmelons",
    "Onion":       "onions",
    "Parsnip":     "parsnips",
    "Peanut":      "peanuts",
    "Pea":         "peas",
    "Pepper":      "peppers",
    "Potato":      "potatoes",
    "Radish":      "radishes",
    "Spinach":     "spinach",
    "Squash":      "squash",
    "Tomato":      "tomatoes",
    "Turnip":      "turnips",
}

plant_lab_text = {
    "Bean":        "   Beans   ",
    "Beet":        "   Beets   ",
    "Cabbage":     "  Cabbage  ",
    "Carrot":      "  Carrots  ",
    "Cauliflower": "Cauliflower",
    "Celery":      "  Celery   ",
    "Corn":        "   Corn    ",
    "Cucumber":    " Cucumbers ",
    "Eggplant":    " Eggplant  ",
    "Lettuce":     "  Lettuce  ",
    "Muskmelon":   " Muskmelons",
    "Onion":       "  Onions   ",
    "Parsnip":     " Parsnips  ",
    "Peanut":      "  Peanuts  ",
    "Pea":         "   Peas    ",
    "Pepper":      "  Peppers  ",
    "Potato":      " Potatoes  ",
    "Radish":      " Radishes  ",
    "Spinach":     "  Spinach  ",
    "Squash":      "  Squash   ",
    "Tomato":      " Tomatoes  ",
    "Turnip":      "  Turnips  ",
}

in_game_check = ascii_string_equals(0x007be7, "Grow Crops")

first_percentage = byte(0x00030d)
second_percentage = byte(0x00030e)
third_percentage = byte(0x00030f)
plant_lab_fully_grown = (prev(first_percentage) == 90 && first_percentage == 100)
                     || (prev(second_percentage) == 90 && second_percentage == 100)
plant_lab_name = 0x009423

crew_members = byte(0x000314)
people_fed = byte(0x000316)
maximum_potential = byte(0x000317)
efficiency_rating = byte(0x000318)
difficulty = byte(0x000333)

//////////////////
// ACHIEVEMENTS //
//////////////////

// Complete a Trainee assignment with enough food to feed everyone
achievement(
    type = "win_condition",
    title = "First Crop",
    points = 2,
    description = "Complete a Trainee assignment with enough food to feed everyone",
    trigger = in_game_check && difficulty == 0 && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10
)

// Complete an Assistant assignment with enough food to feed everyone
achievement(
    type = "win_condition",
    title = "Crop Rotation",
    points = 3,
    description = "Complete an Assistant assignment with enough food to feed everyone",
    trigger = in_game_check && difficulty == 1 && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10
)

// Complete a Leader assignment with enough food to feed everyone
achievement(
    type = "win_condition",
    title = "Generous Commander",
    points = 4,
    description = "Complete an Leader assignment with enough food to feed everyone",
    trigger = in_game_check && difficulty == 2 && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10
)

// Grow all three crops with 100% of possible growth at once
achievement(
    title = "Full Harvest",
    points = 3,
    description = "Grow all three crops with 100% of possible growth at once",
    trigger = in_game_check && first_percentage == 100 && second_percentage == 100 && third_percentage == 100
           && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10
)

// Earn an efficiency rating of 100% on any assignment
achievement(
    title = "Data Scientist",
    points = 2,
    description = "Earn an efficiency rating of 100% on any assignment",
    trigger = in_game_check && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10 && efficiency_rating == 100
)

// Earn an efficiency rating of 100% on any Leader assignment
achievement(
    title = "One With Nature",
    points = 4,
    description = "Earn an efficiency rating of 100% on any Leader assignment",
    trigger = in_game_check && difficulty == 2 && prev(people_fed) != people_fed && people_fed >= crew_members && crew_members > 10 && efficiency_rating == 100
)

// Discover the ideal conditions for x in the Plant Lab
for x in plant_lab_text {
    achievement(
        title = format("{0} Expert", x),
        points = 1,
        description = format("Discover the ideal conditions for {0} in the Plant Lab", VegDescs[x]),
        trigger = in_game_check && ascii_string_equals(plant_lab_name, plant_lab_text[x]) && plant_lab_fully_grown
               && third_percentage == prev(third_percentage) // This prevents it from triggering in the Greenhouse
    )
}

///////////////////
// RICH PRESENCE //
///////////////////

rich_presence_conditional_display(
    difficulty <= 2,
    "Taking on {0} assignment",
    rich_presence_lookup("Difficulty", difficulty, DifficultyRPLookup, fallback="Unknown")
)

rich_presence_display(
    "Now loading..."
)
