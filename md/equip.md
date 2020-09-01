
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
#>  0.3597823  1.0000000 12.9118083 11.8954869  0.2534432
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3260628  1.0000000 10.8501015 11.8530222  0.2104739

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 566.98 16.42            head
#> Doomcaller's Circlet                        565.44 14.88            head
#> BWL Mish'undare, Circlet of the Mind (Set)  559.27  8.71      head/hands
#> AQ Dustwind Turban                          559.26  8.70            head
#> AQ Eyestalk Waist Cord                      559.04  8.47           waist
#> Doomcaller's Mantle                         558.73  8.17       shoulders
#> AQ Sharpened Silithid Femur + Royal Scepter 558.26  7.70          weapon
#> Doomcaller's Circlet (Set)                  557.84  7.28      head/hands
#> AQ Ring of the Fallen God                   557.63  7.07         finger1
#> Fel Infused Leggings                        557.22  6.66            legs
#> BWL Mantle of the Blackwing Cabal           556.77  6.21       shoulders
#> Leggings of the Black Blizzard              555.27  4.71            legs
#> AQ Cloak of the Devoured                    554.14  3.58            back
#> AQ Dark Storm Gauntlets                     554.09  3.52           hands
#> ZG The Hexxer's Cover                       554.05  3.49            head
#> Doomcaller's Trousers                       553.11  2.54            legs
#> Doomcaller's Robes                          553.01  2.44           chest
#> AQ Blessed Quiraji Acolyte Staff            552.33  1.76          weapon
#> MC Mana Igniting Cord                       552.14  1.58           waist
#> AQ Eyestalk Waist Cord (Set)                551.83  1.27     waist/hands
#> AQ Dustwind Turban (Set)                    551.65  1.09      head/hands
#> Rockfury Bracers                            551.55  0.99           wrist
#> Doomcaller's Mantle (Set)                   551.44  0.87 shoulders/hands
#> AQ Ritssyn's Ring of Chaos                  551.18  0.62         finger1
#> AQ Wand of Quiraji Nobility                 551.10  0.54            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  550.80  0.23          weapon
#> current                                     550.56  0.00            <NA>
#> BWL Mantle of the Blackwing Cabal (Set)     549.58 -0.98 shoulders/hands
#> Doomcaller's Footwraps                      549.16 -1.40            feet
#> ZG The Hexxer's Cover (Set)                 546.92 -3.64      head/hands
#> MC Mana Igniting Cord (Set)                 544.79 -5.77     waist/hands

show_result(my_stats, my_bank)
#>                                                dps  diff     slot
#> current                                     550.56  0.00     <NA>
#> Zandalarian Hero Charm                      550.13 -0.43 trinket1
#> Briarwood Reed                              549.76 -0.80 trinket1
#> Band of Dark Dominion                       549.70 -0.87  finger1
#> Choker of the Fire Lord                     547.79 -2.77     neck
#> Eye of the Beast                            547.74 -2.83 trinket1
#> Royal Seal of Eldre'Thalas                  546.64 -3.93 trinket1
#> Band of Servitude                           545.05 -5.51  finger1
#> Bloodtinged Gloves                          543.77 -6.79    hands
#> Nemesis Gloves                              543.32 -7.25    hands
show_result(my_stats_ony, my_bank)
#>                                                dps  diff     slot
#> current                                     615.26  0.00     <NA>
#> Zandalarian Hero Charm                      614.78 -0.48 trinket1
#> Band of Dark Dominion                       614.40 -0.85  finger1
#> Briarwood Reed                              614.37 -0.89 trinket1
#> Choker of the Fire Lord                     613.36 -1.89     neck
#> Royal Seal of Eldre'Thalas                  610.87 -4.39 trinket1
#> Eye of the Beast                            609.76 -5.50 trinket1
#> Band of Servitude                           609.15 -6.11  finger1
#> Bloodtinged Gloves                          607.70 -7.56    hands
#> Nemesis Gloves                              605.88 -9.37    hands
```
