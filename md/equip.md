
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 261,
  sp = 528 + 63,
  crit = 7,
  hit = 10,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  308  696   18   10    0

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
#> weight 0.3700413 1.0000000 14.267385 13.05467 0.2321307
#> dps    0.1902831 0.5142212  7.336592  6.71299 0.1193665
show_statweights(my_stats_ony)
#>              int       sp     crit       hit       mp5
#> weight 0.3419099 1.000000 11.85577 12.896618 0.2392875
#> dps    0.1972123 0.576796  6.83836  7.438718 0.1380201
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3567171 1.0000000 13.073289 11.905171 0.2815017
#> dps    0.1818570 0.5098073  6.664858  6.069343 0.1435116

show_result(my_stats_buffed, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 628.36 17.24            head
#> Doomcaller's Circlet                        626.91 15.79            head
#> BWL Mish'undare, Circlet of the Mind (Set)  625.32 14.21  head/shoulders
#> Doomcaller's Circlet (Set)                  623.73 12.62  head/shoulders
#> AQ Dustwind Turban                          620.32  9.21            head
#> AQ Eyestalk Waist Cord                      619.35  8.24           waist
#> AQ Sharpened Silithid Femur + Royal Scepter 619.31  8.20          weapon
#> AQ Ring of the Fallen God                   617.68  6.57         finger1
#> AQ Dustwind Turban (Set)                    617.01  5.90  head/shoulders
#> Fel Infused Leggings                        616.83  5.72            legs
#> AQ Eyestalk Waist Cord (Set)                616.54  5.43 waist/shoulders
#> Leggings of the Black Blizzard              615.57  4.46            legs
#> AQ Dark Storm Gauntlets                     615.17  4.06           hands
#> ZG The Hexxer's Cover                       614.69  3.58            head
#> AQ Cloak of the Devoured                    614.67  3.56            back
#> Doomcaller's Trousers                       613.61  2.50            legs
#> AQ Blessed Quiraji Acolyte Staff            613.42  2.31          weapon
#> MC Mana Igniting Cord                       612.42  1.31           waist
#> Doomcaller's Robes                          612.35  1.24           chest
#> Rockfury Bracers                            611.86  0.75           wrist
#> AQ Wand of Quiraji Nobility                 611.65  0.53            wand
#> ZG The Hexxer's Cover (Set)                 611.50  0.39  head/shoulders
#> AQ Sharpened Silithid Femur + Jin'do's Bag  611.38  0.27          weapon
#> current                                     611.11  0.00                
#> AQ Ritssyn's Ring of Chaos                  610.11 -1.00         finger1
#> MC Mana Igniting Cord (Set)                 609.42 -1.69 waist/shoulders
#> Doomcaller's Footwraps                      609.04 -2.07            feet

show_result(my_stats_buffed, my_bank)
#>                                                dps  diff            slot
#> Doomcaller's Mantle                         619.97  8.86       shoulders
#> current                                     611.11  0.00                
#> Zandalarian Hero Charm                      611.01 -0.10        trinket1
#> Briarwood Reed                              610.51 -0.60        trinket1
#> Band of Forced Concentration                609.81 -1.30         finger1
#> Eye of the Beast                            609.71 -1.40        trinket1
#> Doomcaller's Mantle (Set)                   607.92 -3.19       shoulders
#> Choker of the Fire Lord                     607.71 -3.40            neck
#> Band of Dark Dominion                       607.60 -3.51         finger1
#> Royal Seal of Eldre'Thalas                  607.09 -4.02        trinket1
#> Bloodtinged Gloves                          604.78 -6.33           hands
#> Nemesis Gloves                              604.22 -6.89           hands
#> Band of Servitude                           603.41 -7.70         finger1
#> Nemesis Gloves (Set)                        602.43 -8.68 hands/shoulders
show_result(my_stats_ony, my_bank)
#>                                                dps   diff            slot
#> Doomcaller's Mantle                         691.40   9.91       shoulders
#> current                                     681.48   0.00                
#> Zandalarian Hero Charm                      681.38  -0.11        trinket1
#> Band of Forced Concentration                681.01  -0.47         finger1
#> Briarwood Reed                              680.82  -0.67        trinket1
#> Choker of the Fire Lord                     678.84  -2.65            neck
#> Band of Dark Dominion                       678.64  -2.85         finger1
#> Doomcaller's Mantle (Set)                   677.96  -3.52       shoulders
#> Eye of the Beast                            677.57  -3.91        trinket1
#> Royal Seal of Eldre'Thalas                  677.00  -4.48        trinket1
#> Bloodtinged Gloves                          674.46  -7.03           hands
#> Band of Servitude                           673.91  -7.57         finger1
#> Nemesis Gloves                              672.50  -8.98           hands
#> Nemesis Gloves (Set)                        670.55 -10.93 hands/shoulders
show_result(my_stats_unbuffed, my_bank)
#>                                                dps  diff            slot
#> Doomcaller's Mantle                         558.00  8.21       shoulders
#> current                                     549.79  0.00                
#> Zandalarian Hero Charm                      549.70 -0.08        trinket1
#> Briarwood Reed                              549.52 -0.27        trinket1
#> Band of Forced Concentration                549.00 -0.79         finger1
#> Band of Dark Dominion                       548.06 -1.73         finger1
#> Eye of the Beast                            547.41 -2.37        trinket1
#> Choker of the Fire Lord                     547.26 -2.53            neck
#> Royal Seal of Eldre'Thalas                  546.62 -3.16        trinket1
#> Doomcaller's Mantle (Set)                   546.03 -3.76       shoulders
#> Band of Servitude                           543.57 -6.22         finger1
#> Bloodtinged Gloves                          543.00 -6.79           hands
#> Nemesis Gloves                              542.51 -7.27           hands
#> Nemesis Gloves (Set)                        540.18 -9.60 hands/shoulders
```
