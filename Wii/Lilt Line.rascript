// Lilt Line
// #ID = 34673

us_serial = dword_be(0x0025a880) == 0x5265734d
eu_serial = dword_be(0x002532a0) == 0x5265734d

PerfectScores = {
    "Training": 15000,
    "Life Bike": 15000,
    "Bloome": 20000,
    "One In": 20000,
    "Right Over": 25000,
    "Dirt Shirt": 25000,
    "Seesaw": 20000,
    "Cinap": 20000,
    "Spirit Dust": 20000,
    "Two Byte": 20000,
    "What": 25000,
    "Betamax": 40000,
    "Trottalong": 40000,
    "Xplodofist": 40000,
    "Srpnt": 50000,
}

SongScoresUS = {
    "Training": 0x00281120,
    "Life Bike": 0x00281128,
    "Bloome": 0x00281130,
    "One In": 0x00281138,
    "Right Over": 0x00281140,
    "Dirt Shirt": 0x00281148,
    "Seesaw": 0x00281150,
    "Cinap": 0x00281158,
    "Spirit Dust": 0x00281160,
    "Two Byte": 0x00281168,
    "What": 0x00281170,
    "Betamax": 0x00281178,
    "Trottalong": 0x00281180,
    "Xplodofist": 0x00281188,
    "Srpnt": 0x00281190,
}

SongScoresEU = {
    "Training": 0x00281120 - 0x7580,
    "Life Bike": 0x00281128 - 0x7580,
    "Bloome": 0x00281130 - 0x7580,
    "One In": 0x00281138 - 0x7580,
    "Right Over": 0x00281140 - 0x7580,
    "Dirt Shirt": 0x00281148 - 0x7580,
    "Seesaw": 0x00281150 - 0x7580,
    "Cinap": 0x00281158 - 0x7580,
    "Spirit Dust": 0x00281160 - 0x7580,
    "Two Byte": 0x00281168 - 0x7580,
    "What": 0x00281170 - 0x7580,
    "Betamax": 0x00281178 - 0x7580,
    "Trottalong": 0x00281180 - 0x7580,
    "Xplodofist": 0x00281188 - 0x7580,
    "Srpnt": 0x00281190 - 0x7580,
}

GameStateIDLookup = {
    0x00: "Title",
    0x01: "Song Select",
    0x02: "In-Game",
    0x04: "High Scores",
    0x05: "Credits",
    0x06: "Splash Screens",
}

GameStateLookup = {}
for key in GameStateIDLookup {
    GameStateLookup[GameStateIDLookup[key]] = key
}

SongNameLookup = {
    "Training": 0,
    "Life Bike": 1,
    "Bloome": 2,
    "One In": 3,
    "Right Over": 4,
    "Dirt Shirt": 5,
    "Seesaw": 6,
    "Cinap": 7,
    "Spirit Dust": 8,
    "Two Byte": 9,
    "What": 10,
    "Betamax": 11,
    "Trottalong": 12,
    "Xplodofist": 13,
    "Srpnt": 14,
}

SongIDLookup = {}
for key in SongNameLookup {
    SongIDLookup[SongNameLookup[key]] = key
}

game_state_us = byte(0x0025a8fb)
game_state_eu = byte(0x0025331b)
current_song_us = byte(0x0025b53b)
current_song_eu = byte(0x00253f5b)
current_score_us = dword_be(0x0025b508)
current_score_eu = dword_be(0x00253f28)

function song_cleared(name) {
    return (us_serial
    && game_state_us == GameStateLookup["In-Game"]
    && current_song_us == SongNameLookup[name]
    && prev(dword_be(SongScoresUS[name])) == 0
    && dword_be(SongScoresUS[name]) > 0
    && dword_be(SongScoresUS[name]) <= PerfectScores[name])
    ||
    (eu_serial
    && game_state_eu == GameStateLookup["In-Game"]
    && current_song_eu == SongNameLookup[name]
    && prev(dword_be(SongScoresEU[name])) == 0
    && dword_be(SongScoresEU[name]) > 0
    && dword_be(SongScoresEU[name]) <= PerfectScores[name])
}

