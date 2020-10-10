
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 267,
  sp = 550 + 63,
  crit = 8,
  hit = 12,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  314  718   19   12    0

my_equip <- yaml::read_yaml("equip.yaml")
my_changes <- yaml::read_yaml("changes.yaml")
my_bank <- yaml::read_yaml("bank.yaml")

show_statweights <- function(stats) {
  t(compute_statweights(stats, seed = 42))
}

w <- max(nchar(names(c(my_changes, my_bank))))
show_result <- function(stats, changes) {
  df <- compare_equip(stats, my_equip, changes, seed = 561)
  df <- df[order(-df$dps), ]
  row.names(df) <- format(row.names(df), width = w)
  modifyList(df, lapply(df[c("dps", "diff")], round, digits = 2))
}


show_statweights(my_stats_buffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3715613 1.0000000 13.384735 12.289871 0.3094341
#> dps    0.2006527 0.5400258  7.228102  6.636848 0.1671024
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3505697 1.0000000 11.321129 12.180527 0.3237102
#> dps    0.2117551 0.6040313  6.838316  7.357419 0.1955311
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3599618 1.0000000 12.471175 11.240496 0.3088730
#> dps    0.1916032 0.5322875  6.638251  5.983175 0.1644092

show_result(my_stats_buffed, my_changes)
#>                                                dps  diff    slot
#> AQ Eyestalk Waist Cord                      637.70  8.77   waist
#> AQ Sharpened Silithid Femur + Royal Scepter 636.73  7.81  weapon
#> Fel Infused Leggings                        635.46  6.54    legs
#> Leggings of the Black Blizzard              633.49  4.56    legs
#> AQ Cloak of the Devoured                    633.17  4.24    back
#> AQ Dark Storm Gauntlets                     632.78  3.86   hands
#> BWL Mish'undare, Circlet of the Mind Flayer 631.28  2.35    head
#> AQ Blessed Quiraji Acolyte Staff            631.14  2.22  weapon
#> Doomcaller's Trousers                       631.08  2.16    legs
#> Doomcaller's Robes                          630.81  1.88   chest
#> MC Mana Igniting Cord                       630.78  1.85   waist
#> AQ Wand of Quiraji Nobility                 630.29  1.37    wand
#> Rockfury Bracers                            629.23  0.30   wrist
#> current                                     628.92  0.00        
#> AQ Sharpened Silithid Femur + Jin'do's Bag  628.55 -0.38  weapon
#> AQ Ritssyn's Ring of Chaos                  628.39 -0.54 finger1
#> Doomcaller's Footwraps                      627.43 -1.49    feet

show_result(my_stats_buffed, my_bank)
#>                                                dps  diff     slot
#> Talisman of Ephemeral Power                 629.09  0.16 trinket1
#> Zandalarian Hero Charm                      628.99  0.06 trinket1
#> current                                     628.92  0.00         
#> Band of Forced Concentration                627.28 -1.65  finger1
#> Eye of the Beast                            627.21 -1.71 trinket1
#> Band of Dark Dominion                       626.07 -2.86  finger1
#> Choker of the Fire Lord                     626.01 -2.91     neck
#> Royal Seal of Eldre'Thalas                  624.94 -3.98 trinket1
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> Talisman of Ephemeral Power                 700.12  0.18 trinket1
#> Zandalarian Hero Charm                      700.01  0.07 trinket1
#> current                                     699.94  0.00         
#> Band of Forced Concentration                699.07 -0.87  finger1
#> Choker of the Fire Lord                     697.91 -2.04     neck
#> Band of Dark Dominion                       697.84 -2.10  finger1
#> Eye of the Beast                            695.80 -4.15 trinket1
#> Royal Seal of Eldre'Thalas                  695.51 -4.43 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                                dps  diff     slot
#> Talisman of Ephemeral Power                 566.01  0.19 trinket1
#> Zandalarian Hero Charm                      565.91  0.09 trinket1
#> current                                     565.82  0.00         
#> Band of Forced Concentration                564.86 -0.97  finger1
#> Band of Dark Dominion                       564.07 -1.75  finger1
#> Eye of the Beast                            563.17 -2.65 trinket1
#> Choker of the Fire Lord                     563.02 -2.80     neck
#> Royal Seal of Eldre'Thalas                  562.39 -3.43 trinket1
```
