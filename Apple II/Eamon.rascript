// Eamon
// #ID = 14023

harpy_cloud_loaded = ascii_string_equals(0x000829, "THE HARPY CLOUD")
devils_tomb_loaded = ascii_string_equals(0x000827, "THE DEVIL'S TOMB")

room_id = word(0x00aa6e)
text_buffer = word(0x006f)

ImportantLocations = {
    "Diamond Ring": 6,
    "Neamo": 9,
    "Trezore": 18,
    "Casino": 36,
    "Diamond Necklace": 38,
    "Final Door": 42,
    "Countryside": 43,
}


achievement(
    //type = "progression",
    title = "[#7] Lost and Found",
    points = 1,
    description = "Find a Diamond Ring",
    trigger = devils_tomb_loaded
    && room_id == ImportantLocations["Diamond Ring"]
    && (
    ascii_string_equals(text_buffer, "IN A CELLDIAMOND RINGGET")
    || ascii_string_equals(text_buffer, "IN A CELLDIAMOND RINGTAKE")
    )
)

achievement(
    //type = "progression",
    title = "[#7] Tempted by Red",
    points = 1,
    description = "Read the writing on the floor out loud",
    trigger = devils_tomb_loaded
    && room_id == ImportantLocations["Neamo"]
    && (
    ascii_string_equals(text_buffer, "SAYSAY NEAMOSAY NEAMO")
    )
)

achievement(
    //type = "progression",
    title = "[#7] The Great and Powerful",
    points = 3,
    description = "Obtain the Spells of Trezore",
    trigger = devils_tomb_loaded
    && room_id == ImportantLocations["Trezore"]
    && (
    ascii_string_equals(text_buffer, "IN A HUGE CAVERNBOOKGETGET BOOK")
    || ascii_string_equals(text_buffer, "IN A HUGE CAVERNBOOKTAKETAKE BOOK")
    )
)

achievement(
    //type = "progression",
    title = "[#7] Glimmering Riches",
    points = 1,
    description = "Find a Diamond Necklace",
    trigger = devils_tomb_loaded
    && room_id == ImportantLocations["Diamond Necklace"]
    && (
    ascii_string_equals(text_buffer, "IN A N/S HALLNECKLACETAKE TAKE NECKLACE")
    || ascii_string_equals(text_buffer, "IN A N/S HALLNECKLACEGET GET NECKLACE")
    )
)

achievement(
    type = "progression",
    title = "[#7] Never Reading That Book Again",
    points = 5,
    description = "Successfully escape The Devil's Tomb",
    trigger = devils_tomb_loaded
    && prev(room_id) == ImportantLocations["Final Door"]
    && room_id == ImportantLocations["Countryside"]
)
