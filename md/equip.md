
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 273 + 31 + 16,
  sp = 478 + 33 + 40,
  crit = 5,
  hit = 3,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  320  551    5    3    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 19, sp = 12),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 16, sp = 32, crit = 1),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 9, sp = 23),
  finger2 = list(int = 6, sp = 33),
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
  "MC Ring of Spell Power" =
    list(finger1 = list(sp = 33)),
  "MC Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "MC2 Talisman of Ephemeral Power" =
    list(trinket2 = "toep"),
  "BWL Nemesis Bracers" =
    list(wrist = list(int = 11, sp = 15)),
  "BWLS Nemesis Bracers" = list(
    wrist = list(int = 11, sp = 15 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Nemesis Boots" =
    list(feet = list(int = 17, sp = 23)),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWLS Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34 - 12)),
  "BWL Bracers of Arcane Accuarcy" =
    list(wrist = list(int = 12, sp = 21, hit = 1)),
  "BWLS Bracers of Arcane Accuarcy" = list(
    wrist = list(int = 12, sp = 21 - 12, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Band of Forced Concentration" =
    list(finger1 = list(int = 12, sp = 21, hit = 1)),
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
  "BWL Neltharions's Tear" =
    list(trinket1 = list(sp = 44, hit = 2)),
  "BWL2 Neltharions's Tear" =
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
    list(hands = list(int = 10, sp = 19, hit = 1)),
  "ZG Kezan's Ustoppable Taint" =
    list(neck = list(int = 8, sp = 14)),
  "ZGS Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 13, sp = 23)
  )
)

my_bank <- list(
  "Zandalar Demoniac's Robe" =
    list(chest = list(sp = 27, hit = 1)),
  "S Zandalar Demoniac's Robe" = list(
    chest = list(sp = 27, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
  "Nemesis Spaulders" =
    list(shoulders = list(int = 13, sp = 23)),
  "S Nemesis Spaulders" =
    list(shoulders = list(int = 13, sp = 23 - 12)),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Kezan's Taint" =
    list(neck = list(int = 8, sp = 14)),
  "Zanzil's Band" =
    list(finger1 = list(int = 13, hit = 1, mp5 = 4)),
  "Felheart Bracers" =
    list(wrist = list(int = 11, sp = 13)),
  "S Felheart Bracers" = list(
    wrist = list(int = 11, sp = 13 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
  "Maleki's Footwraps" =
    list(feet = list(int = 9, sp = 27)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Star of Mystaria" =
    list(neck = list(int = 9, hit = 1)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2)),
  "2 Eye of the Beast" =
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
#>  0.3757275  1.0000000 13.1873383 12.1810065  0.2745131
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3410901  1.0000000 11.1198261 12.2403698  0.2646944

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      486.94 18.17        trinket1
#> BWL2 Neltharions's Tear                     485.27 16.51        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 483.26 14.50            head
#> ZG Bloodvine Garb                           483.12 14.35 chest/legs/feet
#> BWL Mantle of the Blackwing Cabal           478.45  9.69       shoulders
#> BWL Bracers of Arcane Accuarcy              477.43  8.67           wrist
#> BWLS Bracers of Arcane Accuarcy             475.89  7.13 wrist/shoulders
#> MC Choker of the Fire Lord                  475.18  6.42            neck
#> BWL Ebony Flame Gloves                      475.15  6.39           hands
#> BWL Band of Forced Concentration            473.89  5.13         finger1
#> BWLS Mantle of the Blackwing Cabal          472.94  4.18       shoulders
#> MC Talisman of Ephemeral Power              472.36  3.60        trinket1
#> ZG The Hexxer's Cover                       472.04  3.28            head
#> MC Ring of Spell Power                      471.97  3.21         finger1
#> ZG Bloodvine Vest                           471.28  2.51           chest
#> MC2 Talisman of Ephemeral Power             470.61  1.85        trinket2
#> MC Robe of Volatile Power                   470.37  1.61           chest
#> MC Mana Igniting Cord                       470.13  1.37           waist
#> ZGS Kezan's Ustoppable Taint                470.10  1.33  neck/shoulders
#> ZG Bloodtinged Gloves                       469.56  0.80           hands
#> ZG Zanzil's Seal                            468.93  0.16         finger1
#> ZG Zanzil's Concentration                   468.83  0.06 finger1/finger2
#> BWL Nemesis Bracers                         468.81  0.05           wrist
#> current                                     468.76  0.00            <NA>
#> BWLS Nemesis Bracers                        467.46 -1.31 wrist/shoulders
#> ZG Kezan's Ustoppable Taint                 465.94 -2.83            neck
#> BWL Nemesis Boots                           465.24 -3.52            feet

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           472.94  4.18       shoulders
#> current                                     468.76  0.00            <NA>
#> Felcloth Gloves                             468.76  0.00           hands
#> Felheart Bracers                            467.88 -0.89           wrist
#> S Zandalar Demoniac's Robe                  467.54 -1.22 chest/shoulders
#> S Nemesis Spaulders                         467.37 -1.39       shoulders
#> Eye of the Beast                            466.78 -1.98        trinket1
#> Robe of the Void                            466.73 -2.03           chest
#> S Felheart Bracers                          466.57 -2.19 wrist/shoulders
#> Kezan's Taint                               465.94 -2.83            neck
#> Maleki's Footwraps                          465.88 -2.88            feet
#> Nemesis Leggings                            465.84 -2.92            legs
#> Star of Mystaria                            465.15 -3.61            neck
#> 2 Eye of the Beast                          465.00 -3.76        trinket2
#> Zanzil's Band                               464.79 -3.97         finger1
#> Royal Seal of Eldre'Thalas                  464.26 -4.50        trinket2
#> Zandalar Demoniac's Robe                    463.53 -5.24           chest
show_result(my_stats_ony, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           530.52  4.74       shoulders
#> Felcloth Gloves                             527.04  1.27           hands
#> S Zandalar Demoniac's Robe                  525.79  0.02 chest/shoulders
#> current                                     525.78  0.00            <NA>
#> Robe of the Void                            524.78 -1.00           chest
#> Felheart Bracers                            524.72 -1.05           wrist
#> S Nemesis Spaulders                         524.27 -1.50       shoulders
#> S Felheart Bracers                          523.34 -2.44 wrist/shoulders
#> Maleki's Footwraps                          522.60 -3.18            feet
#> Kezan's Taint                               522.47 -3.31            neck
#> Nemesis Leggings                            522.32 -3.45            legs
#> Star of Mystaria                            521.59 -4.19            neck
#> Eye of the Beast                            521.49 -4.28        trinket1
#> Zanzil's Band                               521.25 -4.53         finger1
#> Zandalar Demoniac's Robe                    521.18 -4.60           chest
#> Royal Seal of Eldre'Thalas                  520.73 -5.05        trinket2
#> 2 Eye of the Beast                          519.51 -6.27        trinket2
```
