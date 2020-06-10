
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 266 + 31 + 16,
  sp = 497 + 33 + 40,
  crit = 5,
  hit = 8,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  313  570    5    8    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 13, sp = 27, hit = 2),
  wrist = list(int = 12, sp = 21, hit = 1),
  hands = list(int = 10, sp = 19, hit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 6, sp = 33),
  finger2 = list(int = 12, sp = 21, hit = 1),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 29, sp = 84, crit = 2),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Choker of the Fire Lord" =
    list(neck = list(int = 7, sp = 34)),
  "MC Mana Igniting Cord" =
    list(waist = list(int = 16, sp = 25, crit = 1)),
  "MC Mana Igniting Cord (Set)" = list(
    waist = list(int = 16, sp = 25, crit = 1),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "MC Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "MC Talisman of Ephemeral Power 2" =
    list(trinket2 = "toep"),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWL Mantle of the Blackwing Cabal (Set)" = list(
    shoulders = list(int = 16, sp = 34),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
  "BWL Neltharions's Tear" =
    list(trinket1 = list(sp = 44, hit = 2)),
  "BWL Neltharions's Tear 2" =
    list(trinket2 = list(sp = 44, hit = 2)),
  "BWL Mish'undare, Circlet of the Mind Flayer" =
    list(head = list(int = 24, sp = 35, crit = 2)),
  "BWL Mish'undare, Circlet of the Mind (Set)" = list(
    head = list(int = 24, sp = 35, crit = 2),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "ZG Zanzil's Seal" =
    list(finger1 = list(int = 10, sp = 11, hit = 1)),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "ZG The Hexxer's Cover" =
    list(head = list(int = 10, sp = 41)),
  "ZG The Hexxer's Cover (Set)" = list(
    head = list(int = 10, sp = 41),
    hands = list(int = 15, sp = 15, crit = 1)
  )
)

my_bank <- list(
  "Nemesis Gloves" =
    list(hands = list(int = 15, sp = 15, crit = 1)),
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Demoniac's Threads" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 19, sp = 12 + 12)
  ),
  "Demoniac's Threads (Set)" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 19, sp = 12 + 12),
    hands = list(int = 15, sp = 15, crit = 1)
  ),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Soul Corrupter's Necklace" =
    list(neck = list(int = 16, hit = 1)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2)),
  "Eye of the Beast 2" =
    list(trinket2 = list(crit = 2))
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats, trinkets = "zhc")
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
#>  0.3678278  1.0000000 13.1209564 11.6588670  0.2779227
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3377767  1.0000000 10.9405169 11.5580653  0.2703077

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      522.09 18.71        trinket1
#> BWL Neltharions's Tear 2                    521.53 18.15        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 518.85 15.48            head
#> BWL Mish'undare, Circlet of the Mind (Set)  518.10 14.72      head/hands
#> MC Choker of the Fire Lord                  509.94  6.56            neck
#> BWL Ebony Flame Gloves                      509.58  6.20           hands
#> BWL Mantle of the Blackwing Cabal           509.24  5.86       shoulders
#> BWL Mantle of the Blackwing Cabal (Set)     508.87  5.49 shoulders/hands
#> ZG The Hexxer's Cover                       506.79  3.41            head
#> ZG The Hexxer's Cover (Set)                 506.20  2.82      head/hands
#> MC Mana Igniting Cord                       504.82  1.45           waist
#> MC Talisman of Ephemeral Power              504.40  1.02        trinket1
#> MC Mana Igniting Cord (Set)                 504.23  0.85     waist/hands
#> MC Talisman of Ephemeral Power 2            503.78  0.40        trinket2
#> current                                     503.38  0.00            <NA>
#> ZG Zanzil's Seal                            498.95 -4.43         finger1
#> ZG Zanzil's Concentration                   497.67 -5.71 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff                 slot
#> current                                     503.38  0.00                 <NA>
#> Nemesis Gloves                              502.83 -0.55                hands
#> Felcloth Gloves                             502.76 -0.62                hands
#> Demoniac's Threads                          502.09 -1.29       neck/shoulders
#> Eye of the Beast                            501.58 -1.80             trinket1
#> Demoniac's Threads (Set)                    501.43 -1.95 neck/shoulders/hands
#> Eye of the Beast 2                          500.95 -2.43             trinket2
#> Soul Corrupter's Necklace                   500.80 -2.58                 neck
#> Royal Seal of Eldre'Thalas                  499.92 -3.46             trinket2
#> Band of Servitude                           499.02 -4.36              finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff                 slot
#> current                                     564.67  0.00                 <NA>
#> Felcloth Gloves                             564.22 -0.46                hands
#> Demoniac's Threads                          563.00 -1.68       neck/shoulders
#> Nemesis Gloves                              562.97 -1.70                hands
#> Soul Corrupter's Necklace                   561.56 -3.11                 neck
#> Demoniac's Threads (Set)                    561.09 -3.59 neck/shoulders/hands
#> Royal Seal of Eldre'Thalas                  560.79 -3.88             trinket2
#> Eye of the Beast                            560.49 -4.18             trinket1
#> Eye of the Beast 2                          559.79 -4.88             trinket2
#> Band of Servitude                           559.73 -4.95              finger1
```
