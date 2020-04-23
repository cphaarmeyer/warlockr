
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 238 + 31 + 16,
  sp = 454 + 33 + 40,
  crit = 3,
  hit = 1
)
unlist(my_stats)
#>  int   sp crit  hit 
#>  285  527    3    1

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 6, sp = 23),
  chest = list(sp = 46),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 12, sp = 40 + 20, crit = 1),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Choker of the Fire Lord" = list(
    neck = list(int = 7, sp = 34)
  ),
  "MC Robe of Volatile Power" = list(
    chest = list(int = 15, sp = 23, crit = 2)
  ),
  "MC Mana Igniting Cord" = list(
    waist = list(int = 16, sp = 25, crit = 1)
  ),
  "MC Ring of Spell Power" = list(
    finger1 = list(sp = 33)
  ),
  "MC Talisman of Ephemeral Power" = list(
    trinket1 = "toep"
  ),
  "MC2 Talisman of Ephemeral Power" = list(
    trinket2 = "toep"
  ),
  "BWL Nemesis Bracers" = list(
    wrist = list(int = 11, sp = 15)
  ),
  "BWL Nemesis Boots" = list(
    feet = list(int = 17, sp = 23)
  ),
  "BWL Nemesis Robes" = list(
    chest = list(int = 16, sp = 32, crit = 1)
  ),
  "BWL Mantle of the Blackwing Cabal" = list(
    shoulders = list(int = 16, sp = 34)
  ),
  "BWL Bracers of Arcane Accuarcy" = list(
    wrist = list(int = 12, sp = 21, hit = 1)
  ),
  "BWL Band of Forced Concentration" = list(
    finger1 = list(int = 12, sp = 21, hit = 1)
  ),
  "BWL Ebony Flame Gloves" = list(
    hands = list(int = 12, sp = 43)
  ),
  "BWL Cloak of the Brood Lord" = list(
    back = list(int = 14, sp = 28)
  ),
  "BWL Neltharions's Tear" = list(
    trinket1 = list(sp = 44, hit = 2)
  ),
  "BWL2 Neltharions's Tear" = list(
    trinket2 = list(sp = 44, hit = 2)
  ),
  "BWL Mish'undare, Circlet of the Mind Flayer" = list(
    head = list(int = 24, sp = 35, crit = 2)
  ),
  "BWL Staff of the Shadow Flame" = list(
    weapon = list(int = 29, sp = 84, crit = 2)
  ),
  "BWL Master Dragonslayer's Orb" = list(
    weapon = list(int = 12 + 14, sp = 40 + 28, crit = 1)
  ),
  "BWL Claw of Chromaggus" = list(
    weapon = list(int = 17, sp = 64 + 20, mp5 = 4)
  ),
  "ZG Band of Servitube" = list(
    finger1 = list(int = 9, sp = 23)
  ),
  "ZG Zanzil's Seal" = list(
    finger1 = list(int = 10, sp = 11, hit = 1)
  ),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "ZG Jin'do's Bag of Whammies" = list(
    weapon = list(int = 12 + 11, sp = 40 + 18, crit = 1, hit = 1)
  ),
  "ZG The Hexxer's Cover" = list(
    head = list(int = 10, sp = 41)
  ),
  "ZG Cloak of Consumption" = list(
    back = list(int = 10, sp = 23, hit = 1)
  ),
  "ZG Bloodvine Vest" = list(
    chest = list(int = 13, sp = 27, hit = 2)
  ),
  "ZG Bloodvine Leggings" = list(
    legs = list(int = 6, sp = 37, hit = 1)
  ),
  "ZG Bloodvine Garb" = list(
    chest = list(int = 13, sp = 27, hit = 2),
    legs = list(int = 6, sp = 37, hit = 1),
    feet = list(int = 16, sp = 19, crit = 2, hit = 1)
  ),
  "ZG Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14 + 12)
  )
)

my_bank <- list(
  "Royal Seal of Eldre'Thalas" = list(
    trinket2 = list(sp = 23)
  ),
  "Kezan's Taint" = list(
    neck = list(int = 6, sp = 12)
  ),
  "Zanzil's Band" = list(
    finger1 = list(int = 13, hit = 1, mp5 = 4)
  ),
  "Felherat Robes" = list(
    chest = list(int = 20, sp = 13, hit = 1)
  ),
  "Felheart Bracers" = list(
    wrist = list(int = 11, sp = 13)
  ),
  "Felheart Slippers" = list(
    feet = list(int = 11, sp = 18)
  ),
  "Maleki's Footwraps" = list(
    feet = list(int = 9, sp = 27)
  ),
  "Felcloth Gloves" = list(
    hands = list(sp = 33)
  ),
  "Star of Mystaria" = list(
    neck = list(int = 9, hit = 1)
  ),
  "Eye of the Beast" = list(
    trinket1 = list(crit = 2)
  ),
  "2 Eye of the Beast" = list(
    trinket2 = list(crit = 2)
  )
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats)
}

