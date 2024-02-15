// ~Hack~ Pokemon Periwinkle [Subset - Professor Oak Challenge]
// #ID = 28590

pokedex_start = 0xd2f6

pokedex_lookup = {
    "Bulbasaur":bit0(pokedex_start),
    "Ivysaur":bit1(pokedex_start),
    "Venusaur":bit2(pokedex_start),
    "Charmander":bit3(pokedex_start),
    "Charmeleon":bit4(pokedex_start),
    "Charizard":bit5(pokedex_start),
    "Squirtle":bit6(pokedex_start),
    "Wartortle":bit7(pokedex_start),
    "Blastoise":bit0(pokedex_start + 1),
    "Caterpie":bit1(pokedex_start + 1),
    "Metapod":bit2(pokedex_start + 1),
    "Butterfree":bit3(pokedex_start + 1),
    "Weedle":bit4(pokedex_start + 1),
    "Kakuna":bit5(pokedex_start + 1),
    "Beedrill":bit6(pokedex_start + 1),
    "Pidgey":bit7(pokedex_start + 1),
    "Pidgeotto":bit0(pokedex_start + 2),
    "Pidgeot":bit1(pokedex_start + 2),
    "Rattata":bit2(pokedex_start + 2),
    "Raticate":bit3(pokedex_start + 2),
    "Spearow":bit4(pokedex_start + 2),
    "Fearow":bit5(pokedex_start + 2),
    "Ekans":bit6(pokedex_start + 2),
    "Arbok":bit7(pokedex_start + 2),
    "Pikachu":bit0(pokedex_start + 3),
    "Raichu":bit1(pokedex_start + 3),
    "Sandshrew":bit2(pokedex_start + 3),
    "Sandslash":bit3(pokedex_start + 3),
    "Nidoran♀":bit4(pokedex_start + 3),
    "Nidorina":bit5(pokedex_start + 3),
    "Nidoqueen":bit6(pokedex_start + 3),
    "Nidoran♂":bit7(pokedex_start + 3),
    "Nidorino":bit0(pokedex_start + 4),
    "Nidoking":bit1(pokedex_start + 4),
    "Clefairy":bit2(pokedex_start + 4),
    "Clefable":bit3(pokedex_start + 4),
    "Vulpix":bit4(pokedex_start + 4),
    "Ninetales":bit5(pokedex_start + 4),
    "Jigglypuff":bit6(pokedex_start + 4),
    "Wigglytuff":bit7(pokedex_start + 4),
    "Zubat":bit0(pokedex_start + 5),
    "Golbat":bit1(pokedex_start + 5),
    "Oddish":bit2(pokedex_start + 5),
    "Gloom":bit3(pokedex_start + 5),
    "Vileplume":bit4(pokedex_start + 5),
    "Paras":bit5(pokedex_start + 5),
    "Parasect":bit6(pokedex_start + 5),
    "Venonat":bit7(pokedex_start + 5),
    "Venomoth":bit0(pokedex_start + 6),
    "Diglett":bit1(pokedex_start + 6),
    "Dugtrio":bit2(pokedex_start + 6),
    "Meowth":bit3(pokedex_start + 6),
    "Persian":bit4(pokedex_start + 6),
    "Psyduck":bit5(pokedex_start + 6),
    "Golduck":bit6(pokedex_start + 6),
    "Mankey":bit7(pokedex_start + 6),
    "Primeape":bit0(pokedex_start + 7),
    "Growlithe":bit1(pokedex_start + 7),
    "Arcanine":bit2(pokedex_start + 7),
    "Poliwag":bit3(pokedex_start + 7),
    "Poliwhirl":bit4(pokedex_start + 7),
    "Poliwrath":bit5(pokedex_start + 7),
    "Abra":bit6(pokedex_start + 7),
    "Kadabra":bit7(pokedex_start + 7),
    "Alakazam":bit0(pokedex_start + 8),
    "Machop":bit1(pokedex_start + 8),
    "Machoke":bit2(pokedex_start + 8),
    "Machamp":bit3(pokedex_start + 8),
    "Bellsprout":bit4(pokedex_start + 8),
    "Weepinbell":bit5(pokedex_start + 8),
    "Victreebel":bit6(pokedex_start + 8),
    "Tentacool":bit7(pokedex_start + 8),
    "Tentacruel":bit0(pokedex_start + 9),
    "Geodude":bit1(pokedex_start + 9),
    "Graveler":bit2(pokedex_start + 9),
    "Golem":bit3(pokedex_start + 9),
    "Ponyta":bit4(pokedex_start + 9),
    "Rapidash":bit5(pokedex_start + 9),
    "Slowpoke":bit6(pokedex_start + 9),
    "Slowbro":bit7(pokedex_start + 9),
    "Magnemite":bit0(pokedex_start + 10),
    "Magneton":bit1(pokedex_start + 10),
    "Farfetch'd":bit2(pokedex_start + 10),
    "Doduo":bit3(pokedex_start + 10),
    "Dodrio":bit4(pokedex_start + 10),
    "Seel":bit5(pokedex_start + 10),
    "Dewgong":bit6(pokedex_start + 10),
    "Grimer":bit7(pokedex_start + 10),
    "Muk":bit0(pokedex_start + 11),
    "Shellder":bit1(pokedex_start + 11),
    "Cloyster":bit2(pokedex_start + 11),
    "Gastly":bit3(pokedex_start + 11),
    "Haunter":bit4(pokedex_start + 11),
    "Gengar":bit5(pokedex_start + 11),
    "Onix":bit6(pokedex_start + 11),
    "Drowzee":bit7(pokedex_start + 11),
    "Hypno":bit0(pokedex_start + 12),
    "Krabby":bit1(pokedex_start + 12),
    "Kingler":bit2(pokedex_start + 12),
    "Voltorb":bit3(pokedex_start + 12),
    "Electrode":bit4(pokedex_start + 12),
    "Exeggcute":bit5(pokedex_start + 12),
    "Exeggutor":bit6(pokedex_start + 12),
    "Cubone":bit7(pokedex_start + 12),
    "Marowak":bit0(pokedex_start + 13),
    "Hitmonlee":bit1(pokedex_start + 13),
    "Hitmonchan":bit2(pokedex_start + 13),
    "Lickitung":bit3(pokedex_start + 13),
    "Koffing":bit4(pokedex_start + 13),
    "Weezing":bit5(pokedex_start + 13),
    "Rhyhorn":bit6(pokedex_start + 13),
    "Rhydon":bit7(pokedex_start + 13),
    "Chansey":bit0(pokedex_start + 14),
    "Tangela":bit1(pokedex_start + 14),
    "Kangaskhan":bit2(pokedex_start + 14),
    "Horsea":bit3(pokedex_start + 14),
    "Seadra":bit4(pokedex_start + 14),
    "Goldeen":bit5(pokedex_start + 14),
    "Seaking":bit6(pokedex_start + 14),
    "Staryu":bit7(pokedex_start + 14),
    "Starmie":bit0(pokedex_start + 15),
    "Mr. Mime":bit1(pokedex_start + 15),
    "Scyther":bit2(pokedex_start + 15),
    "Jynx":bit3(pokedex_start + 15),
    "Electabuzz":bit4(pokedex_start + 15),
    "Magmar":bit5(pokedex_start + 15),
    "Pinsir":bit6(pokedex_start + 15),
    "Tauros":bit7(pokedex_start + 15),
    "Magikarp":bit0(pokedex_start + 16),
    "Gyarados":bit1(pokedex_start + 16),
    "Lapras":bit2(pokedex_start + 16),
    "Ditto":bit3(pokedex_start + 16),
    "Eevee":bit4(pokedex_start + 16),
    "Vaporeon":bit5(pokedex_start + 16),
    "Jolteon":bit6(pokedex_start + 16),
    "Flareon":bit7(pokedex_start + 16),
    "Porygon":bit0(pokedex_start + 17),
    "Omanyte":bit1(pokedex_start + 17),
    "Omastar":bit2(pokedex_start + 17),
    "Kabuto":bit3(pokedex_start + 17),
    "Kabutops":bit4(pokedex_start + 17),
    "Aerodactyl":bit5(pokedex_start + 17),
    "Snorlax":bit6(pokedex_start + 17),
    "Articuno":bit7(pokedex_start + 17),
    "Zapdos":bit0(pokedex_start + 18),
    "Moltres":bit1(pokedex_start + 18),
    "Dratini":bit2(pokedex_start + 18),
    "Dragonair":bit3(pokedex_start + 18),
    "Dragonite":bit4(pokedex_start + 18),
    "Baracktwo":bit5(pokedex_start + 18),
    "Mew":bit6(pokedex_start + 18),
    "Meltan":bit7(pokedex_start + 18),
    "Melmetal":bit0(pokedex_start + 19),
    "Blobbos":bit1(pokedex_start + 19),
    "Jumpeon":bit2(pokedex_start + 19),
    "Tentaquil":bit3(pokedex_start + 19)
}

