
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 273 + 31 + 16,
  sp = 498 + 96 + 40,
  crit = 6,
  hit = 9,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  320  634    6    9    0

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
#>  0.3633119  1.0000000 13.5477056 12.2239730  0.2872420
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3305147  1.0000000 11.4108034 12.3035163  0.2940620

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 565.23 16.50            head
#> Doomcaller's Circlet                        563.53 14.80            head
#> BWL Mish'undare, Circlet of the Mind (Set)  557.92  9.19      head/hands
#> AQ Dustwind Turban                          557.24  8.52            head
#> AQ Eyestalk Waist Cord                      556.89  8.16           waist
#> Doomcaller's Mantle                         556.85  8.12       shoulders
#> AQ Ring of the Fallen God                   556.68  7.95         finger1
#> Doomcaller's Circlet (Set)                  556.42  7.69      head/hands
#> AQ Sharpened Silithid Femur + Royal Scepter 556.18  7.46          weapon
#> BWL Mantle of the Blackwing Cabal           554.81  6.08       shoulders
#> AQ Cloak of the Devoured                    552.22  3.50            back
#> AQ Dark Storm Gauntlets                     552.17  3.45           hands
#> ZG The Hexxer's Cover                       552.05  3.32            head
#> AQ Ring of Unspoken Names                   550.56  1.84         finger1
#> AQ Blessed Quiraji Acolyte Staff            550.43  1.71          weapon
#> AQ Ritssyn's Ring of Chaos                  550.27  1.55         finger1
#> MC Mana Igniting Cord                       550.19  1.47           waist
#> AQ Dustwind Turban (Set)                    550.17  1.45      head/hands
#> AQ Eyestalk Waist Cord (Set)                550.08  1.35     waist/hands
#> Doomcaller's Mantle (Set)                   549.99  1.26 shoulders/hands
#> AQ Wand of Quiraji Nobility                 549.18  0.45            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  548.77  0.04          weapon
#> current                                     548.72  0.00            <NA>
#> BWL Mantle of the Blackwing Cabal (Set)     547.92 -0.80 shoulders/hands
#> ZG The Hexxer's Cover (Set)                 545.26 -3.47      head/hands
#> MC Mana Igniting Cord (Set)                 543.24 -5.49     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     548.72  0.00     <NA>
#> Zandalarian Hero Charm                      548.30 -0.42 trinket1
#> Briarwood Reed                              547.87 -0.85 trinket1
#> Eye of the Beast                            546.45 -2.27 trinket1
#> Choker of the Fire Lord                     545.85 -2.88     neck
#> Royal Seal of Eldre'Thalas                  544.79 -3.93 trinket1
#> Band of Servitude                           544.27 -4.45  finger1
#> Bloodtinged Gloves                          542.10 -6.62    hands
#> Nemesis Gloves                              541.79 -6.93    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     614.30  0.00     <NA>
#> Zandalarian Hero Charm                      613.85 -0.46 trinket1
#> Briarwood Reed                              613.36 -0.94 trinket1
#> Choker of the Fire Lord                     612.22 -2.08     neck
#> Royal Seal of Eldre'Thalas                  609.91 -4.39 trinket1
#> Eye of the Beast                            609.32 -4.98 trinket1
#> Band of Servitude                           609.26 -5.05  finger1
#> Bloodtinged Gloves                          606.96 -7.34    hands
#> Nemesis Gloves                              605.29 -9.01    hands
```
