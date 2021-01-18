
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 272,
  sp = 559 + 63,
  crit = 9,
  hit = 12,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  319  727   20   12    0

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
#> weight 0.3678745 1.0000000 13.277954 12.346551 0.3060327
#> dps    0.2017607 0.5484499  7.282293  6.771465 0.1678436
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3500681 1.0000000 11.285227 12.300095 0.3274560
#> dps    0.2133045 0.6093227  6.876345  7.494727 0.1995264
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3549970 1.0000000 12.314881 11.317229 0.3124599
#> dps    0.1914231 0.5392246  6.640487  6.102529 0.1684861

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff      slot
#> Soulseeker                    665.27 23.21    weapon
#> Brimstone Staff               664.20 22.13    weapon
#> Wraith Blade + Jin'do's Bag   662.07 20.00    weapon
#> Cloak of the Necropolis       650.87  8.80      back
#> Plagueheart Robe              650.13  8.07     chest
#> Plagueheart Sandals           649.39  7.33      feet
#> Leggings of Polarity          648.55  6.48      legs
#> Doomfinger                    648.28  6.22      wand
#> Wand of Fates                 646.79  4.72      wand
#> Plagueheart Shoulderpads      646.49  4.43 shoulders
#> Band of the Inevitable        646.45  4.39   finger1
#> AQ Dark Storm Gauntlets       646.27  4.21     hands
#> AQ Cloak of the Devoured      645.73  3.66      back
#> Seal of the Damned            645.73  3.66   finger1
#> AQ Eyestalk Waist Cord        645.21  3.14     waist
#> Gem of Trapped Innocents      643.60  1.53      neck
#> Rockfury Bracers              642.80  0.74     wrist
#> The Soul Harvester's Bindings 642.28  0.22     wrist
#> current                       642.07  0.00

show_result(my_stats_buffed, my_bank)
#>                                  dps  diff     slot
#> Doomcaller's Robes            643.66  1.60    chest
#> Talisman of Ephemeral Power   642.21  0.14 trinket1
#> Zandalarian Hero Charm        642.11  0.04 trinket1
#> current                       642.07  0.00         
#> Garb of Royal Ascension       640.85 -1.22    chest
show_result(my_stats_ony, my_bank)
#>                                  dps  diff     slot
#> Doomcaller's Robes            713.86  0.60    chest
#> Talisman of Ephemeral Power   713.41  0.15 trinket1
#> Zandalarian Hero Charm        713.30  0.04 trinket1
#> current                       713.25  0.00         
#> Garb of Royal Ascension       712.21 -1.04    chest
show_result(my_stats_unbuffed, my_bank)
#>                                  dps  diff     slot
#> Doomcaller's Robes            580.67  2.49    chest
#> Talisman of Ephemeral Power   578.52  0.35 trinket1
#> Zandalarian Hero Charm        578.41  0.23 trinket1
#> current                       578.17  0.00         
#> Garb of Royal Ascension       577.28 -0.89    chest
```