badge_lookup = {
    "Blobbos":"450639",
    "Caterpie":"450652",
    "Metapod":"450653",
    "Butterfree":"450654",
    "Weedle":"450656",
    "Kakuna":"450657",
    "Beedrill":"450658",
    "Pidgey":"450659",
    "Pidgeotto":"450660",
    "Pidgeot":"450661",
    "Rattata":"450667",
    "Raticate":"450668",
    "Spearow":"450669",
    "Fearow":"450670",
    "Pikachu":"450671",
    "Nidoran♀":"450701",
    "Nidorina":"450702",
    "Nidoran♂":"450703",
    "Nidorino":"450704",
    "Oddish":"450715",
    "Gloom":"450716",
    "Mankey":"450717",
    "Primeape":"450718",
    "Bellsprout":"450738",
    "Weepinbell":"450739",
    "Brock":"450676",
    "Bulbasaur":"450677",
    "Ivysaur":"450678",
    "Venusaur":"450679",
    "Charmander":"450680",
    "Charmeleon":"450681",
    "Charizard":"450682",
    "Ekans":"450683",
    "Arbok":"450684",
    "Raichu":"450685",
    "Sandshrew":"450686",
    "Sandslash":"450687",
    "The First Moon Evo":"450695",
    "The Second Moon Evo":"450696",
    "Clefairy":"450697",
    "The Third Moon Evo":"450698",
    "Vulpix":"450699",
    "Ninetales":"450700",
    "Jigglypuff":"450708",
    "The Final Moon Evo":"450709",
    "Zubat":"450710",
    "Golbat":"450711",
    "Vileplume":"450712",
    "Paras":"450713",
    "Parasect":"450714",
    "Venonat":"450719",
    "Venomoth":"450720",
    "Diglett":"450721",
    "Dugtrio":"450722",
    "Meowth":"450723",
    "Persian":"450724",
    "Poliwag":"450729",
    "Poliwhirl":"450730",
    "Poliwrath":"450731",
    "Abra":"450732",
    "Kadabra":"450733",
    "Alakazam":"450734",
    "Machop":"450735",
    "Machoke":"450736",
    "Machamp":"450737",
    "Victreebel":"450740",
    "Tentacool":"450741",
    "Tentacruel":"450742",
    "Geodude":"450743",
    "Graveler":"450744",
    "Golem":"450745",
    "Ponyta":"450746",
    "Rapidash":"450747",
    "Magnemite":"450749",
    "Magneton":"450750",
    "Farfetch'd":"450751",
    "Doduo":"450752",
    "Dodrio":"450753",
    "Shellder":"450761",
    "Cloyster":"450762",
    "Gastly":"450763",
    "Haunter":"450764",
    "Gengar":"450765",
    "Onix":"450766",
    "Drowzee":"450767",
    "Hypno":"450768",
    "Krabby":"450769",
    "Kingler":"450770",
    "Exeggcute":"450772",
    "Exeggutor":"450773",
    "Cubone":"450774",
    "Marowak":"450775",
    "The First Hitmon":"450776",
    "Lickitung":"450777",
    "Rhyhorn":"450783",
    "Rhydon":"450784",
    "Chansey":"450785",
    "Tangela":"450786",
    "Kangaskhan":"450787",
    "Horsea":"450788",
    "Seadra":"450789",
    "Goldeen":"450790",
    "Seaking":"450791",
    "Staryu":"450792",
    "Starmie":"450793",
    "Mr. Mime":"450794",
    "Scyther":"450795",
    "Pinsir":"450796",
    "Tauros":"450797",
    "Magikarp":"450802",
    "Gyarados":"450803",
    "Lapras":"450804",
    "Eevee":"450805",
    "Vaporeon":"450806",
    "Jolteon":"450807",
    "Flareon":"450808",
    "Porygon":"450809",
    "Snorlax":"450816",
    "Dratini":"450817",
    "Dragonair":"450818",
    "Dragonite":"450819",
    "Jumpeon":"450820",
    "Koga":"450688",
    "Psyduck":"450725",
    "Golduck":"450726",
    "Growlithe":"450727",
    "Arcanine":"450728",
    "Slowpoke":"450754",
    "Slowbro":"450755",
    "Seel":"450756",
    "Dewgong":"450757",
    "Grimer":"450758",
    "Muk":"450759",
    "Voltorb":"450778",
    "Electrode":"450779",
    "Koffing":"450780",
    "Weezing":"450781",
    "Jynx":"450798",
    "Electabuzz":"450799",
    "Magmar":"450800",
    "Ditto":"450810",
    "The Mt. Moon Fossil":"450811",
    "The Mt. Moon Evolution":"450812",
    "Aerodactyl":"450813",
    "Zapdos":"450821",
    "Meltan":"450822",
    "Melmetal":"450823",
    "Misty":"450689",
    "Lt. Surge":"450690",
    "Squirtle":"450705",
    "Wartortle":"450706",
    "Blastoise":"450707",
    "Erika":"450691",
    "Articuno":"450824",
    "Sabrina and Blaine - Part 1":"450692",
    "Sabrina and Blaine - Part 2":"450693",
    "Oboma":"450694",
    "The Other Hitmon":"450782",
    "Moltres":"450825",
    "Pokemon League":"450771",
    "The Other Fossil":"450814",
    "The Other Evolution":"450815",
    "Baracktwo":"450826",
    "Mew":"450827",
    "Tentaquil":"450828"
}