function perfect_clear(name) {
    return (us_serial
    && game_state_us == GameStateLookup["In-Game"]
    && current_song_us == SongNameLookup[name]
    && prev(dword_be(SongScoresUS[name])) < PerfectScores[name]
    && dword_be(SongScoresUS[name]) == PerfectScores[name])
    ||
    (eu_serial
    && game_state_eu == GameStateLookup["In-Game"]
    && current_song_eu == SongNameLookup[name]
    && prev(dword_be(SongScoresEU[name])) < PerfectScores[name]
    && dword_be(SongScoresEU[name]) == PerfectScores[name])
}

function song_number_not_played_us(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresUS[song_name]) == 0
}

function song_number_not_played_eu(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresEU[song_name]) == 0
}

function song_number_previously_not_played_us(i) {
    song_name = SongIDLookup[i]
    return prev(dword_be(SongScoresUS[song_name])) == 0
}

function song_number_previously_not_played_eu(i) {
    song_name = SongIDLookup[i]
    return prev(dword_be(SongScoresEU[song_name])) == 0
}

function song_number_played_us(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresUS[song_name]) > 0
}

function song_number_played_eu(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresEU[song_name]) > 0
}

function song_number_previously_not_perfected_us(i) {
    song_name = SongIDLookup[i]
    return prev(dword_be(SongScoresUS[song_name])) != PerfectScores[song_name]
}

function song_number_previously_not_perfected_eu(i) {
    song_name = SongIDLookup[i]
    return prev(dword_be(SongScoresEU[song_name])) != PerfectScores[song_name]
}

function song_number_perfected_us(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresUS[song_name]) == PerfectScores[song_name]
}

function song_number_perfected_eu(i) {
    song_name = SongIDLookup[i]
    return dword_be(SongScoresEU[song_name]) == PerfectScores[song_name]
}

function new_save_new_start() {
    return (us_serial
    && prev(game_state_us) == GameStateLookup["Title"]
    && game_state_us == GameStateLookup["Song Select"]
    && all_of(range(0, 14), song_number_not_played_us))
    || (eu_serial
    && prev(game_state_eu) == GameStateLookup["Title"]
    && game_state_eu == GameStateLookup["Song Select"]
    && all_of(range(0, 14), song_number_not_played_eu))
}

function detect_reset() {
    return (us_serial
        && (game_state_us == GameStateLookup["Title"] || game_state_us > GameStateLookup["Credits"]))
        || (eu_serial
        && (game_state_eu == GameStateLookup["Title"] || game_state_eu > GameStateLookup["Credits"]))
}

function all_songs_cleared() {
    return (us_serial
    && game_state_us == GameStateLookup["In-Game"]
    && any_of(range(0, 14), song_number_previously_not_played_us)
    && all_of(range(0, 14), song_number_played_us))
    || (eu_serial
    && game_state_eu == GameStateLookup["In-Game"]
    && any_of(range(0, 14), song_number_previously_not_played_eu)
    && all_of(range(0, 14), song_number_played_eu))
}

function all_songs_perfected() {
    return (us_serial
    && game_state_us == GameStateLookup["In-Game"]
    && any_of(range(0, 14), song_number_previously_not_perfected_us)
    && all_of(range(0, 14), song_number_perfected_us))
    || (eu_serial
    && game_state_eu == GameStateLookup["In-Game"]
    && any_of(range(0, 14), song_number_previously_not_perfected_eu)
    && all_of(range(0, 14), song_number_perfected_eu))
}


progression_titles = {
    "Training": "Warming Up",
    "Bloome": "Biking Through Flowers",
    "Right Over": "In & Over",
    "Seesaw": "Playground Tumble",
    "Spirit Dust": "Ascension",
    "What": "Learning to Code",
    "Trottalong": "Antiquated Formats",
    "Srpnt": "Slithering Strikes"
}

progression_types = {
    "Training": "progression",
    "Bloome": "progression",
    "Right Over": "progression",
    "Seesaw": "progression",
    "Spirit Dust": "progression",
    "What": "progression",
    "Trottalong": "progression",
    "Srpnt": "win_condition"
}

progression_points = {
    "Training": 1,
    "Bloome": 2,
    "Right Over": 3,
    "Seesaw": 4,
    "Spirit Dust": 4,
    "What": 5,
    "Trottalong": 5,
    "Srpnt": 10
}