show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  row.names(df) <- substr(row.names(df), 1, 30)
  df[order(-df$dps), ]
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3561401  1.0000000 12.4893905 11.3172166  0.3285343
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3187811  1.0000000 10.5023486 11.3021924  0.3369415

show_result(my_stats, my_changes)
#>                                     dps         diff            slot
#> BWL Staff of the Shadow Flame  448.2468 18.918896527          weapon
#> ZG Bloodvine Garb              447.1684 17.840479984 chest/legs/feet
#> BWL Neltharions's Tear         446.3198 16.991923307        trinket1
#> BWL2 Neltharions's Tear        445.2731 15.945237203        trinket2
#> BWL Mish'undare, Circlet of th 443.0777 13.749797906            head
#> BWL Bracers of Arcane Accuarcy 437.2631  7.935212675           wrist
#> BWL Band of Forced Concentrati 436.5446  7.216736575         finger1
#> ZG Jin'do's Bag of Whammies    435.2777  5.949843062          weapon
#> BWL Claw of Chromaggus         435.2272  5.899347586          weapon
#> MC Choker of the Fire Lord     435.1847  5.856791568            neck
#> BWL Ebony Flame Gloves         435.1740  5.846114072           hands
#> ZG Cloak of Consumption        435.0590  5.731119265            back
#> BWL Master Dragonslayer's Orb  434.9075  5.579588905          weapon
#> MC Ring of Spell Power         434.7434  5.415475601         finger1
#> BWL Mantle of the Blackwing Ca 434.5349  5.206962863       shoulders
#> ZG Bloodvine Vest              433.2247  3.896782160           chest
#> BWL Cloak of the Brood Lord    432.6925  3.364590151            back
#> MC Robe of Volatile Power      432.5835  3.255621919           chest
#> ZG The Hexxer's Cover          432.2564  2.928505013            head
#> ZG Bloodvine Leggings          431.9932  2.665347429            legs
#> MC Talisman of Ephemeral Power 431.9004  2.572550447        trinket1
#> ZG Kezan's Ustoppable Taint    431.9001  2.572244143            neck
#> ZG Zanzil's Seal               431.7932  2.465262448         finger1
#> ZG Band of Servitube           431.7784  2.450502815         finger1
#> ZG Zanzil's Concentration      431.5704  2.242514170 finger1/finger2
#> BWL Nemesis Robes              431.2457  1.917766820           chest
#> MC2 Talisman of Ephemeral Powe 430.8320  1.504130356        trinket2
#> MC Mana Igniting Cord          430.5762  1.248308494           waist
#> BWL Nemesis Bracers            429.3357  0.007813389           wrist
#> current                        429.3279  0.000000000            <NA>
#> BWL Nemesis Boots              426.0428 -3.285090599            feet

show_result(my_stats, my_bank)
#>                                 dps       diff     slot
#> current                    429.3279  0.0000000     <NA>
#> Felcloth Gloves            429.0597 -0.2681729    hands
#> Felheart Bracers           428.5191 -0.8087674    wrist
#> Zanzil's Band              427.9328 -1.3950779  finger1
#> Eye of the Beast           427.5672 -1.7607118 trinket1
#> 2 Eye of the Beast         426.4853 -2.8425800 trinket2
#> Maleki's Footwraps         426.4842 -2.8437091     feet
#> Star of Mystaria           425.7367 -3.5911861     neck
#> Royal Seal of Eldre'Thalas 425.5759 -3.7520356 trinket2
#> Kezan's Taint              425.5242 -3.8037144     neck
#> Felherat Robes             423.0196 -6.3082663    chest
#> Felheart Slippers          422.9357 -6.3921932     feet
show_result(my_stats_ony, my_bank)
#>                                 dps       diff     slot
#> Felcloth Gloves            485.0335  1.0595107    hands
#> current                    483.9740  0.0000000     <NA>
#> Felheart Bracers           483.0140 -0.9599971    wrist
#> Zanzil's Band              482.3011 -1.6729090  finger1
#> Maleki's Footwraps         480.8992 -3.0747707     feet
#> Eye of the Beast           480.0752 -3.8988180 trinket1
#> Star of Mystaria           479.7795 -4.1944768     neck
#> Royal Seal of Eldre'Thalas 479.7483 -4.2257173 trinket2
#> Kezan's Taint              479.5786 -4.3953259     neck
#> 2 Eye of the Beast         478.8604 -5.1135927 trinket2
#> Felheart Slippers          476.8404 -7.1336130     feet
#> Felherat Robes             476.4898 -7.4841533    chest
```