point_lookup = {
    "Bulbasaur":1,
    "Ivysaur":2,
    "Venusaur":3,
    "Charmander":1,
    "Charmeleon":2,
    "Charizard":3,
    "Squirtle":1,
    "Wartortle":2,
    "Blastoise":3,
    "Caterpie":1,
    "Metapod":2,
    "Butterfree":3,
    "Weedle":1,
    "Kakuna":2,
    "Beedrill":3,
    "Pidgey":1,
    "Pidgeotto":2,
    "Pidgeot":3,
    "Rattata":1,
    "Raticate":2,
    "Spearow":1,
    "Fearow":2,
    "Ekans":1,
    "Arbok":2,
    "Pikachu":1,
    "Raichu":2,
    "Sandshrew":1,
    "Sandslash":2,
    "Nidoran♀":1,
    "Nidorina":2,
    "Nidoqueen":3,
    "Nidoran♂":1,
    "Nidorino":2,
    "Nidoking":3,
    "Clefairy":1,
    "Clefable":2,
    "Vulpix":1,
    "Ninetales":2,
    "Jigglypuff":1,
    "Wigglytuff":2,
    "Zubat":1,
    "Golbat":2,
    "Oddish":1,
    "Gloom":2,
    "Vileplume":3,
    "Paras":1,
    "Parasect":2,
    "Venonat":1,
    "Venomoth":2,
    "Diglett":1,
    "Dugtrio":2,
    "Meowth":1,
    "Persian":2,
    "Psyduck":1,
    "Golduck":2,
    "Mankey":1,
    "Primeape":2,
    "Growlithe":1,
    "Arcanine":2,
    "Poliwag":1,
    "Poliwhirl":2,
    "Poliwrath":3,
    "Abra":1,
    "Kadabra":2,
    "Alakazam":3,
    "Machop":1,
    "Machoke":2,
    "Machamp":3,
    "Bellsprout":1,
    "Weepinbell":2,
    "Victreebel":3,
    "Tentacool":1,
    "Tentacruel":2,
    "Geodude":1,
    "Graveler":2,
    "Golem":3,
    "Ponyta":1,
    "Rapidash":2,
    "Slowpoke":1,
    "Slowbro":2,
    "Magnemite":1,
    "Magneton":2,
    "Farfetch'd":1,
    "Doduo":1,
    "Dodrio":2,
    "Seel":1,
    "Dewgong":2,
    "Grimer":1,
    "Muk":2,
    "Shellder":1,
    "Cloyster":2,
    "Gastly":1,
    "Haunter":2,
    "Gengar":3,
    "Onix":1,
    "Drowzee":1,
    "Hypno":2,
    "Krabby":1,
    "Kingler":2,
    "Voltorb":1,
    "Electrode":2,
    "Exeggcute":1,
    "Exeggutor":2,
    "Cubone":1,
    "Marowak":2,
    "Hitmonlee":1,
    "Hitmonchan":1,
    "Lickitung":1,
    "Koffing":1,
    "Weezing":2,
    "Rhyhorn":1,
    "Rhydon":2,
    "Chansey":1,
    "Tangela":1,
    "Kangaskhan":1,
    "Horsea":1,
    "Seadra":2,
    "Goldeen":1,
    "Seaking":2,
    "Staryu":1,
    "Starmie":2,
    "Mr. Mime":1,
    "Scyther":1,
    "Jynx":1,
    "Electabuzz":1,
    "Magmar":1,
    "Pinsir":1,
    "Tauros":1,
    "Magikarp":1,
    "Gyarados":2,
    "Lapras":1,
    "Ditto":1,
    "Eevee":1,
    "Vaporeon":2,
    "Jolteon":2,
    "Flareon":2,
    "Porygon":1,
    "Omanyte":1,
    "Omastar":2,
    "Kabuto":1,
    "Kabutops":2,
    "Aerodactyl":1,
    "Snorlax":1,
    "Articuno":5,
    "Zapdos":5,
    "Moltres":5,
    "Dratini":1,
    "Dragonair":2,
    "Dragonite":3,
    "Baracktwo":5,
    "Mew":5,
    "Meltan":2,
    "Melmetal":3,
    "Blobbos":1,
    "Jumpeon":2,
    "Tentaquil":3
}

