
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
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
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
#>  0.3627965  1.0000000 13.3694230 11.9535177  0.2510369
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3234839  1.0000000 11.1748447 11.8801700  0.2606216

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 545.48 16.15            head
#> BWL Mish'undare, Circlet of the Mind (Set)  545.04 15.71      head/hands
#> BWL Ebony Flame Gloves                      535.87  6.54           hands
#> BWL Mantle of the Blackwing Cabal           535.41  6.09       shoulders
#> BWL Mantle of the Blackwing Cabal (Set)     535.23  5.91 shoulders/hands
#> ZG The Hexxer's Cover                       532.65  3.32            head
#> ZG The Hexxer's Cover (Set)                 532.45  3.13      head/hands
#> MC Mana Igniting Cord                       530.78  1.45           waist
#> MC Mana Igniting Cord (Set)                 530.44  1.12     waist/hands
#> current                                     529.33  0.00            <NA>
#> ZG Zanzil's Seal                            524.68 -4.64         finger1
#> ZG Zanzil's Concentration                   523.39 -5.93 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     529.33  0.00     <NA>
#> Nemesis Gloves                              529.07 -0.25    hands
#> Zandalarian Hero Charm                      528.91 -0.42 trinket1
#> Felcloth Gloves                             528.76 -0.57    hands
#> Briarwood Reed                              528.43 -0.90 trinket1
#> Eye of the Beast                            526.76 -2.57 trinket1
#> Royal Seal of Eldre'Thalas                  525.48 -3.85 trinket1
#> Band of Servitude                           524.86 -4.47  finger1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     593.74  0.00     <NA>
#> Zandalarian Hero Charm                      593.27 -0.46 trinket1
#> Felcloth Gloves                             593.24 -0.50    hands
#> Briarwood Reed                              592.73 -1.00 trinket1
#> Nemesis Gloves                              592.21 -1.53    hands
#> Royal Seal of Eldre'Thalas                  589.42 -4.31 trinket1
#> Band of Servitude                           588.67 -5.07  finger1
#> Eye of the Beast                            588.56 -5.18 trinket1
```
