
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 273 + 31 + 16,
  sp = 524 + 33 + 40,
  crit = 5,
  hit = 10,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  320  597    5   10    0

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
  trinket1 = "zhc",
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
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
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
  "Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "Nemesis Gloves" =
    list(hands = list(int = 15, sp = 15, crit = 1)),
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Royal Seal of Eldre'Thalas" =
    list(trinket1 = list(sp = 23)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2))
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
#>  0.3557876  1.0000000 13.3311072 11.6059905  0.2679929
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3170777  1.0000000 11.3403729 11.6800715  0.2905289

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 545.06 16.15            head
#> BWL Mish'undare, Circlet of the Mind (Set)  544.62 15.71      head/hands
#> BWL Ebony Flame Gloves                      535.45  6.54           hands
#> BWL Mantle of the Blackwing Cabal           534.99  6.09       shoulders
#> BWL Mantle of the Blackwing Cabal (Set)     534.83  5.92 shoulders/hands
#> ZG The Hexxer's Cover                       532.25  3.34            head
#> ZG The Hexxer's Cover (Set)                 532.04  3.13      head/hands
#> MC Mana Igniting Cord                       530.37  1.46           waist
#> MC Mana Igniting Cord (Set)                 530.04  1.13     waist/hands
#> current                                     528.91  0.00            <NA>
#> ZG Zanzil's Seal                            524.27 -4.64         finger1
#> ZG Zanzil's Concentration                   522.98 -5.93 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> Talisman of Ephemeral Power                 529.33  0.42 trinket1
#> current                                     528.91  0.00     <NA>
#> Nemesis Gloves                              528.68 -0.23    hands
#> Felcloth Gloves                             528.36 -0.54    hands
#> Eye of the Beast                            526.76 -2.15 trinket1
#> Royal Seal of Eldre'Thalas                  525.48 -3.43 trinket1
#> Band of Servitude                           524.47 -4.44  finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> Talisman of Ephemeral Power                 593.74  0.46 trinket1
#> current                                     593.27  0.00     <NA>
#> Felcloth Gloves                             592.80 -0.47    hands
#> Nemesis Gloves                              591.77 -1.50    hands
#> Royal Seal of Eldre'Thalas                  589.42 -3.85 trinket1
#> Eye of the Beast                            588.56 -4.72 trinket1
#> Band of Servitude                           588.22 -5.06  finger1
```