moon_evos = [
    "Nidoqueen",
    "Nidoking",
    "Clefable",
    "Wigglytuff"
]

// Starter: Blobbos
// Route 1: Pidgey, Rattata, Oddish, Bellsprout
// Route 22: Nidoran♂, Nidoran♀, Mankey, Spearow
// Viridian Forest: Caterpie, Weedle, Pikachu
zero_badges = [
    "Blobbos",
    "Caterpie",
    "Metapod",
    "Butterfree",
    "Weedle",
    "Kakuna",
    "Beedrill",
    "Pidgey",
    "Pidgeotto",
    "Pidgeot",
    "Rattata",
    "Raticate",
    "Spearow",
    "Fearow",
    "Pikachu",
    "Nidoran♀",
    "Nidorina",
    "Nidoran♂",
    "Nidorino",
    "Oddish",
    "Gloom",
    "Mankey",
    "Primeape",
    "Bellsprout",
    "Weepinbell"
]

// Route 3: Sandshrew
// Route 4: Ekans
// Mt. Moon: Zubat, Geodude, Clefairy, Paras, Moon Stone x2
// Cerulean City: Bulbasaur
// Route 24: Charmander, Venonat
// Route 5: Meowth, Abra, Jigglypuff
// Route 11: Drowzee
// Diglett Cave: Diglett
// Route 2: Mr. Mime? (trade), Moon Stone x1?
// Saffron City: Hitmonchan or Hitmonlee
// Route 6: N/A
// Route 7: Vulpix
// Celadon City: Vulpix, Porygon, Moon Stone x1, Evo Stones
// Lavender Town: Ghastly, Cubone, Snorlax
// Rock Tunnel: Machop, Onix
// Route 9: N/A
// Route 10: Magnemite
// Route 12: Farfetch'd
// Route 13: N/A
// Route 14: N/A
// Route 15:N/A
// Route 17: Doduo, Ponyta, Eevee
// Route 18: Lickitung
// Fuchsia City: 
// Safari Zone: Exeggcute, Tauros, Chansey, Scyther, Rhyhorn, Kangaskhan, Pinsir, Tangela
// Moon Stones: Wigglytuff, Clefable, Nidoking, Nidoqueen
// Evo Stones: Raichu, Vileplume, Victreebel, Ninetales
// Old Rod: 
// Good Rod: Goldeen, Poliwag
// Super Rod: Staryu, Tentacool, Horsea, Magikarp, Krabby, Shellder, Dratini
one_badge_p1 = [
    "Bulbasaur",
    "Ivysaur",
    "Venusaur",
    "Charmander",
    "Charmeleon",
    "Charizard",
    "Ekans",
    "Arbok",
    "Raichu",
    "Sandshrew",
    "Sandslash",
    "Clefairy",
    "Vulpix",
    "Ninetales",
    "Jigglypuff",
    "Zubat",
    "Golbat",
    "Vileplume",
    "Paras",
    "Parasect",
    "Venonat",
    "Venomoth",
    "Diglett",
    "Dugtrio",
    "Meowth",
    "Persian",
    "Poliwag",
    "Poliwhirl",
    "Poliwrath",
    "Abra",
    "Kadabra",
    "Alakazam",
    "Machop",
    "Machoke",
    "Machamp",
    "Victreebel",
    "Tentacool",
    "Tentacruel",
    "Geodude",
    "Graveler",
    "Golem",
    "Ponyta",
    "Rapidash",
    "Magnemite",
    "Magneton",
    "Doduo",
    "Dodrio",
    "Shellder",
    "Cloyster",
    "Gastly",
    "Haunter",
    "Gengar",
    "Onix",
    "Drowzee",
    "Hypno",
    "Krabby",
    "Kingler",
    "Exeggcute",
    "Exeggutor",
    "Cubone",
    "Marowak"
]
one_badge_p2 = [
    "Lickitung",
    "Rhyhorn",
    "Rhydon",
    "Chansey",
    "Tangela",
    "Kangaskhan",
    "Horsea",
    "Seadra",
    "Goldeen",
    "Seaking",
    "Staryu",
    "Starmie",
    "Mr. Mime",
    "Scyther",
    "Pinsir",
    "Tauros",
    "Magikarp",
    "Gyarados",
    "Lapras",
    "Eevee",
    "Vaporeon",
    "Jolteon",
    "Flareon",
    "Porygon",
    "Snorlax",
    "Dratini",
    "Dragonair",
    "Dragonite",
    "Jumpeon"
]

