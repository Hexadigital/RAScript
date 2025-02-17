// Eamon
// #ID = 14023

harpy_cloud_loaded = ascii_string_equals(0x000829, "THE HARPY CLOUD")
devils_tomb_loaded = ascii_string_equals(0x000827, "THE DEVIL'S TOMB")
escape_from_orc_lair_loaded = ascii_string_equals(0x00082a, "ESCAPE") && ascii_string_equals(0x000849, "ORC LAIR")
chamber_of_dragons_loaded = ascii_string_equals(0x000825, "THE CHAMBER") && ascii_string_equals(0x000848, "DRAGONS")
main_hall_loaded = ascii_string_equals(0x00083e, "MAIN HALL")
beginners_cave_loaded = ascii_string_equals(0x000824, "THE BEGINNERS CAVE")
death_star_loaded = ascii_string_equals(0x000828, "THE DEATH STAR")
cave_of_the_mind_loaded = ascii_string_equals(0x000828, "CAVE OF THE MIND")
zyphur_riverventure_loaded = ascii_string_equals(0x000825, "ZYPHUR RIVERVENTURE")

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

CODImportantLocations = {
    "Entrance": 1,
    "Dragon Eggs": 5,
    "Silver Coins": 19,
    "Red Rubies": 9,
    "Emerald": 12,
    "Gold Coins": 8,
    "Docksiders": 15,
    "Copper Coins": 16,
    "Black Jewel": 14,
    "Sceptre 1": 121,
    "Sceptre 2": 21,
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

achievement(
    //type = "progression",
    title = "[#96] Black Market Omelette",
    points = 1,
    description = "Steal some dragon eggs from a hidden room",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Dragon Eggs"]
    && (
    ascii_string_equals(text_buffer, "IN A SECRET CAVERNDRAGON EGGSTAKETAKE DRAGON EGGS")
    || ascii_string_equals(text_buffer, "IN A SECRET CAVERNDRAGON EGGSGETGET DRAGON EGGS")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Beating the Market",
    points = 1,
    description = "Steal the silver coins in the silver room from the silver creature",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Silver Coins"]
    && (
    ascii_string_equals(text_buffer, "IN THE SILVER ROOMSILVER COINSTAKETAKE SILVER COINS")
    || ascii_string_equals(text_buffer, "IN THE SILVER ROOMSILVER COINSGETGET SILVER COINS")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Mealtime's Over",
    points = 1,
    description = "Find some rubies",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Red Rubies"]
    && (
    ascii_string_equals(text_buffer, "IN THE RED ROOMRED RUBIESTAKETAKE RED RUBIES")
    || ascii_string_equals(text_buffer, "IN THE RED ROOMRED RUBIESGETGET RED RUBIES")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Slain for Slander",
    points = 1,
    description = "Find an emerald",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Emerald"]
    && (
    ascii_string_equals(text_buffer, "IN THE GREEN ROOMEMERALDTAKETAKE EMERALD")
    || ascii_string_equals(text_buffer, "IN THE GREEN ROOMEMERALDGETGET EMERALD")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Blinded by Gold",
    points = 2,
    description = "Steal the gold coins in the gold room from the gold creature",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Gold Coins"]
    && (
    ascii_string_equals(text_buffer, "IN THE GOLD ROOMGOLD COINSTAKETAKE GOLD COINS")
    || ascii_string_equals(text_buffer, "IN THE GOLD ROOMGOLD COINSGETGET GOLD COINS")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Vintage Leather",
    points = 1,
    description = "Steal a pair of Docksiders",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Docksiders"]
    && (
    ascii_string_equals(text_buffer, "IN THE PINK ROOMDOCKSIDERSTAKETAKE DOCKSIDERS")
    || ascii_string_equals(text_buffer, "IN THE PINK ROOMDOCKSIDERSGETGET DOCKSIDERS")
    )
)

achievement(
    //type = "progression",
    title = "[#96] The Legend of Lincoln",
    points = 1,
    description = "Steal some copper coins",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Copper Coins"]
    && (
    ascii_string_equals(text_buffer, "IN THE COPPER ROOMCOPPER COINSTAKETAKE COPPER COINS")
    || ascii_string_equals(text_buffer, "IN THE COPPER ROOMCOPPER COINSGETGET COPPER COINS")
    )
)

achievement(
    //type = "progression",
    title = "[#96] Fighting Shadows",
    points = 1,
    description = "Steal a black jewel",
    trigger = chamber_of_dragons_loaded
    && room_id == CODImportantLocations["Black Jewel"]
    && (
    ascii_string_equals(text_buffer, "IN THE BLACK ROOMBLACK JEWELTAKETAKE BLACK JEWEL")
    || ascii_string_equals(text_buffer, "IN THE BLACK ROOMBLACK JEWELGETGET BLACK JEWEL")
    )
)

achievement(
    type = "progression",
    title = "[#96] Scaled Thief",
    points = 5,
    description = "Steal a sceptre from the nasty dragon and escape",
    trigger = chamber_of_dragons_loaded
    && (
        once(
            room_id == CODImportantLocations["Sceptre 1"]
            && ascii_string_equals(text_buffer, "IN A EXTREMELY LARGE CAVERNSCEPTRETAKETAKE SCEPTRE")
        )
        || once(
        room_id == CODImportantLocations["Sceptre 1"]
            && ascii_string_equals(text_buffer, "IN A EXTREMELY LARGE CAVERNSCEPTREGETGET SCEPTRE")
        )
        || once(
            room_id == CODImportantLocations["Sceptre 2"]
            && ascii_string_equals(text_buffer, "IN A EXTREMELY LARGE CAVERNSCEPTRETAKETAKE SCEPTRE")
        )
        || once(
        room_id == CODImportantLocations["Sceptre 2"]
            && ascii_string_equals(text_buffer, "IN A EXTREMELY LARGE CAVERNSCEPTREGETGET SCEPTRE")
        )
    )
    && trigger_when(room_id == CODImportantLocations["Entrance"] && ascii_string_equals(text_buffer, "UPUPUP"))
)

rich_presence_conditional_display(
    main_hall_loaded,
    "Exploring the main hall"
)

rich_presence_conditional_display(
    beginners_cave_loaded,
    "Traversing The Beginner's Cave"
)

rich_presence_conditional_display(
    death_star_loaded,
    "Trapped on The Death Star"
)

rich_presence_conditional_display(
    cave_of_the_mind_loaded,
    "Wandering through The Cave of the Mind"
)

rich_presence_conditional_display(
    zyphur_riverventure_loaded,
    "Boating on The Zyphur Riverventure"
)

rich_presence_conditional_display(
    harpy_cloud_loaded,
    "Floating through The Harpy Cloud"
)

rich_presence_conditional_display(
    devils_tomb_loaded,
    "Trying to survive The Devil's Tomb"
)

rich_presence_conditional_display(
    escape_from_orc_lair_loaded,
    "Escaping from the Orc Lair"
)

rich_presence_conditional_display(
    chamber_of_dragons_loaded,
    "Traversing The Chamber of the Dragons"
)

rich_presence_display(
    "Playing Eamon"
)
