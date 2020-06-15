
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 273 + 31 + 16,
  sp = 509 + 33 + 40,
  crit = 5,
  hit = 8,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  320  582    5    8    0

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 7, sp = 34),
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
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
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
#>  0.3314658  1.0000000 12.8335981 11.6733465  0.2851733
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3099809  1.0000000 10.9477804 11.6393004  0.2649764

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      528.91 18.97        trinket1
#> BWL Neltharions's Tear 2                    528.43 18.49        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 525.73 15.79            head
#> BWL Mish'undare, Circlet of the Mind (Set)  524.88 14.94      head/hands
#> BWL Ebony Flame Gloves                      516.34  6.40           hands
#> BWL Mantle of the Blackwing Cabal           515.98  6.04       shoulders
#> BWL Mantle of the Blackwing Cabal (Set)     515.43  5.49 shoulders/hands
#> ZG The Hexxer's Cover                       513.35  3.41            head
#> ZG The Hexxer's Cover (Set)                 512.76  2.82      head/hands
#> MC Mana Igniting Cord                       511.46  1.52           waist
#> MC Talisman of Ephemeral Power              510.92  0.98        trinket1
#> MC Mana Igniting Cord (Set)                 510.88  0.94     waist/hands
#> MC Talisman of Ephemeral Power 2            510.32  0.38        trinket2
#> current                                     509.94  0.00            <NA>
#> ZG Zanzil's Seal                            505.62 -4.32         finger1
#> ZG Zanzil's Concentration                   504.51 -5.42 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     509.94  0.00     <NA>
#> Nemesis Gloves                              509.52 -0.42    hands
#> Felcloth Gloves                             509.33 -0.61    hands
#> Eye of the Beast                            508.24 -1.70 trinket1
#> Eye of the Beast 2                          507.61 -2.33 trinket2
#> Royal Seal of Eldre'Thalas                  506.55 -3.39 trinket2
#> Band of Servitude                           505.65 -4.29  finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     571.95  0.00     <NA>
#> Felcloth Gloves                             571.45 -0.50    hands
#> Nemesis Gloves                              570.31 -1.64    hands
#> Royal Seal of Eldre'Thalas                  568.16 -3.79 trinket2
#> Eye of the Beast                            567.82 -4.13 trinket1
#> Eye of the Beast 2                          567.13 -4.82 trinket2
#> Band of Servitude                           567.08 -4.87  finger1
```