two_badges_p1 = [
    "Psyduck",
    "Golduck",
    "Growlithe",
    "Arcanine",
    "Slowpoke",
    "Slowbro",
    "Seel",
    "Dewgong",
    "Grimer",
    "Muk",
    "Voltorb",
    "Electrode",
    "Koffing",
    "Weezing",
    "Jynx",
    "Electabuzz",
    "Magmar",
    "Ditto"
]

two_badges_p2 = [
    "Zapdos",
    "Meltan",
    "Melmetal"
]

// Vermilion City: Squirtle
three_badges = [
    "Squirtle",
    "Wartortle",
    "Blastoise"
]

four_badges = [
    "Farfetch'd",
    "Aerodactyl"
]

five_badges = [
    "Articuno"
]

eight_badges = [
    "Moltres"
]

post_game = [
    "Baracktwo",
    "Mew",
    "Tentaquil"
]

function get_caught_count() {
    return bitcount(pokedex_start)
    + bitcount(pokedex_start + 1)
    + bitcount(pokedex_start + 2)
    + bitcount(pokedex_start + 3)
    + bitcount(pokedex_start + 4)
    + bitcount(pokedex_start + 5)
    + bitcount(pokedex_start + 6)
    + bitcount(pokedex_start + 7)
    + bitcount(pokedex_start + 8)
    + bitcount(pokedex_start + 9)
    + bitcount(pokedex_start + 10)
    + bitcount(pokedex_start + 11)
    + bitcount(pokedex_start + 12)
    + bitcount(pokedex_start + 13)
    + bitcount(pokedex_start + 14)
    + bitcount(pokedex_start + 15)
    + bitcount(pokedex_start + 16)
    + bitcount(pokedex_start + 17)
    + bitcount(pokedex_start + 18)
    + bit0(pokedex_start + 19)
    + bit1(pokedex_start + 19)
    + bit2(pokedex_start + 19)
    + bit3(pokedex_start + 19)
}

function get_badge_count() => bitcount(0xd356)

function no_badges_obtained() => bitcount(0xd356) == 0

function one_badge_obtained() => bitcount(0xd356) == 1

function two_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 0
    && bit2(0xd356) == 0
    && bit3(0xd356) == 0
    && bit4(0xd356) == 1
    && bit5(0xd356) == 0
    && bit6(0xd356) == 0
    && bit7(0xd356) == 0
}

function three_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 0
    && bit2(0xd356) == 1
    && bit3(0xd356) == 0
    && bit4(0xd356) == 1
    && bit5(0xd356) == 0
    && bit6(0xd356) == 0
    && bit7(0xd356) == 0
}

function four_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 1
    && bit2(0xd356) == 1
    && bit3(0xd356) == 0
    && bit4(0xd356) == 1
    && bit5(0xd356) == 0
    && bit6(0xd356) == 0
    && bit7(0xd356) == 0
}

function five_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 1
    && bit2(0xd356) == 1
    && bit3(0xd356) == 1
    && bit4(0xd356) == 1
    && bit5(0xd356) == 0
    && bit6(0xd356) == 0
    && bit7(0xd356) == 0
}

function six_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 1
    && bit2(0xd356) == 1
    && bit3(0xd356) == 1
    && bit4(0xd356) == 1
    && bit5(0xd356) + bit6(0xd356) == 1
    && bit7(0xd356) == 0
}

function seven_badges_obtained() {
    return bit0(0xd356) == 1
    && bit1(0xd356) == 1
    && bit2(0xd356) == 1
    && bit3(0xd356) == 1
    && bit4(0xd356) == 1
    && bit5(0xd356) + bit6(0xd356) == 2
    && bit7(0xd356) == 0
}

function eight_badges_obtained() => bitcount(0xd356) == 8

function first_gym_beat() {
    return prev(bitcount(0xd356)) == 0
    && bitcount(0xd356) == 1
}

function second_gym_beat() {
    return prev(bitcount(0xd356)) == 1
    && two_badges_obtained()
}

function third_gym_beat() {
    return prev(bitcount(0xd356)) == 2
    && three_badges_obtained()
}

