
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 269 + 31 + 16,
  sp = 502 + 33 + 40,
  crit = 4,
  hit = 6,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  316  575    4    6    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 16, sp = 32, crit = 1),
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
#>  0.3912893  1.0000000 13.3079209 12.1079118  0.3610598
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3518793  1.0000000 11.0513618 11.9035617  0.3365635

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      507.23 18.40        trinket1
#> BWL Neltharions's Tear 2                    506.90 18.07        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 503.87 15.04            head
#> ZG Bloodvine Garb                           503.38 14.55 chest/legs/feet
#> MC Choker of the Fire Lord                  495.30  6.47            neck
#> BWL Ebony Flame Gloves                      494.73  5.91           hands
#> BWL Mantle of the Blackwing Cabal           494.55  5.72       shoulders
#> ZG The Hexxer's Cover                       492.05  3.22            head
#> ZG Bloodvine Vest                           490.75  1.92           chest
#> MC Robe of Volatile Power                   490.52  1.69           chest
#> MC Mana Igniting Cord                       490.26  1.43           waist
#> MC Talisman of Ephemeral Power              489.72  0.89        trinket1
#> MC Talisman of Ephemeral Power 2            489.21  0.38        trinket2
#> current                                     488.83  0.00            <NA>
#> BWL Nemesis Boots                           485.16 -3.67            feet
#> ZG Zanzil's Seal                            484.60 -4.23         finger1
#> ZG Zanzil's Concentration                   483.60 -5.23 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff           slot
#> current                                     488.83  0.00           <NA>
#> Nemesis Gloves                              488.30 -0.53          hands
#> Felcloth Gloves                             488.03 -0.80          hands
#> Demoniac's Threads                          487.48 -1.35 neck/shoulders
#> Eye of the Beast                            487.15 -1.67       trinket1
#> Eye of the Beast 2                          486.61 -2.22       trinket2
#> Robe of the Void                            486.35 -2.48          chest
#> Soul Corrupter's Necklace                   486.26 -2.57           neck
#> Nemesis Leggings                            485.96 -2.86           legs
#> Maleki's Footwraps                          485.79 -3.04           feet
#> Royal Seal of Eldre'Thalas                  485.69 -3.14       trinket2
#> Band of Servitude                           484.64 -4.19        finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff           slot
#> current                                     549.38  0.00           <NA>
#> Felcloth Gloves                             548.71 -0.67          hands
#> Robe of the Void                            548.02 -1.36          chest
#> Nemesis Gloves                              547.67 -1.71          hands
#> Demoniac's Threads                          547.58 -1.79 neck/shoulders
#> Soul Corrupter's Necklace                   546.18 -3.20           neck
#> Maleki's Footwraps                          546.14 -3.24           feet
#> Nemesis Leggings                            545.94 -3.44           legs
#> Royal Seal of Eldre'Thalas                  545.86 -3.52       trinket2
#> Eye of the Beast                            545.44 -3.94       trinket1
#> Eye of the Beast 2                          544.84 -4.54       trinket2
#> Band of Servitude                           544.61 -4.77        finger1
```
