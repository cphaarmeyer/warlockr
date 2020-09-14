
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- with_buffs(list(
  int = 275,
  sp = 505 + 76,
  crit = 5,
  hit = 9,
  mp5 = 0
),
consumables = "eosp"
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  322  621    5    9    0

my_stats_ony <- add_buff(my_stats, "ony")

my_equip <- yaml::read_yaml("equip.yaml")
my_changes <- yaml::read_yaml("changes.yaml")
my_bank <- yaml::read_yaml("bank.yaml")

show_statweights <- function(stats) {
  t(compute_statweights(stats, trinkets = "toep", seed = 42))
}

w <- max(nchar(names(c(my_changes, my_bank))))
show_result <- function(stats, changes) {
  df <- compare_equip(stats, my_equip, changes, seed = 561)
  df <- df[order(-df$dps), ]
  row.names(df) <- format(row.names(df), width = w)
  modifyList(df, lapply(df[c("dps", "diff")], round, digits = 2))
}


show_statweights(my_stats)
#>              int        sp      crit       hit       mp5
#> weight 0.3802324 1.0000000 13.760590 12.159467 0.3137723
#> dps    0.1851839 0.4870282  6.701796  5.922004 0.1528160
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3418587 1.0000000 11.649615 12.237447 0.3098650
#> dps    0.1864819 0.5454941  6.354796  6.675454 0.1690295

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 552.13 16.36            head
#> Doomcaller's Circlet                        550.39 14.62            head
#> BWL Mish'undare, Circlet of the Mind (Set)  544.94  9.17      head/hands
#> AQ Dustwind Turban                          544.26  8.49            head
#> AQ Eyestalk Waist Cord                      543.89  8.11           waist
#> Doomcaller's Mantle                         543.74  7.97       shoulders
#> AQ Ring of the Fallen God                   543.71  7.93         finger1
#> Doomcaller's Circlet (Set)                  543.25  7.48      head/hands
#> AQ Sharpened Silithid Femur + Royal Scepter 543.17  7.40          weapon
#> BWL Mantle of the Blackwing Cabal           541.81  6.03       shoulders
#> AQ Cloak of the Devoured                    539.24  3.47            back
#> AQ Dark Storm Gauntlets                     539.22  3.45           hands
#> ZG The Hexxer's Cover                       539.10  3.32            head
#> AQ Amulet of Vek'nilash                     538.58  2.80            neck
#> AQ Ring of Unspoken Names                   537.55  1.77         finger1
#> AQ Blessed Quiraji Acolyte Staff            537.40  1.63          weapon
#> AQ Ritssyn's Ring of Chaos                  537.32  1.55         finger1
#> MC Mana Igniting Cord                       537.28  1.50           waist
#> AQ Dustwind Turban (Set)                    537.26  1.49      head/hands
#> AQ Eyestalk Waist Cord (Set)                537.21  1.44     waist/hands
#> Doomcaller's Mantle (Set)                   536.82  1.05 shoulders/hands
#> AQ Wand of Quiraji Nobility                 536.36  0.59            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  535.79  0.01          weapon
#> current                                     535.77  0.00                
#> BWL Mantle of the Blackwing Cabal (Set)     535.13 -0.65 shoulders/hands
#> ZG The Hexxer's Cover (Set)                 532.36 -3.41      head/hands
#> MC Mana Igniting Cord (Set)                 530.37 -5.41     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     535.77  0.00         
#> Zandalarian Hero Charm                      535.57 -0.21 trinket1
#> Briarwood Reed                              535.00 -0.78 trinket1
#> Eye of the Beast                            533.59 -2.18 trinket1
#> Royal Seal of Eldre'Thalas                  532.06 -3.71 trinket1
#> Band of Servitude                           531.30 -4.47  finger1
#> Bloodtinged Gloves                          529.24 -6.54    hands
#> Nemesis Gloves                              528.99 -6.78    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     600.91  0.00         
#> Zandalarian Hero Charm                      600.68 -0.23 trinket1
#> Briarwood Reed                              600.05 -0.87 trinket1
#> Royal Seal of Eldre'Thalas                  596.75 -4.16 trinket1
#> Eye of the Beast                            596.15 -4.77 trinket1
#> Band of Servitude                           595.83 -5.09  finger1
#> Bloodtinged Gloves                          593.63 -7.29    hands
#> Nemesis Gloves                              592.12 -8.79    hands
```
