
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
  "BWL Band of Forced Concentration" =
    list(finger1 = list(int = 12, sp = 21, hit = 1)),
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
  "Zanzil's Band" =
    list(finger1 = list(int = 13, hit = 1, mp5 = 4)),
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
#>  0.3715727  1.0000000 12.8386144 12.0940460  0.2816930
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3318327  1.0000000 10.6750905 12.0463905  0.2630326

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      485.67 18.13        trinket1
#> BWL Neltharions's Tear 2                    485.27 17.74        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 482.01 14.47            head
#> ZG Bloodvine Garb                           481.84 14.30 chest/legs/feet
#> BWL Mantle of the Blackwing Cabal           477.24  9.70       shoulders
#> BWL Bracers of Arcane Accuarcy              476.21  8.67           wrist
#> BWL Bracers of Arcane Accuarcy (Set)        474.66  7.12 wrist/shoulders
#> MC Choker of the Fire Lord                  473.95  6.41            neck
#> BWL Ebony Flame Gloves                      473.94  6.40           hands
#> BWL Band of Forced Concentration            472.64  5.10         finger1
#> BWL Mantle of the Blackwing Cabal (Set)     471.73  4.19       shoulders
#> ZG The Hexxer's Cover                       470.84  3.30            head
#> MC Ring of Spell Power                      470.75  3.21         finger1
#> ZG Bloodvine Vest                           470.03  2.49           chest
#> MC Robe of Volatile Power                   469.14  1.60           chest
#> MC Mana Igniting Cord                       468.91  1.37           waist
#> ZG Kezan's Ustoppable Taint (Set)           468.87  1.33  neck/shoulders
#> MC Talisman of Ephemeral Power              468.39  0.85        trinket1
#> ZG Bloodtinged Gloves                       468.34  0.80           hands
#> MC Talisman of Ephemeral Power 2            467.91  0.37        trinket2
#> ZG Zanzil's Seal                            467.69  0.15         finger1
#> BWL Nemesis Bracers                         467.59  0.05           wrist
#> ZG Zanzil's Concentration                   467.55  0.01 finger1/finger2
#> current                                     467.54  0.00            <NA>
#> BWL Nemesis Bracers (Set)                   466.23 -1.31 wrist/shoulders
#> ZG Kezan's Ustoppable Taint                 464.71 -2.83            neck
#> BWL Nemesis Boots                           464.03 -3.51            feet

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           471.73  4.19       shoulders
#> Felcloth Gloves                             467.56  0.02           hands
#> current                                     467.54  0.00            <NA>
#> Felheart Bracers                            466.63 -0.91           wrist
#> Zandalar Demoniac's Robe (Set)              466.34 -1.20 chest/shoulders
#> Nemesis Spaulders (Set)                     466.15 -1.39       shoulders
#> Robe of the Void                            465.53 -2.01           chest
#> Eye of the Beast                            465.51 -2.03        trinket1
#> Felheart Bracers (Set)                      465.35 -2.19 wrist/shoulders
#> Soul Corrupter's Necklace                   465.06 -2.48            neck
#> Eye of the Beast 2                          465.00 -2.54        trinket2
#> Kezan's Taint                               464.71 -2.83            neck
#> Maleki's Footwraps                          464.67 -2.87            feet
#> Nemesis Leggings                            464.62 -2.92            legs
#> Royal Seal of Eldre'Thalas                  464.26 -3.27        trinket2
#> Zanzil's Band                               463.55 -3.99         finger1
#> Zandalar Demoniac's Robe                    462.29 -5.25           chest
show_result(my_stats_ony, my_bank)
#>                                                dps  diff            slot
#> Nemesis Spaulders                           529.16  4.76       shoulders
#> Felcloth Gloves                             525.69  1.29           hands
#> Zandalar Demoniac's Robe (Set)              524.44  0.04 chest/shoulders
#> current                                     524.40  0.00            <NA>
#> Robe of the Void                            523.43 -0.97           chest
#> Felheart Bracers                            523.31 -1.08           wrist
#> Nemesis Spaulders (Set)                     522.89 -1.51       shoulders
#> Felheart Bracers (Set)                      521.95 -2.45 wrist/shoulders
#> Soul Corrupter's Necklace                   521.40 -3.00            neck
#> Maleki's Footwraps                          521.23 -3.17            feet
#> Kezan's Taint                               521.08 -3.32            neck
#> Nemesis Leggings                            520.95 -3.44            legs
#> Royal Seal of Eldre'Thalas                  520.73 -3.67        trinket2
#> Eye of the Beast                            520.07 -4.33        trinket1
#> Zanzil's Band                               519.84 -4.56         finger1
#> Zandalar Demoniac's Robe                    519.79 -4.61           chest
#> Eye of the Beast 2                          519.51 -4.89        trinket2
```
