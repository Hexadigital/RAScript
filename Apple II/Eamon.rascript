// Eamon
// #ID = 14023

harpy_cloud_loaded = ascii_string_equals(0x000829, "THE HARPY CLOUD")
devils_tomb_loaded = ascii_string_equals(0x000827, "THE DEVIL'S TOMB")
escape_from_orc_lair_loaded = ascii_string_equals(0x00082a, "ESCAPE") && ascii_string_equals(0x000849, "ORC LAIR")

room_id = word(0x00aa6e)
text_buffer = word(0x006f)

DTImportantLocations = {
    "Diamond Ring": 6,
    "Neamo": 9,
    "Trezore": 18,
    "Casino": 36,
    "Diamond Necklace": 38,
    "Final Door": 42,
    "Countryside": 43,
}

EFOLImportantLocations = {
    "Snarg and Flarg": 17,
    "Bork and Cork": 25,
    "Ruby 1": 103,
    "Ruby 2": 32,
    "Crystal 1": 102,
    "Crystal 2": 37,
    "Coins 1": 101,
    "Coins 2": 39,
    "Final Battle": 43,
    "Final Room": 45,
    "Freedom": 48,
    
}


achievement(
    //type = "progression",
    title = "[#7] Lost and Found",
    points = 2,
    description = "Find a Diamond Ring",
    trigger = devils_tomb_loaded
    && room_id == DTImportantLocations["Diamond Ring"]
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
    && room_id == DTImportantLocations["Neamo"]
    && (
    ascii_string_equals(text_buffer, "SAYSAY NEAMOSAY NEAMO")
    )
)

achievement(
    //type = "progression",
    title = "[#7] The Great and Powerful",
    points = 4,
    description = "Obtain the Spells of Trezore",
    trigger = devils_tomb_loaded
    && room_id == DTImportantLocations["Trezore"]
    && (
    ascii_string_equals(text_buffer, "IN A HUGE CAVERNBOOKGETGET BOOK")
    || ascii_string_equals(text_buffer, "IN A HUGE CAVERNBOOKTAKETAKE BOOK")
    )
)

achievement(
    //type = "progression",
    title = "[#7] Glimmering Riches",
    points = 2,
    description = "Find a Diamond Necklace",
    trigger = devils_tomb_loaded
    && room_id == DTImportantLocations["Diamond Necklace"]
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
    && prev(room_id) == DTImportantLocations["Final Door"]
    && room_id == DTImportantLocations["Countryside"]
)

achievement(
    //type = "progression",
    title = "[#44] All That Almost Glows",
    points = 3,
    description = "Find a Ruby",
    trigger = escape_from_orc_lair_loaded
    && (
    room_id == EFOLImportantLocations["Ruby 1"]
    || room_id == EFOLImportantLocations["Ruby 2"]
    )
    && (
    ascii_string_equals(text_buffer, "IN A E-W CORRIDORRUBYTAKETAKE RUBY")
    || ascii_string_equals(text_buffer, "IN A E-W CORRIDORRUBYGETGET RUBY")
    )
)

achievement(
    //type = "progression",
    title = "[#44] Neither Type Nor Value",
    points = 3,
    description = "Find a Crystal",
    trigger = escape_from_orc_lair_loaded
    && (
    room_id == EFOLImportantLocations["Crystal 1"]
    || room_id == EFOLImportantLocations["Crystal 2"]
    )
    && (
    ascii_string_equals(text_buffer, "IN A E-W CORRIDORCRYSTALTAKETAKE CRYSTAL")
    || ascii_string_equals(text_buffer, "IN A E-W CORRIDORCRYSTALGETGET CRYSTAL")
    )
)

achievement(
    //type = "progression",
    title = "[#44] Platinum Politics",
    points = 1,
    description = "Find some coins",
    trigger = escape_from_orc_lair_loaded
    && (
    room_id == EFOLImportantLocations["Coins 1"]
    || room_id == EFOLImportantLocations["Coins 2"]
    )
    && (
    ascii_string_equals(text_buffer, "IN THE TREASURE ROOMPLATINUM COINSTAKETAKE PLATINUM COINS")
    || ascii_string_equals(text_buffer, "IN THE TREASURE ROOMPLATINUM COINSGETGET PLATINUM COINS")
    )
)

achievement(
    type = "progression",
    title = "[#44] Leaving a Trail of Bodies",
    points = 5,
    description = "Successfully escape the Orc Lair",
    trigger = escape_from_orc_lair_loaded
    && prev(room_id) == EFOLImportantLocations["Final Room"]
    && room_id == EFOLImportantLocations["Freedom"]
)
