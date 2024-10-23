// Planetarian: Chiisa na Hoshi no Yume
// #ID = 24961

ChapterEndingLines = {
    1: 0x012dc8d8,
    2: 0x012e1180,
    3: 0x012e4974,
    4: 0x012e8bc4,
    5: 0x012ef8ac,
    6: 0x012f10a8,
    7: 0x012f3a74,
    8: 0x012f6ad0,
    9: 0x012f9f78,
    10: 0x012ff684,
    11: 0x01301824,
    12: 0x013044d4,
    13: 0x013089a0,
    14: 0x0130a5c8,
    15: 0x0130d3e0,
    16: 0x0130fc2c
}

ChapterNames = {
    1: "The Robot's Bouquet",
    2: "The Sealed City and the Scrapyard",
    3: "The Dream that the Scavenger Saw 1 / At the Reception Desk",
    4: "Projector Repair",
    5: "The Dream that the Scavenger Saw 2 / Stellar Light Bulb",
    6: "Repairs Completed / Pre-Projection",
    7: "The Projection of Dreams",
    8: "The Dream of Mankind in Space",
    9: "After the Planetarium",
    10: "The Sealed City 1 (Uninhabited Streets)",
    11: "The Sealed City 2 (Drunk with Sake and Rain)",
    12: "At the Breach of the Sealing Wall",
    13: "The Battle of the Lion's Nest",
    14: "The End of Battle",
    15: "Holographic Image",
    16: "The Dreamer's Desire"
}

line_one = dword(0x0027c7ac)
line_two = dword(0x0027c7b0)
line_three = dword(0x0027c7b4)
chapter_number = byte(0x00294490)

function get_progression(num) {
    if num == 16 {
        return "win_condition"
    }
    return "progression"
}

// Completing chapters 1-16
for c in ChapterEndingLines {
    achievement(
        type = get_progression(c),
        title = ChapterNames[c],
        points = 1,
        description = format("Complete chapter {0}", c),
        trigger = line_one == ChapterEndingLines[c]
        && prev(chapter_number) == c
        && chapter_number == c + 1
    )
}

rich_presence_conditional_display(
    chapter_number == 0,
    "At the title screen"
)

rich_presence_conditional_display(
    chapter_number == 17,
    "Watching the credits"
)

rich_presence_display(
    "Reading chapter {0} - 『{1}』",
    rich_presence_value("Number", chapter_number),
    rich_presence_lookup("Chapter", chapter_number, ChapterNames, fallback="Unknown")
)
