
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 267 + 31 + 16,
  sp = 512 + 63 + 40,
  crit = 7,
  hit = 10,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  314  615    7   10    0

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
#>  0.3896332  1.0000000 13.3798316 12.0095412  0.3133212
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3467101  1.0000000 11.2030829 11.9633811  0.3257960

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 580.50 16.52            head
#> Doomcaller's Circlet                        578.88 14.91            head
#> BWL Mish'undare, Circlet of the Mind (Set)  576.90 12.92  head/shoulders
#> Doomcaller's Circlet (Set)                  575.07 11.10  head/shoulders
#> AQ Dustwind Turban                          572.68  8.70            head
#> AQ Eyestalk Waist Cord                      572.32  8.34           waist
#> AQ Sharpened Silithid Femur + Royal Scepter 571.63  7.65          weapon
#> AQ Ring of the Fallen God                   570.90  6.92         finger1
#> Fel Infused Leggings                        570.34  6.36            legs
#> AQ Dustwind Turban (Set)                    569.01  5.03  head/shoulders
#> AQ Eyestalk Waist Cord (Set)                568.58  4.61 waist/shoulders
#> Leggings of the Black Blizzard              568.45  4.48            legs
#> AQ Dark Storm Gauntlets                     567.50  3.52           hands
#> AQ Cloak of the Devoured                    567.48  3.50            back
#> ZG The Hexxer's Cover                       567.31  3.33            head
#> Doomcaller's Trousers                       566.25  2.27            legs
#> Doomcaller's Robes                          565.96  1.98           chest
#> AQ Blessed Quiraji Acolyte Staff            565.81  1.84          weapon
#> MC Mana Igniting Cord                       565.33  1.35           waist
#> Rockfury Bracers                            564.65  0.67           wrist
#> AQ Wand of Quiraji Nobility                 564.43  0.45            wand
#> AQ Ritssyn's Ring of Chaos                  564.17  0.20         finger1
#> AQ Sharpened Silithid Femur + Jin'do's Bag  564.07  0.09          weapon
#> current                                     563.98  0.00            <NA>
#> ZG The Hexxer's Cover (Set)                 563.76 -0.22  head/shoulders
#> Doomcaller's Footwraps                      562.34 -1.63            feet
#> MC Mana Igniting Cord (Set)                 561.78 -2.20 waist/shoulders

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Doomcaller's Mantle                         572.28  8.30       shoulders
#> current                                     563.98  0.00            <NA>
#> Zandalarian Hero Charm                      563.57 -0.41        trinket1
#> Briarwood Reed                              563.01 -0.96        trinket1
#> Band of Dark Dominion                       562.71 -1.27         finger1
#> Eye of the Beast                            561.37 -2.61        trinket1
#> Choker of the Fire Lord                     560.96 -3.01            neck
#> Doomcaller's Mantle (Set)                   560.32 -3.66       shoulders
#> Royal Seal of Eldre'Thalas                  559.92 -4.05        trinket1
#> Band of Servitude                           558.18 -5.80         finger1
#> Bloodtinged Gloves                          557.23 -6.75           hands
#> Nemesis Gloves                              556.68 -7.30           hands
#> Nemesis Gloves (Set)                        554.42 -9.56 hands/shoulders
show_result(my_stats_ony, my_bank)
#>                                                dps   diff            slot
#> Doomcaller's Mantle                         639.23   9.31       shoulders
#> current                                     629.92   0.00            <NA>
#> Zandalarian Hero Charm                      629.45  -0.46        trinket1
#> Briarwood Reed                              628.84  -1.07        trinket1
#> Band of Dark Dominion                       628.61  -1.31         finger1
#> Choker of the Fire Lord                     627.66  -2.26            neck
#> Doomcaller's Mantle (Set)                   625.86  -4.05       shoulders
#> Royal Seal of Eldre'Thalas                  625.39  -4.52        trinket1
#> Eye of the Beast                            624.75  -5.16        trinket1
#> Band of Servitude                           623.48  -6.44         finger1
#> Bloodtinged Gloves                          622.41  -7.51           hands
#> Nemesis Gloves                              620.58  -9.34           hands
#> Nemesis Gloves (Set)                        618.10 -11.82 hands/shoulders
```