for song_name in ["Training", "Bloome", "Right Over", "Seesaw", "Spirit Dust", "What", "Trottalong", "Srpnt"] {
    achievement(
        title = progression_titles[song_name],
        type = progression_types[song_name],
        points = progression_points[song_name],
        description = format("Clear {0}", song_name),
        trigger = song_cleared(song_name)
    )
}

perfect_titles = {
    "Training": "Practice Makes Perfect",
    "Life Bike": "Expert Cyclist",
    "Bloome": "Picturesque Garden",
    "One In": "All In",
    "Right Over": "Always Right",
    "Dirt Shirt": "Keeping Clean",
    "Seesaw": "Perfectly Balanced",
    "Cinap": "Keeping Calm",
    "Spirit Dust": "Golden Spirit",
    "Two Byte": "Gigabyte",
    "What": "Victory",
    "Betamax": "Alternate Timeline",
    "Trottalong": "Perfect Strut",
    "Xplodofist": "Essence of Combat",
    "Srpnt": "Snake Charmer",
}

perfect_points = {
    "Training": 1,
    "Life Bike": 2,
    "Bloome": 3,
    "One In": 3,
    "Right Over": 5,
    "Dirt Shirt": 5,
    "Seesaw": 4,
    "Cinap": 4,
    "Spirit Dust": 4,
    "Two Byte": 4,
    "What": 4,
    "Betamax": 10,
    "Trottalong": 10,
    "Xplodofist": 10,
    "Srpnt": 25,
}

for i in range (0, 14) {
    song_name = SongIDLookup[i]
    achievement(
        title = perfect_titles[song_name],
        points = perfect_points[song_name],
        description = format("Get a perfect score on {0}", song_name),
        trigger = perfect_clear(song_name)
    )
}

// Any% Speedrun - On a new save, clear the game as fast as possible in one session
leaderboard(
    title = "Any% Speedrun",
    description = "On a new save, clear the game as fast as possible in one session",
    start  = new_save_new_start(),
    cancel = detect_reset(),
    submit = all_songs_cleared(),
    value  = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

// Perfect Speedrun - On a new save, clear the entire game with perfect scores as fast as possible in one session
leaderboard(
    title = "Perfect Speedrun",
    description = "On a new save, clear the entire game with perfect scores as fast as possible in one session",
    start  = new_save_new_start(),
    cancel = detect_reset(),
    submit = all_songs_perfected(),
    value  = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

// Song Name • Score: {1}

rich_presence_conditional_display(
    us_serial && game_state_us == GameStateLookup["Title"],
    "At the title screen • USA"
)

rich_presence_conditional_display(
    us_serial && game_state_us == GameStateLookup["Song Select"],
    "Selecting a song • USA"
)

rich_presence_conditional_display(
    us_serial && game_state_us == GameStateLookup["High Scores"],
    "Viewing their high scores • USA"
)

rich_presence_conditional_display(
    us_serial && game_state_us == GameStateLookup["Credits"],
    "Reading the credits • USA"
)

rich_presence_conditional_display(
    us_serial && game_state_us == GameStateLookup["In-Game"],
    "{0} • Score: {1} • USA",
    rich_presence_lookup("Song", current_song_us, SongIDLookup, fallback="Unknown Song"),
    rich_presence_value("Number", current_score_us)
)

rich_presence_conditional_display(
    eu_serial && game_state_eu == GameStateLookup["Title"],
    "At the title screen • EUR"
)

rich_presence_conditional_display(
    eu_serial && game_state_eu == GameStateLookup["Song Select"],
    "Selecting a song • EUR"
)

rich_presence_conditional_display(
    eu_serial && game_state_eu == GameStateLookup["High Scores"],
    "Viewing their high scores • EUR"
)

rich_presence_conditional_display(
    eu_serial && game_state_eu == GameStateLookup["Credits"],
    "Reading the credits • EUR"
)

rich_presence_conditional_display(
    eu_serial && game_state_eu == GameStateLookup["In-Game"],
    "{0} • Score: {1} • EUR",
    rich_presence_lookup("Song", current_song_eu, SongIDLookup, fallback="Unknown Song"),
    rich_presence_value("Number", current_score_eu)
)

rich_presence_display(
    "Now loading..."
)
