
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

my_equip <- yaml::read_yaml("equip.yaml")
my_changes <- yaml::read_yaml("changes.yaml")
my_bank <- yaml::read_yaml("bank.yaml")

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
