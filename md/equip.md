
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
#> weight 0.3818567 1.0000000 13.296944 11.929291 0.2951267
#> dps    0.1898661 0.4972183  6.611483  5.931461 0.1467424
show_statweights(my_stats_ony)
#>              int        sp      crit      hit       mp5
#> weight 0.3389082 1.0000000 11.202164 11.94444 0.2957193
#> dps    0.1895331 0.5592462  6.264768  6.67988 0.1653799

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 551.69 16.35            head
#> Doomcaller's Circlet                        549.95 14.62            head
#> BWL Mish'undare, Circlet of the Mind (Set)  544.50  9.17      head/hands
#> AQ Dustwind Turban                          543.82  8.49            head
#> AQ Eyestalk Waist Cord                      543.46  8.13           waist
#> Doomcaller's Mantle                         543.29  7.95       shoulders
#> AQ Ring of the Fallen God                   543.25  7.92         finger1
#> Doomcaller's Circlet (Set)                  542.80  7.47      head/hands
#> AQ Sharpened Silithid Femur + Royal Scepter 542.74  7.41          weapon
#> BWL Mantle of the Blackwing Cabal           541.36  6.03       shoulders
#> AQ Cloak of the Devoured                    538.83  3.49            back
#> AQ Dark Storm Gauntlets                     538.78  3.45           hands
#> ZG The Hexxer's Cover                       538.66  3.32            head
#> AQ Amulet of Vek'nilash                     538.17  2.83            neck
#> AQ Ring of Unspoken Names                   537.12  1.79         finger1
#> AQ Blessed Quiraji Acolyte Staff            536.97  1.64          weapon
#> AQ Ritssyn's Ring of Chaos                  536.90  1.56         finger1
#> MC Mana Igniting Cord                       536.86  1.52           waist
#> AQ Dustwind Turban (Set)                    536.83  1.49      head/hands
#> AQ Eyestalk Waist Cord (Set)                536.80  1.47     waist/hands
#> Doomcaller's Mantle (Set)                   536.39  1.06 shoulders/hands
#> AQ Wand of Quiraji Nobility                 535.92  0.59            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  535.37  0.03          weapon
#> current                                     535.33  0.00                
#> BWL Mantle of the Blackwing Cabal (Set)     534.72 -0.62 shoulders/hands
#> ZG The Hexxer's Cover (Set)                 531.94 -3.40      head/hands
#> MC Mana Igniting Cord (Set)                 529.93 -5.41     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     535.33  0.00         
#> Zandalarian Hero Charm                      535.26 -0.07 trinket1
#> Briarwood Reed                              535.00 -0.34 trinket1
#> Eye of the Beast                            533.59 -1.74 trinket1
#> Royal Seal of Eldre'Thalas                  532.06 -3.27 trinket1
#> Band of Servitude                           530.89 -4.44  finger1
#> Bloodtinged Gloves                          528.81 -6.52    hands
#> Nemesis Gloves                              528.57 -6.76    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     600.42  0.00         
#> Zandalarian Hero Charm                      600.34 -0.08 trinket1
#> Briarwood Reed                              600.05 -0.37 trinket1
#> Royal Seal of Eldre'Thalas                  596.75 -3.67 trinket1
#> Eye of the Beast                            596.15 -4.27 trinket1
#> Band of Servitude                           595.37 -5.06  finger1
#> Bloodtinged Gloves                          593.16 -7.26    hands
#> Nemesis Gloves                              591.65 -8.78    hands
```
