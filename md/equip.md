
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
consumables = c("gae", "eosp", "bwo")
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  314  680    8   10    0

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
#> weight 0.3619131 1.0000000 14.083848 12.732024 0.2668214
#> dps    0.1880581 0.5196223  7.318281  6.615843 0.1386463
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3398773 1.0000000 11.849965 12.768214 0.2746858
#> dps    0.1968847 0.5792817  6.864467  7.396392 0.1591205

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Mish'undare, Circlet of the Mind Flayer 621.32 17.39            head
#> Doomcaller's Circlet                        619.89 15.97            head
#> BWL Mish'undare, Circlet of the Mind (Set)  617.82 13.90  head/shoulders
#> Doomcaller's Circlet (Set)                  616.30 12.37  head/shoulders
#> AQ Dustwind Turban                          613.10  9.18            head
#> AQ Sharpened Silithid Femur + Royal Scepter 612.27  8.34          weapon
#> AQ Eyestalk Waist Cord                      612.26  8.33           waist
#> AQ Ring of the Fallen God                   611.11  7.19         finger1
#> Fel Infused Leggings                        610.11  6.18            legs
#> AQ Dustwind Turban (Set)                    609.73  5.81  head/shoulders
#> AQ Eyestalk Waist Cord (Set)                609.30  5.37 waist/shoulders
#> Leggings of the Black Blizzard              608.57  4.65            legs
#> AQ Dark Storm Gauntlets                     607.90  3.98           hands
#> AQ Cloak of the Devoured                    607.50  3.57            back
#> ZG The Hexxer's Cover                       607.49  3.56            head
#> Doomcaller's Trousers                       606.36  2.44            legs
#> AQ Blessed Quiraji Acolyte Staff            606.17  2.25          weapon
#> MC Mana Igniting Cord                       605.46  1.53           waist
#> Doomcaller's Robes                          605.45  1.53           chest
#> Rockfury Bracers                            604.82  0.90           wrist
#> AQ Wand of Quiraji Nobility                 604.43  0.51            wand
#> AQ Sharpened Silithid Femur + Jin'do's Bag  604.28  0.35          weapon
#> ZG The Hexxer's Cover (Set)                 604.27  0.35  head/shoulders
#> AQ Ritssyn's Ring of Chaos                  604.24  0.31         finger1
#> current                                     603.92  0.00                
#> MC Mana Igniting Cord (Set)                 602.17 -1.75 waist/shoulders
#> Doomcaller's Footwraps                      601.96 -1.97            feet

show_result(my_stats, my_bank)
#>                                                dps  diff            slot
#> Doomcaller's Mantle                         612.71  8.78       shoulders
#> current                                     603.92  0.00                
#> Zandalarian Hero Charm                      603.83 -0.09        trinket1
#> Briarwood Reed                              603.18 -0.75        trinket1
#> Band of Dark Dominion                       602.41 -1.52         finger1
#> Eye of the Beast                            602.31 -1.62        trinket1
#> Doomcaller's Mantle (Set)                   600.71 -3.22       shoulders
#> Choker of the Fire Lord                     600.62 -3.30            neck
#> Royal Seal of Eldre'Thalas                  600.28 -3.64        trinket1
#> Band of Servitude                           597.84 -6.08         finger1
#> Bloodtinged Gloves                          597.52 -6.40           hands
#> Nemesis Gloves                              596.93 -6.99           hands
#> Nemesis Gloves (Set)                        594.99 -8.94 hands/shoulders
show_result(my_stats_ony, my_bank)
#>                                                dps   diff            slot
#> Doomcaller's Mantle                         683.15   9.82       shoulders
#> current                                     673.32   0.00                
#> Zandalarian Hero Charm                      673.20  -0.12        trinket1
#> Briarwood Reed                              672.49  -0.84        trinket1
#> Band of Dark Dominion                       671.77  -1.56         finger1
#> Choker of the Fire Lord                     670.82  -2.50            neck
#> Doomcaller's Mantle (Set)                   669.77  -3.56       shoulders
#> Royal Seal of Eldre'Thalas                  669.25  -4.07        trinket1
#> Eye of the Beast                            669.20  -4.12        trinket1
#> Band of Servitude                           666.60  -6.73         finger1
#> Bloodtinged Gloves                          666.22  -7.11           hands
#> Nemesis Gloves                              664.28  -9.05           hands
#> Nemesis Gloves (Set)                        662.15 -11.18 hands/shoulders
```
