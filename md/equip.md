
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 276 + 31 + 16,
  sp = 476 + 33 + 40,
  crit = 5,
  hit = 4,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  323  549    5    4    3

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
  "BWL Nemesis Bracers" =
    list(wrist = list(int = 11, sp = 15)),
  "BWL Nemesis Bracers (Set)" = list(
    wrist = list(int = 11, sp = 15 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Nemesis Boots" =
    list(feet = list(int = 17, sp = 23)),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWL Mantle of the Blackwing Cabal (Set)" =
    list(shoulders = list(int = 16, sp = 34 - 12)),
  "BWL Bracers of Arcane Accuarcy" =
    list(wrist = list(int = 12, sp = 21, hit = 1)),
  "BWL Bracers of Arcane Accuarcy (Set)" = list(
    wrist = list(int = 12, sp = 21 - 12, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
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
    list(hands = list(int = 10, sp = 19, hit = 1)),
  "ZG Kezan's Ustoppable Taint" =
    list(neck = list(int = 8, sp = 14)),
  "ZG Kezan's Ustoppable Taint (Set)" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 13, sp = 23)
  )
)

my_bank <- list(
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Zandalar Demoniac's Robe" =
    list(chest = list(sp = 27, hit = 1)),
  "Zandalar Demoniac's Robe (Set)" = list(
    chest = list(sp = 27, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
  "Nemesis Spaulders" =
    list(shoulders = list(int = 13, sp = 23)),
  "Nemesis Spaulders (Set)" =
    list(shoulders = list(int = 13, sp = 23 - 12)),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Kezan's Taint" =
    list(neck = list(int = 8, sp = 14)),
  "Felheart Bracers" =
    list(wrist = list(int = 11, sp = 13)),
  "Felheart Bracers (Set)" = list(
    wrist = list(int = 11, sp = 13 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
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
#>  0.3711292  1.0000000 12.9192125 11.9624296  0.2883186
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3322069  1.0000000 10.7892180 11.9297857  0.2596341

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      490.95 18.31        trinket1
#> BWL Neltharions's Tear 2                    490.46 17.82        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 487.23 14.59            head
#> ZG Bloodvine Garb                           486.87 14.23 chest/legs/feet
#> BWL Mantle of the Blackwing Cabal           482.40  9.76       shoulders
#> BWL Bracers of Arcane Accuarcy              481.25  8.61           wrist
#> BWL Bracers of Arcane Accuarcy (Set)        479.74  7.10 wrist/shoulders
#> BWL Ebony Flame Gloves                      479.33  6.69           hands
#> MC Choker of the Fire Lord                  479.02  6.38            neck
#> BWL Mantle of the Blackwing Cabal (Set)     476.79  4.14       shoulders
#> ZG The Hexxer's Cover                       475.88  3.24            head
#> ZG Bloodvine Vest                           474.95  2.31           chest
#> MC Robe of Volatile Power                   474.20  1.56           chest
#> ZG Kezan's Ustoppable Taint (Set)           474.00  1.36  neck/shoulders
#> MC Mana Igniting Cord                       473.98  1.34           waist
#> MC Talisman of Ephemeral Power              473.48  0.83        trinket1
#> ZG Bloodtinged Gloves                       473.34  0.70           hands
#> MC Talisman of Ephemeral Power 2            473.02  0.38        trinket2
#> BWL Nemesis Bracers                         472.80  0.16           wrist
#> current                                     472.64  0.00            <NA>
#> BWL Nemesis Bracers (Set)                   471.22 -1.42 wrist/shoulders
#> ZG Kezan's Ustoppable Taint                 469.86 -2.78            neck
#> BWL Nemesis Boots                           469.24 -3.40            feet
#> ZG Zanzil's Seal                            468.46 -4.19         finger1
#> ZG Zanzil's Concentration                   467.55 -5.09 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           476.84  4.20       shoulders
#> Felcloth Gloves                             472.67  0.03           hands
#> current                                     472.64  0.00            <NA>
#> Felheart Bracers                            471.89 -0.75           wrist
#> Zandalar Demoniac's Robe (Set)              471.43 -1.21 chest/shoulders
#> Nemesis Spaulders (Set)                     471.27 -1.37       shoulders
#> Robe of the Void                            470.62 -2.02           chest
#> Eye of the Beast                            470.51 -2.13        trinket1
#> Felheart Bracers (Set)                      470.32 -2.33 wrist/shoulders
#> Eye of the Beast 2                          470.04 -2.60        trinket2
#> Soul Corrupter's Necklace                   470.04 -2.60            neck
#> Kezan's Taint                               469.86 -2.78            neck
#> Maleki's Footwraps                          469.78 -2.86            feet
#> Nemesis Leggings                            469.74 -2.90            legs
#> Royal Seal of Eldre'Thalas                  469.46 -3.18        trinket2
#> Band of Servitude                           468.45 -4.19         finger1
#> Zandalar Demoniac's Robe                    467.21 -5.43           chest
show_result(my_stats_ony, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           534.87  4.81       shoulders
#> Felcloth Gloves                             531.41  1.35           hands
#> Zandalar Demoniac's Robe (Set)              530.11  0.05 chest/shoulders
#> current                                     530.06  0.00            <NA>
#> Felheart Bracers                            529.17 -0.90           wrist
#> Robe of the Void                            529.12 -0.94           chest
#> Nemesis Spaulders (Set)                     528.61 -1.45       shoulders
#> Felheart Bracers (Set)                      527.51 -2.55 wrist/shoulders
#> Maleki's Footwraps                          526.92 -3.14            feet
#> Soul Corrupter's Necklace                   526.90 -3.16            neck
#> Kezan's Taint                               526.83 -3.23            neck
#> Nemesis Leggings                            526.68 -3.38            legs
#> Royal Seal of Eldre'Thalas                  526.51 -3.55        trinket2
#> Eye of the Beast                            525.62 -4.44        trinket1
#> Band of Servitude                           525.30 -4.76         finger1
#> Zandalar Demoniac's Robe                    525.27 -4.79           chest
#> Eye of the Beast 2                          525.10 -4.96        trinket2
```