function fourth_gym_beat() {
    return prev(bitcount(0xd356)) == 3
    && four_badges_obtained()
}

function fifth_gym_beat() {
    return prev(bitcount(0xd356)) == 4
    && five_badges_obtained()
}

function sixth_gym_beat() {
    return prev(bitcount(0xd356)) == 5
    && six_badges_obtained()
}

function seventh_gym_beat() {
    return prev(bitcount(0xd356)) == 6
    && seven_badges_obtained()
}

function eighth_gym_beat() {
    return prev(bitcount(0xd356)) == 7
    && eight_badges_obtained()
}

function elite_four_beat() {
    return prev(byte(0xd35e)) == 0x78
    && byte(0xd35e) == 0x76
}


function in_pokedex(p) => pokedex_lookup[p] == 1
function not_in_pokedex(p) => pokedex_lookup[p] == 0

function all_caught(list) {
    all_of(list, in_pokedex)
}

function none_caught(list) {
    all_of(list, not_in_pokedex)
}

function hitmon_obtained() {
    return pokedex_lookup["Hitmonchan"] + pokedex_lookup["Hitmonlee"]
}

function fossil_stage1_obtained() {
    return pokedex_lookup["Omanyte"] + pokedex_lookup["Kabuto"]
}

function fossil_stage2_obtained() {
    return pokedex_lookup["Omastar"] + pokedex_lookup["Kabutops"]
}

function moon_evo_obtained() {
    return pokedex_lookup["Nidoqueen"] + pokedex_lookup["Nidoking"] + pokedex_lookup["Clefable"] + pokedex_lookup["Wigglytuff"]
}

function ready_for_first_badge() {
    return all_caught(zero_badges)
    && none_caught(one_badge_p1)
    && none_caught(one_badge_p2)
    && none_caught(two_badges_p1)
    && none_caught(two_badges_p2)
    && none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 0
    && fossil_stage1_obtained() == 0
    && fossil_stage2_obtained() == 0
    && moon_evo_obtained() == 0
}

function ready_for_second_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && none_caught(two_badges_p1)
    && none_caught(two_badges_p2)
    && none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 0
    && fossil_stage2_obtained() == 0
    && moon_evo_obtained() == 3
}

function ready_for_third_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function ready_for_fourth_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function ready_for_fifth_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    && all_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function ready_for_67_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(four_badges)
    && all_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function ready_for_eighth_badge() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(four_badges)
    && all_caught(five_badges)
    && all_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 1
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function ready_for_elite_four() {
    return all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(four_badges)
    && all_caught(five_badges)
    && all_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 2
    && fossil_stage1_obtained() == 1
    && fossil_stage2_obtained() == 1
    && moon_evo_obtained() == 4
}

function pokemon_caught(p) {
    return byte(0xd35e) != 0
    && pokedex_lookup[p] > prev(pokedex_lookup[p])
}

function get_first_hitmon() {
    return prev(pokedex_lookup["Hitmonchan"]) + prev(pokedex_lookup["Hitmonlee"]) == 0
    && hitmon_obtained() == 1
}

function get_second_hitmon() {
    return prev(pokedex_lookup["Hitmonchan"]) + prev(pokedex_lookup["Hitmonlee"]) == 1
    && hitmon_obtained() == 2
}

function get_first_stage1_fossil() {
    return prev(pokedex_lookup["Omanyte"]) + prev(pokedex_lookup["Kabuto"]) == 0
    && fossil_stage1_obtained() == 1
}

function get_second_stage1_fossil() {
    return prev(pokedex_lookup["Omanyte"]) + prev(pokedex_lookup["Kabuto"]) == 1
    && fossil_stage1_obtained() == 2
}

function get_first_stage2_fossil() {
    return prev(pokedex_lookup["Omastar"]) + prev(pokedex_lookup["Kabutops"]) == 0
    && fossil_stage2_obtained() == 1
}

function get_second_stage2_fossil() {
    return prev(pokedex_lookup["Omastar"]) + prev(pokedex_lookup["Kabutops"]) == 1
    && fossil_stage2_obtained() == 2
}

function get_first_moon_evo() {
    return prev(pokedex_lookup["Nidoqueen"]) + prev(pokedex_lookup["Nidoking"]) + prev(pokedex_lookup["Clefable"]) + prev(pokedex_lookup["Wigglytuff"]) == 0
    && moon_evo_obtained() == 1
}

function get_second_moon_evo() {
    return prev(pokedex_lookup["Nidoqueen"]) + prev(pokedex_lookup["Nidoking"]) + prev(pokedex_lookup["Clefable"]) + prev(pokedex_lookup["Wigglytuff"]) == 1
    && moon_evo_obtained() == 2
}

function get_third_moon_evo() {
    return prev(pokedex_lookup["Nidoqueen"]) + prev(pokedex_lookup["Nidoking"]) + prev(pokedex_lookup["Clefable"]) + prev(pokedex_lookup["Wigglytuff"]) == 2
    && moon_evo_obtained() == 3
}

function get_fourth_moon_evo() {
    return prev(pokedex_lookup["Nidoqueen"]) + prev(pokedex_lookup["Nidoking"]) + prev(pokedex_lookup["Clefable"]) + prev(pokedex_lookup["Wigglytuff"]) == 3
    && moon_evo_obtained() == 4
}

