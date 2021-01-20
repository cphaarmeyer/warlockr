
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 272,
  sp = 581 + 63,
  crit = 8,
  hit = 12,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  319  749   19   12    0

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
#> weight 0.3752592 1.0000000 13.734769 12.607370 0.3145591
#> dps    0.2031033 0.5412349  7.433736  6.823549 0.1702504
show_statweights(my_stats_ony)
#>              int       sp      crit       hit       mp5
#> weight 0.3543286 1.000000 11.615763 12.508354 0.3280212
#> dps    0.2142902 0.604778  7.024958  7.564777 0.1983800
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3623497 1.0000000 12.814901 11.557260 0.3056967
#> dps    0.1933769 0.5336748  6.838989  6.167818 0.1631426

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff      slot
#> Soulseeker                    669.68 23.23    weapon
#> Brimstone Staff               668.44 21.99    weapon
#> Wraith Blade + Jin'do's Bag   666.20 19.75    weapon
#> Cloak of the Necropolis       655.73  9.27      back
#> Plagueheart Robe              654.75  8.30     chest
#> Plagueheart Sandals           653.99  7.53      feet
#> Leggings of Polarity          653.66  7.21      legs
#> Doomfinger                    652.77  6.32      wand
#> Wand of Fates                 651.38  4.93      wand
#> Plagueheart Shoulderpads      650.89  4.44 shoulders
#> AQ Dark Storm Gauntlets       650.54  4.09     hands
#> AQ Cloak of the Devoured      650.24  3.78      back
#> AQ Eyestalk Waist Cord        649.63  3.18     waist
#> Gem of Trapped Innocents      647.76  1.31      neck
#> Rockfury Bracers              647.49  1.04     wrist
#> The Soul Harvester's Bindings 646.82  0.37     wrist
#> current                       646.45  0.00          
#> Seal of the Damned            645.73 -0.72   finger1

show_result(my_stats_buffed, my_bank)
#>                                  dps  diff     slot
#> Doomcaller's Robes            648.37  1.92    chest
#> Talisman of Ephemeral Power   647.31  0.86 trinket1
#> Zandalarian Hero Charm        647.23  0.78 trinket1
#> current                       646.45  0.00         
#> Garb of Royal Ascension       645.53 -0.92    chest
show_result(my_stats_ony, my_bank)
#>                                  dps  diff     slot
#> Talisman of Ephemeral Power   720.32  0.96 trinket1
#> Zandalarian Hero Charm        720.23  0.86 trinket1
#> Doomcaller's Robes            720.14  0.77    chest
#> current                       719.36  0.00         
#> Garb of Royal Ascension       718.58 -0.78    chest
show_result(my_stats_unbuffed, my_bank)
#>                                  dps  diff     slot
#> Doomcaller's Robes            585.52  2.50    chest
#> Talisman of Ephemeral Power   583.59  0.56 trinket1
#> Zandalarian Hero Charm        583.49  0.46 trinket1
#> current                       583.03  0.00         
#> Garb of Royal Ascension       582.17 -0.86    chest
```
