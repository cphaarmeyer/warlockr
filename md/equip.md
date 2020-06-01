
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 274 + 31 + 16,
  sp = 498 + 33 + 40,
  crit = 5,
  hit = 5,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  321  571    5    5    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 16, sp = 32, crit = 1),
  wrist = list(int = 12, sp = 21, hit = 1),
  hands = list(int = 15, sp = 15, crit = 1),
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
  "MC Robe of Volatile Power" =
    list(chest = list(int = 15, sp = 23, crit = 2)),
  "MC Mana Igniting Cord" =
    list(waist = list(int = 16, sp = 25, crit = 1)),
  "MC Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "MC Talisman of Ephemeral Power 2" =
    list(trinket2 = "toep"),
  "BWL Nemesis Boots" =
    list(feet = list(int = 17, sp = 23)),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
  "BWL Neltharions's Tear" =
    list(trinket1 = list(sp = 44, hit = 2)),
  "BWL Neltharions's Tear 2" =
    list(trinket2 = list(sp = 44, hit = 2)),
  "BWL Mish'undare, Circlet of the Mind Flayer" =
    list(head = list(int = 24, sp = 35, crit = 2)),
  "ZG Zanzil's Seal" =
    list(finger1 = list(int = 10, sp = 11, hit = 1)),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "ZG The Hexxer's Cover" =
    list(head = list(int = 10, sp = 41)),
  "ZG Bloodvine Vest" =
    list(chest = list(int = 13, sp = 27, hit = 2)),
  "ZG Bloodvine Garb" = list(
    chest = list(int = 13, sp = 27, hit = 2),
    legs = list(int = 6, sp = 37, hit = 1),
    feet = list(int = 16, sp = 19, crit = 2, hit = 1)
  ),
  "ZG Bloodtinged Gloves" =
    list(hands = list(int = 10, sp = 19, hit = 1))
)

my_bank <- list(
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Demoniac's Threads" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 19, sp = 12 + 12)
  ),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Maleki's Footwraps" =
    list(feet = list(int = 9, sp = 27)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Soul Corrupter's Necklace" =
    list(neck = list(int = 16, hit = 1)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2)),
  "Eye of the Beast 2" =
    list(trinket2 = list(crit = 2)),
  "Robe of the Void" =
    list(chest = list(sp = 46)),
  "Nemesis Leggings" =
    list(legs = list(int = 16, sp = 39))
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
#>  0.3811791  1.0000000 13.1003077 12.1258642  0.3721891
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3402413  1.0000000 11.0958113 12.0280928  0.3567931

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      506.82 18.52        trinket1
#> BWL Neltharions's Tear 2                    506.47 18.17        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 503.28 14.98            head
#> ZG Bloodvine Garb                           502.83 14.53 chest/legs/feet
#> MC Choker of the Fire Lord                  494.86  6.56            neck
#> BWL Ebony Flame Gloves                      494.73  6.44           hands
#> BWL Mantle of the Blackwing Cabal           493.98  5.68       shoulders
#> ZG The Hexxer's Cover                       491.48  3.19            head
#> ZG Bloodvine Vest                           490.50  2.20           chest
#> MC Robe of Volatile Power                   489.91  1.61           chest
#> MC Mana Igniting Cord                       489.65  1.35           waist
#> MC Talisman of Ephemeral Power              489.21  0.91        trinket1
#> ZG Bloodtinged Gloves                       488.83  0.53           hands
#> MC Talisman of Ephemeral Power 2            488.68  0.39        trinket2
#> current                                     488.30  0.00            <NA>
#> BWL Nemesis Boots                           484.71 -3.59            feet
#> ZG Zanzil's Seal                            484.20 -4.10         finger1
#> ZG Zanzil's Concentration                   483.29 -5.01 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff           slot
#> current                                     488.30  0.00           <NA>
#> Felcloth Gloves                             488.03 -0.27          hands
#> Demoniac's Threads                          486.87 -1.43 neck/shoulders
#> Eye of the Beast                            486.49 -1.81       trinket1
#> Robe of the Void                            485.99 -2.30          chest
#> Eye of the Beast 2                          485.95 -2.35       trinket2
#> Soul Corrupter's Necklace                   485.83 -2.47           neck
#> Maleki's Footwraps                          485.26 -3.04           feet
#> Nemesis Leggings                            485.22 -3.08           legs
#> Royal Seal of Eldre'Thalas                  484.92 -3.38       trinket2
#> Band of Servitude                           484.12 -4.18        finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff           slot
#> Felcloth Gloves                             548.71  1.05          hands
#> current                                     547.67  0.00           <NA>
#> Robe of the Void                            546.43 -1.24          chest
#> Demoniac's Threads                          545.87 -1.79 neck/shoulders
#> Soul Corrupter's Necklace                   544.67 -3.00           neck
#> Maleki's Footwraps                          544.33 -3.34           feet
#> Nemesis Leggings                            544.06 -3.61           legs
#> Royal Seal of Eldre'Thalas                  543.88 -3.79       trinket2
#> Eye of the Beast                            543.49 -4.17       trinket1
#> Band of Servitude                           542.93 -4.74        finger1
#> Eye of the Beast 2                          542.90 -4.77       trinket2
```