function good_to_catch_0b_pokemon() {
    return no_badges_obtained()
    //&& none_caught(zero_badges)
    && none_caught(one_badge_p1)
    && none_caught(one_badge_p2)
    && none_caught(two_badges_p1)
    && none_caught(two_badges_p2)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() == 0
    && fossil_stage1_obtained() == 0
    && fossil_stage2_obtained() == 0
    && moon_evo_obtained() == 0
}

function good_to_catch_1b_pokemon() {
    return one_badge_obtained()
    && all_caught(zero_badges)
    //&& none_caught(one_badge_p1)
    //&& none_caught(one_badge_p2)
    && none_caught(two_badges_p1)
    && none_caught(two_badges_p2)
    && none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() <= 1
    && fossil_stage1_obtained() == 0
    && fossil_stage2_obtained() == 0
    && moon_evo_obtained() <= 3
}

function good_to_catch_2b_pokemon() {
    return two_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    //&& none_caught(two_badges_p1)
    //&& none_caught(two_badges_p2)
    && none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() <= 1
    && fossil_stage1_obtained() <= 1
    && fossil_stage2_obtained() <= 1
    && moon_evo_obtained() >= 3
}

function good_to_catch_3b_pokemon() {
    return three_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    //&& none_caught(three_badges)
    && none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() <= 1
    && fossil_stage1_obtained() <= 1
    && fossil_stage2_obtained() <= 1
    && moon_evo_obtained() == 4
}

function good_to_catch_4b_pokemon() {
    return four_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    //&& none_caught(four_badges)
    && none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() <= 1
    && fossil_stage1_obtained() <= 1
    && fossil_stage2_obtained() <= 1
    && moon_evo_obtained() == 4
}

function good_to_catch_5b_pokemon() {
    return five_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    && all_caught(four_badges)
    //&& none_caught(five_badges)
    && none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() <= 1
    && fossil_stage1_obtained() <= 1
    && fossil_stage2_obtained() <= 1
    && moon_evo_obtained() == 4
}

function good_to_catch_8b_pokemon() {
    return eight_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    && all_caught(four_badges)
    && all_caught(five_badges)
    //&& none_caught(eight_badges)
    && none_caught(post_game)
    && hitmon_obtained() >= 1
    && fossil_stage1_obtained() <= 1
    && fossil_stage2_obtained() <= 1
    && moon_evo_obtained() == 4
}

function good_to_catch_postgame_pokemon() {
    return eight_badges_obtained()
    && all_caught(zero_badges)
    && all_caught(one_badge_p1)
    && all_caught(one_badge_p2)
    && all_caught(two_badges_p1)
    && all_caught(two_badges_p2)
    && all_caught(three_badges)
    && all_caught(four_badges)
    && all_caught(five_badges)
    && all_caught(eight_badges)
    //&& none_caught(post_game)
    && hitmon_obtained() == 2
    && fossil_stage1_obtained() >= 1
    && fossil_stage2_obtained() >= 1
    && moon_evo_obtained() == 4
}

// ----------------------
// Zero Badges: The grind
// ----------------------

for p in zero_badges {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_0b_pokemon() && pokemon_caught(p)
    )
}

// Don't Eat That Bagel, Child

// ----------------------------------
// One Badge: One water bottle's mess
// ----------------------------------

achievement(
    badge = badge_lookup["Brock"],
    title = "Brock",
    description = "Obtain the Boulder Badge with all 25 possible Pokemon!",
    points = 10,
    trigger = ready_for_first_badge() && trigger_when(first_gym_beat())
)

for p in one_badge_p1 {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_1b_pokemon() && pokemon_caught(p)
    )
}

// Hitmonchan or Hitmonlee
achievement(
    badge = badge_lookup["The First Hitmon"],
    title = "The First Hitmon",
    description = "Register Hitmonchan or Hitmonlee as caught in your Pokedex!",
    points = 1,
    trigger = good_to_catch_1b_pokemon() && get_first_hitmon()
)

for p in one_badge_p2 {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_1b_pokemon() && pokemon_caught(p)
    )
}

achievement(
    badge = badge_lookup["The First Moon Evo"],
    title = "The First Moon Evo",
    description = "Register Nidoqueen, Nidoking, Clefable or Wigglytuff as caught in your Pokedex!",
    points = 3,
    trigger = good_to_catch_1b_pokemon() && get_first_moon_evo()
)

achievement(
    badge = badge_lookup["The Second Moon Evo"],
    title = "The Second Moon Evo",
    description = "Register Nidoqueen, Nidoking, Clefable or Wigglytuff as caught in your Pokedex!",
    points = 3,
    trigger = good_to_catch_1b_pokemon() && get_second_moon_evo()
)

achievement(
    badge = badge_lookup["The Third Moon Evo"],
    title = "The Third Moon Evo",
    description = "Register Nidoqueen, Nidoking, Clefable or Wigglytuff as caught in your Pokedex!",
    points = 2,
    trigger = good_to_catch_1b_pokemon() && get_third_moon_evo()
)

// ------------------------------------
// Two Badges: Koga: You now have Surf!
// ------------------------------------

achievement(
    badge = badge_lookup["Koga"],
    title = "Koga",
    description = "Obtain the Soul Badge with all 119 possible Pokemon!",
    points = 10,
    trigger = ready_for_second_badge() && trigger_when(second_gym_beat())
)

for p in two_badges_p1 {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_2b_pokemon() && pokemon_caught(p)
    )
}

// Omanyte or Kabuto
achievement(
    badge = badge_lookup["The Mt. Moon Fossil"],
    title = "The Mt. Moon Fossil",
    description = "Register Omanyte or Kabuto as caught in your Pokedex!",
    points = 1,
    trigger = good_to_catch_2b_pokemon() && get_first_stage1_fossil()
)

