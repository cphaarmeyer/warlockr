
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 281,
  sp = 618 + 63,
  crit = 8,
  hit = 10,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  328  786   19   10    0

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
#> weight 0.3829861 1.0000000 13.944273 13.265929 0.3330711
#> dps    0.2054565 0.5364593  7.480535  7.116631 0.1786791
show_statweights(my_stats_ony)
#>              int        sp     crit       hit       mp5
#> weight 0.3635583 1.0000000 11.79336 13.160356 0.3431187
#> dps    0.2178594 0.5992421  7.06708  7.886239 0.2056112
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3678712 1.0000000 13.079603 12.199067 0.3120824
#> dps    0.1941530 0.5277745  6.903081  6.438357 0.1647091

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff      slot
#> Soulseeker                    676.77 22.49    weapon
#> Brimstone Staff               676.35 22.08    weapon
#> Wraith Blade + Jin'do's Bag   673.99 19.71    weapon
#> Cloak of the Necropolis       663.53  9.26      back
#> Leggings of Polarity          661.19  6.91      legs
#> Doomfinger                    660.71  6.44      wand
#> Wand of Fates                 659.54  5.27      wand
#> AQ Dark Storm Gauntlets       658.83  4.56     hands
#> Plagueheart Shoulderpads      658.64  4.36 shoulders
#> AQ Cloak of the Devoured      657.92  3.64      back
#> AQ Eyestalk Waist Cord        657.41  3.13     waist
#> Gem of Trapped Innocents      655.81  1.53      neck
#> Rockfury Bracers              654.86  0.58     wrist
#> The Soul Harvester's Bindings 654.39  0.11     wrist
#> current                       654.28  0.00          
#> Seal of the Damned            653.69 -0.58   finger1

show_result(my_stats_buffed, my_bank)
#>                                  dps   diff     slot
#> Talisman of Ephemeral Power   654.44   0.17 trinket1
#> Zandalarian Hero Charm        654.34   0.07 trinket1
#> current                       654.28   0.00         
#> Doomcaller's Robes            640.84 -13.43    chest
#> Garb of Royal Ascension       638.16 -16.12    chest
show_result(my_stats_ony, my_bank)
#>                                  dps   diff     slot
#> Talisman of Ephemeral Power   728.06   0.18 trinket1
#> Zandalarian Hero Charm        727.94   0.07 trinket1
#> current                       727.87   0.00         
#> Doomcaller's Robes            713.04 -14.83    chest
#> Garb of Royal Ascension       711.68 -16.19    chest
show_result(my_stats_unbuffed, my_bank)
#>                                  dps   diff     slot
#> Talisman of Ephemeral Power   592.12   0.32 trinket1
#> Zandalarian Hero Charm        592.00   0.20 trinket1
#> current                       591.81   0.00         
#> Doomcaller's Robes            579.21 -12.59    chest
#> Garb of Royal Ascension       575.99 -15.82    chest
```
