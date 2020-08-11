
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 275 + 31 + 16,
  sp = 505 + 76 + 40,
  crit = 5,
  hit = 9,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  322  621    5    9    0

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 7, sp = 34),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 13, sp = 27, hit = 2),
  wrist = list(int = 12, sp = 21, hit = 1),
  hands = list(int = 12, sp = 43),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 6, sp = 33),
  finger2 = list(int = 12, sp = 21, hit = 1),
  trinket1 = "toep",
  trinket2 = list(sp = 29, hit = 2),
  weapon = list(int = 29, sp = 84, crit = 2),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Mana Igniting Cord" =
    list(waist = list(int = 16, sp = 25, crit = 1)),
  "MC Mana Igniting Cord (Set)" = list(
    waist = list(int = 16, sp = 25, crit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWL Mantle of the Blackwing Cabal (Set)" = list(
    shoulders = list(int = 16, sp = 34),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "BWL Mish'undare, Circlet of the Mind Flayer" =
    list(head = list(int = 24, sp = 35, crit = 2)),
  "BWL Mish'undare, Circlet of the Mind (Set)" = list(
    head = list(int = 24, sp = 35, crit = 2),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "ZG The Hexxer's Cover" =
    list(head = list(int = 10, sp = 41)),
  "ZG The Hexxer's Cover (Set)" = list(
    head = list(int = 10, sp = 41),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "AQ Ring of Unspoken Names" =
    list(finger1 = list(sp = 14, crit = 1, hit = 1)),
  "AQ Dustwind Turban" =
    list(head = list(int = 29, sp = 31, crit = 1)),
  "AQ Dustwind Turban (Set)" = list(
    head = list(int = 29, sp = 31, crit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "AQ Blessed Quiraji Acolyte Staff" =
    list(weapon = list(int = 33, sp = 76, crit = 1, hit = 2)),
  "AQ Wand of Quiraji Nobility" =
    list(wand = list(sp = 19)),
  "AQ Amulet of Vek'nilash" =
    list(neck = list(int = 5, sp = 27, crit = 1)),
  "AQ Cloak of the Devoured" =
    list(back = list(int = 10, sp = 30, hit = 1)),
  "AQ Eyestalk Waist Cord" =
    list(waist = list(int = 9, sp = 41, crit = 1)),
  "AQ Eyestalk Waist Cord (Set)" = list(
    waist = list(int = 9, sp = 41, crit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "AQ Dark Storm Gauntlets" =
    list(hands = list(int = 15, sp = 37, hit = 1)),
  "AQ Ring of the Fallen God" =
    list(finger1 = list(int = 6, sp = 37, hit = 1)),
  "AQ Ritssyn's Ring of Chaos" =
    list(finger1 = list(sp = 25, crit = 1)),
  "AQ Sharpened Silithid Femur + Jin'do's Bag" =
    list(weapon = list(int = 7 + 11, sp = 72 + 18, crit = 1, hit = 1)),
  "AQ Sharpened Silithid Femur + Royal Scepter" =
    list(weapon = list(int = 7 + 9, sp = 72 + 20, crit = 1 + 1, hit = 1)),
  "Doomcaller's Circlet" =
    list(head = list(int = 24, sp = 33, crit = 1, hit = 1)),
  "Doomcaller's Circlet (Set)" = list(
    head = list(int = 24, sp = 33, crit = 1, hit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "Doomcaller's Mantle" =
    list(shoulders = list(int = 11, sp = 28, hit = 1)),
  "Doomcaller's Mantle (Set)" = list(
    shoulders = list(int = 11, sp = 28, hit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  )
)

my_bank <- list(
  "Bloodtinged Gloves" =
    list(hands = list(int = 10, sp = 19, hit = 1)),
  "Zandalarian Hero Charm" =
    list(trinket1 = "zhc"),
  "Briarwood Reed" =
    list(trinket1 = list(sp = 29)),
  "Nemesis Gloves" =
    list(hands = list(int = 15, sp = 15, crit = 1)),
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Royal Seal of Eldre'Thalas" =
    list(trinket1 = list(sp = 23)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2))
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats, trinkets = "toep")
}

w <- max(nchar(names(c(my_changes, my_bank))))
show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  df <- df[order(-df$dps), ]
  row.names(df) <- format(row.names(df), width = w)
  df[c("dps", "diff")] <- lapply(df[c("dps", "diff")], round, digits = 2)
  df
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3742202  1.0000000 13.7117864 12.3276271  0.3052320
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3315286  1.0000000 11.4317204 12.2146605  0.3138210

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 552.21 16.34            head
#> Doomcaller's Circlet                        550.47 14.60            head
#> BWL Mish'undare, Circlet of the Mind (Set)  545.04  9.17      head/hands
#> AQ Dustwind Turban                          544.33  8.47            head
#> AQ Eyestalk Waist Cord                      543.98  8.12           waist
#> Doomcaller's Mantle                         543.82  7.95       shoulders
#> AQ Ring of the Fallen God                   543.79  7.92         finger1
#> Doomcaller's Circlet (Set)                  543.33  7.46      head/hands
#> AQ Sharpened Silithid Femur + Royal Scepter 543.27  7.40          weapon
#> BWL Mantle of the Blackwing Cabal           541.89  6.02       shoulders
#> AQ Cloak of the Devoured                    539.32  3.46            back
#> AQ Dark Storm Gauntlets                     539.32  3.45           hands
#> ZG The Hexxer's Cover                       539.18  3.32            head
#> AQ Amulet of Vek'nilash                     538.68  2.81            neck
#> AQ Ring of Unspoken Names                   537.63  1.77         finger1
#> AQ Blessed Quiraji Acolyte Staff            537.51  1.64          weapon
#> AQ Ritssyn's Ring of Chaos                  537.41  1.54         finger1
#> AQ Dustwind Turban (Set)                    537.36  1.49      head/hands
#> MC Mana Igniting Cord                       537.35  1.49           waist
#> AQ Eyestalk Waist Cord (Set)                537.32  1.45     waist/hands
#> Doomcaller's Mantle (Set)                   536.91  1.04 shoulders/hands
#> AQ Wand of Quiraji Nobility                 536.46  0.59            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  535.90  0.03          weapon
#> current                                     535.87  0.00            <NA>
#> BWL Mantle of the Blackwing Cabal (Set)     535.23 -0.64 shoulders/hands
#> ZG The Hexxer's Cover (Set)                 532.45 -3.42      head/hands
#> MC Mana Igniting Cord (Set)                 530.44 -5.43     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     535.87  0.00     <NA>
#> Zandalarian Hero Charm                      535.45 -0.42 trinket1
#> Briarwood Reed                              535.00 -0.87 trinket1
#> Eye of the Beast                            533.59 -2.28 trinket1
#> Royal Seal of Eldre'Thalas                  532.06 -3.81 trinket1
#> Band of Servitude                           531.40 -4.47  finger1
#> Bloodtinged Gloves                          529.33 -6.54    hands
#> Nemesis Gloves                              529.07 -6.80    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     601.03  0.00     <NA>
#> Zandalarian Hero Charm                      600.55 -0.48 trinket1
#> Briarwood Reed                              600.05 -0.98 trinket1
#> Royal Seal of Eldre'Thalas                  596.75 -4.27 trinket1
#> Eye of the Beast                            596.15 -4.88 trinket1
#> Band of Servitude                           595.94 -5.08  finger1
#> Bloodtinged Gloves                          593.74 -7.29    hands
#> Nemesis Gloves                              592.21 -8.82    hands
```