// Omastar or Kabutops
achievement(
    badge = badge_lookup["The Mt. Moon Evolution"],
    title = "The Mt. Moon Evolution",
    description = "Register Omastar or Kabutops as caught in your Pokedex!",
    points = 2,
    trigger = good_to_catch_2b_pokemon() && get_first_stage2_fossil()
)

for p in two_badges_p2 {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_2b_pokemon() && pokemon_caught(p)
    )
}

achievement(
    badge = badge_lookup["The Final Moon Evo"],
    title = "The Final Moon Evo",
    description = "Register Nidoqueen, Nidoking, Clefable or Wigglytuff as caught in your Pokedex!",
    points = 2,
    trigger = good_to_catch_2b_pokemon() && get_fourth_moon_evo()
)

// -------------------------------------
// Four Badges: Surge: You now have Fly!
// -------------------------------------
achievement(
    badge = badge_lookup["Lt. Surge"],
    title = "Lt. Surge",
    description = "Obtain the Thunder Badge with all 143 possible Pokemon!",
    points = 10,
    trigger = ready_for_third_badge() && trigger_when(third_gym_beat())
)

for p in three_badges {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_3b_pokemon() && pokemon_caught(p)
    )
}

// --------------------------------------
// Four Badges: Misty: You now have Cut!
// --------------------------------------

achievement(
    badge = badge_lookup["Misty"],
    title = "Misty",
    description = "Obtain the Cascade Badge with all 146 possible Pokemon!",
    points = 10,
    trigger = ready_for_fourth_badge() && trigger_when(fourth_gym_beat())
)

for p in four_badges {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_4b_pokemon() && pokemon_caught(p)
    )
}

// ------------------------------------------
// Five Badges: Erika: You now have Strength!
// ------------------------------------------

achievement(
    badge = badge_lookup["Erika"],
    title = "Erika",
    description = "Obtain the Rainbow Badge with all 148 possible Pokemon!",
    points = 10,
    trigger = ready_for_fifth_badge() && trigger_when(fifth_gym_beat())
)

for p in five_badges {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_5b_pokemon() && pokemon_caught(p)
    )
}

// ---------------------------------------
// Five Badges: Misty or Sabrina or Blaine
// ---------------------------------------
achievement(
    badge = badge_lookup["Sabrina and Blaine - Part 1"],
    title = "Sabrina and Blaine - Part 1",
    description = "Obtain the Marsh or Volcano Badge with all 149 possible Pokemon!",
    points = 10,
    trigger = ready_for_67_badge() && trigger_when(sixth_gym_beat())
)

// --------------------------------------
// Six Badges: Misty or Sabrina or Blaine
// --------------------------------------
achievement(
    badge = badge_lookup["Sabrina and Blaine - Part 2"],
    title = "Sabrina and Blaine - Part 2",
    description = "Obtain the Marsh or Volcano Badge with all 149 possible Pokemon!",
    points = 10,
    trigger = ready_for_67_badge() && trigger_when(seventh_gym_beat())
)

// -------------------
// Eight Badges: Oboma
// -------------------
achievement(
    badge = badge_lookup["Oboma"],
    title = "Oboma",
    description = "Obtain the Change Badge with all 149 possible Pokemon!",
    points = 10,
    trigger = ready_for_eighth_badge() && trigger_when(eighth_gym_beat())
)

// Hitmonchan or Hitmonlee
achievement(
    badge = badge_lookup["The Other Hitmon"],
    title = "The Other Hitmon",
    description = "Register Hitmonchan or Hitmonlee as caught in your Pokedex!",
    points = 1,
    trigger = good_to_catch_8b_pokemon() && get_second_hitmon()
)

for p in eight_badges {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_8b_pokemon() && pokemon_caught(p)
    )
}

// ----------
// Elite Four
// ----------

achievement(
    badge = badge_lookup["Pokemon League"],
    title = "Pokemon League",
    description = "Defeat the Elite Four and Champion with all 151 possible Pokemon!",
    points = 25,
    trigger = ready_for_elite_four() && trigger_when(elite_four_beat())
)

// ---------
// Post-Game
// ---------

// Omanyte or Kabuto
achievement(
    badge = badge_lookup["The Other Fossil"],
    title = "The Other Fossil",
    description = "Register Omanyte or Kabuto as caught in your Pokedex!",
    points = 1,
    trigger = good_to_catch_postgame_pokemon() && get_second_stage1_fossil()
)

// Omastar or Kabutops
achievement(
    badge = badge_lookup["The Other Evolution"],
    title = "The Other Evolution",
    description = "Register Omastar or Kabutops as caught in your Pokedex!",
    points = 2,
    trigger = good_to_catch_postgame_pokemon() && get_second_stage2_fossil()
)

for p in post_game {
    achievement(
        badge = badge_lookup[p],
        title = p,
        description = format("Register {0} as caught in your Pokedex!", p),
        points = point_lookup[p],
        trigger = good_to_catch_postgame_pokemon() && pokemon_caught(p)
    )
}

rich_presence_conditional_display(byte(0xd35e) == 0, "At the title screen")

rich_presence_display(
    "Taking on Professor Oak's Challenge with {0}/8 badges and {1}/156 Pokemon caught",
    rich_presence_value("Badges", get_badge_count()),
    rich_presence_value("Caught", get_caught_count())
)
