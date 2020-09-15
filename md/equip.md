
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- with_buffs(list(
  int = 267,
  sp = 512 + 63,
  crit = 7,
  hit = 10,
  mp5 = 0
),
consumables = "eosp"
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  314  615    7   10    0

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
#>              int       sp      crit      hit       mp5
#> weight 0.3718787 1.000000 13.651763 12.11839 0.3282705
#> dps    0.1890858 0.508461  6.941388  6.16173 0.1669128
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3430957 1.0000000 11.413561 12.036725 0.3282996
#> dps    0.1965404 0.5728441  6.538191  6.895167 0.1880645

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 579.96 16.51            head
#> Doomcaller's Circlet                        578.34 14.89            head
#> BWL Mish'undare, Circlet of the Mind (Set)  576.34 12.90  head/shoulders
#> Doomcaller's Circlet (Set)                  574.55 11.10  head/shoulders
#> AQ Dustwind Turban                          572.14  8.70            head
#> AQ Eyestalk Waist Cord                      571.78  8.33           waist
#> AQ Sharpened Silithid Femur + Royal Scepter 571.08  7.63          weapon
#> AQ Ring of the Fallen God                   570.38  6.93         finger1
#> Fel Infused Leggings                        569.81  6.36            legs
#> AQ Dustwind Turban (Set)                    568.46  5.01  head/shoulders
#> AQ Eyestalk Waist Cord (Set)                568.04  4.59 waist/shoulders
#> Leggings of the Black Blizzard              567.91  4.47            legs
#> AQ Dark Storm Gauntlets                     566.95  3.50           hands
#> AQ Cloak of the Devoured                    566.94  3.50            back
#> ZG The Hexxer's Cover                       566.77  3.32            head
#> Doomcaller's Trousers                       565.72  2.27            legs
#> Doomcaller's Robes                          565.41  1.97           chest
#> AQ Blessed Quiraji Acolyte Staff            565.26  1.81          weapon
#> MC Mana Igniting Cord                       564.80  1.35           waist
#> Rockfury Bracers                            564.11  0.66           wrist
#> AQ Wand of Quiraji Nobility                 563.90  0.45            wand
#> AQ Ritssyn's Ring of Chaos                  563.66  0.21         finger1
#> AQ Sharpened Silithid Femur + Jin'do's Bag  563.52  0.07          weapon
#> current                                     563.45  0.00                
#> ZG The Hexxer's Cover (Set)                 563.23 -0.22  head/shoulders
#> Doomcaller's Footwraps                      561.82 -1.63            feet
#> MC Mana Igniting Cord (Set)                 561.26 -2.19 waist/shoulders

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Doomcaller's Mantle                         571.75  8.30       shoulders
#> current                                     563.45  0.00                
#> Zandalarian Hero Charm                      563.36 -0.09        trinket1
#> Briarwood Reed                              563.01 -0.43        trinket1
#> Band of Dark Dominion                       562.18 -1.27         finger1
#> Eye of the Beast                            561.37 -2.08        trinket1
#> Choker of the Fire Lord                     560.43 -3.01            neck
#> Royal Seal of Eldre'Thalas                  559.92 -3.52        trinket1
#> Doomcaller's Mantle (Set)                   559.78 -3.67       shoulders
#> Band of Servitude                           557.66 -5.79         finger1
#> Bloodtinged Gloves                          556.69 -6.76           hands
#> Nemesis Gloves                              556.14 -7.31           hands
#> Nemesis Gloves (Set)                        553.87 -9.58 hands/shoulders
show_result(my_stats_ony, my_bank)
#>                                                dps   diff            slot
#> Doomcaller's Mantle                         638.63   9.30       shoulders
#> current                                     629.33   0.00                
#> Zandalarian Hero Charm                      629.22  -0.12        trinket1
#> Briarwood Reed                              628.84  -0.49        trinket1
#> Band of Dark Dominion                       628.02  -1.32         finger1
#> Choker of the Fire Lord                     627.07  -2.26            neck
#> Royal Seal of Eldre'Thalas                  625.39  -3.94        trinket1
#> Doomcaller's Mantle (Set)                   625.26  -4.07       shoulders
#> Eye of the Beast                            624.75  -4.58        trinket1
#> Band of Servitude                           622.90  -6.43         finger1
#> Bloodtinged Gloves                          621.80  -7.53           hands
#> Nemesis Gloves                              619.97  -9.36           hands
#> Nemesis Gloves (Set)                        617.48 -11.86 hands/shoulders
```
