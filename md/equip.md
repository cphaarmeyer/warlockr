
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 267,
  sp = 521 + 63,
  crit = 8,
  hit = 12,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  314  689   19   12    0

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


show_statweights(my_stats_buffed)
#>              int        sp      crit      hit       mp5
#> weight 0.3712653 1.0000000 13.475786 12.39676 0.3171418
#> dps    0.2019109 0.5438453  7.328743  6.74192 0.1724761
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3408347 1.0000000 11.355187 12.315879 0.2765596
#> dps    0.2065310 0.6059565  6.880749  7.462887 0.1675831
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3531784 1.0000000 13.083701 11.530407 0.3628965
#> dps    0.1846617 0.5228567  6.840901  6.028751 0.1897428

show_result(my_stats_buffed, my_changes)
#>                                                dps  diff    slot
#> AQ Eyestalk Waist Cord                      637.64  8.56   waist
#> AQ Sharpened Silithid Femur + Royal Scepter 637.63  8.54  weapon
#> Fel Infused Leggings                        635.28  6.20    legs
#> Leggings of the Black Blizzard              633.92  4.83    legs
#> AQ Dark Storm Gauntlets                     633.02  3.93   hands
#> AQ Cloak of the Devoured                    632.72  3.63    back
#> Doomcaller's Trousers                       631.67  2.59    legs
#> AQ Blessed Quiraji Acolyte Staff            631.33  2.24  weapon
#> Doomcaller's Robes                          631.18  2.09   chest
#> MC Mana Igniting Cord                       630.78  1.70   waist
#> BWL Mish'undare, Circlet of the Mind Flayer 630.68  1.60    head
#> Rockfury Bracers                            630.04  0.95   wrist
#> AQ Wand of Quiraji Nobility                 629.61  0.52    wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  629.49  0.40  weapon
#> current                                     629.09  0.00        
#> AQ Ritssyn's Ring of Chaos                  628.15 -0.94 finger1
#> Doomcaller's Footwraps                      627.10 -1.99    feet

show_result(my_stats_buffed, my_bank)
#>                                                dps  diff     slot
#> current                                     629.09  0.00         
#> Zandalarian Hero Charm                      628.99 -0.10 trinket1
#> Briarwood Reed                              628.92 -0.16 trinket1
#> Band of Forced Concentration                628.06 -1.03  finger1
#> Eye of the Beast                            627.21 -1.87 trinket1
#> Band of Dark Dominion                       626.50 -2.59  finger1
#> Choker of the Fire Lord                     625.66 -3.43     neck
#> Royal Seal of Eldre'Thalas                  624.94 -4.15 trinket1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     700.12  0.00         
#> Zandalarian Hero Charm                      700.01 -0.11 trinket1
#> Band of Forced Concentration                699.95 -0.18  finger1
#> Briarwood Reed                              699.94 -0.18 trinket1
#> Band of Dark Dominion                       698.32 -1.80  finger1
#> Choker of the Fire Lord                     697.51 -2.61     neck
#> Eye of the Beast                            695.80 -4.33 trinket1
#> Royal Seal of Eldre'Thalas                  695.51 -4.61 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                                dps  diff     slot
#> current                                     566.01  0.00         
#> Zandalarian Hero Charm                      565.91 -0.10 trinket1
#> Briarwood Reed                              565.82 -0.19 trinket1
#> Band of Forced Concentration                565.31 -0.70  finger1
#> Band of Dark Dominion                       564.35 -1.66  finger1
#> Choker of the Fire Lord                     563.27 -2.74     neck
#> Eye of the Beast                            563.17 -2.84 trinket1
#> Royal Seal of Eldre'Thalas                  562.39 -3.62 trinket1
```
