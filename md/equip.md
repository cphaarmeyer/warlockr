
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 267 + 31 + 16,
  sp = 512 + 63 + 40,
  crit = 7,
  hit = 9,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  314  615    7    9    0

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
#>  0.3567908  1.0000000 12.9418981 12.0777981  0.2566529
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3221838  1.0000000 10.8707265 12.0038185  0.2036097

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 560.86 16.24            head
#> Doomcaller's Circlet                        559.39 14.77            head
#> BWL Mish'undare, Circlet of the Mind (Set)  553.24  8.62      head/hands
#> AQ Dustwind Turban                          553.23  8.61            head
#> AQ Eyestalk Waist Cord                      553.02  8.39           waist
#> Doomcaller's Mantle                         552.74  8.12       shoulders
#> AQ Sharpened Silithid Femur + Royal Scepter 552.29  7.66          weapon
#> Doomcaller's Circlet (Set)                  551.86  7.23      head/hands
#> AQ Ring of the Fallen God                   551.62  6.99         finger1
#> BWL Mantle of the Blackwing Cabal           550.78  6.15       shoulders
#> AQ Cloak of the Devoured                    548.18  3.55            back
#> AQ Dark Storm Gauntlets                     548.15  3.53           hands
#> ZG The Hexxer's Cover                       548.09  3.46            head
#> AQ Blessed Quiraji Acolyte Staff            546.45  1.82          weapon
#> MC Mana Igniting Cord                       546.19  1.56           waist
#> AQ Eyestalk Waist Cord (Set)                545.88  1.25     waist/hands
#> AQ Dustwind Turban (Set)                    545.71  1.09      head/hands
#> Doomcaller's Mantle (Set)                   545.53  0.90 shoulders/hands
#> AQ Wand of Quiraji Nobility                 545.16  0.54            wand
#> AQ Ritssyn's Ring of Chaos                  545.03  0.40         finger1
#> AQ Sharpened Silithid Femur + Jin'do's Bag  544.91  0.28          weapon
#> current                                     544.62  0.00            <NA>
#> BWL Mantle of the Blackwing Cabal (Set)     543.65 -0.97 shoulders/hands
#> ZG The Hexxer's Cover (Set)                 541.02 -3.60      head/hands
#> MC Mana Igniting Cord (Set)                 538.92 -5.71     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     544.62  0.00     <NA>
#> Zandalarian Hero Charm                      544.21 -0.42 trinket1
#> Briarwood Reed                              543.84 -0.79 trinket1
#> Band of Dark Dominion                       543.55 -1.07  finger1
#> Choker of the Fire Lord                     541.88 -2.74     neck
#> Eye of the Beast                            541.83 -2.80 trinket1
#> Royal Seal of Eldre'Thalas                  540.74 -3.88 trinket1
#> Band of Servitude                           538.97 -5.66  finger1
#> Bloodtinged Gloves                          537.95 -6.68    hands
#> Nemesis Gloves                              537.45 -7.17    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     608.60  0.00     <NA>
#> Zandalarian Hero Charm                      608.14 -0.45 trinket1
#> Briarwood Reed                              607.73 -0.87 trinket1
#> Band of Dark Dominion                       607.51 -1.08  finger1
#> Choker of the Fire Lord                     606.74 -1.86     neck
#> Royal Seal of Eldre'Thalas                  604.27 -4.33 trinket1
#> Eye of the Beast                            603.17 -5.42 trinket1
#> Band of Servitude                           602.32 -6.28  finger1
#> Bloodtinged Gloves                          601.19 -7.40    hands
#> Nemesis Gloves                              599.34 -9.26    hands
```
