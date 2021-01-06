
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 268,
  sp = 550 + 63,
  crit = 9,
  hit = 12,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  315  718   20   12    0

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
#> weight 0.3669211 1.0000000 13.181068 12.253064 0.3071099
#> dps    0.2008571 0.5474122  7.215478  6.707477 0.1681157
show_statweights(my_stats_ony)
#>              int        sp      crit       hit      mp5
#> weight 0.3486154 1.0000000 11.182491 12.183145 0.325527
#> dps    0.2123389 0.6090922  6.811168  7.420659 0.198276
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3543474 1.0000000 12.214644 11.217186 0.3110143
#> dps    0.1909291 0.5388191  6.581484  6.044034 0.1675805

show_result(my_stats_buffed, my_changes)
#>                                   dps  diff  slot
#> AQ Eyestalk Waist Cord         645.21  8.27 waist
#> Fel Infused Leggings           643.07  6.13  legs
#> Leggings of the Black Blizzard 640.71  3.77  legs
#> AQ Cloak of the Devoured       640.58  3.64  back
#> AQ Dark Storm Gauntlets        640.39  3.45 hands
#> Doomcaller's Trousers          638.26  1.33  legs
#> MC Mana Igniting Cord          638.18  1.24 waist
#> Doomcaller's Robes             638.04  1.10 chest
#> AQ Wand of Quiraji Nobility    637.67  0.73  wand
#> current                        636.94  0.00      
#> Rockfury Bracers               636.60 -0.33 wrist

show_result(my_stats_buffed, my_bank)
#>                                   dps  diff     slot
#> current                        636.94  0.00         
#> Talisman of Ephemeral Power    636.52 -0.42 trinket1
#> Zandalarian Hero Charm         636.43 -0.51 trinket1
#> Band of Forced Concentration   634.78 -2.16  finger1
#> Eye of the Beast               634.42 -2.52 trinket1
#> Band of Dark Dominion          633.63 -3.31  finger1
#> Choker of the Fire Lord        633.53 -3.41     neck
show_result(my_stats_ony, my_bank)
#>                                   dps  diff     slot
#> current                        707.65  0.00         
#> Talisman of Ephemeral Power    707.19 -0.46 trinket1
#> Zandalarian Hero Charm         707.08 -0.57 trinket1
#> Band of Forced Concentration   706.21 -1.44  finger1
#> Band of Dark Dominion          705.05 -2.60  finger1
#> Choker of the Fire Lord        705.02 -2.63     neck
#> Eye of the Beast               702.65 -5.00 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                   dps  diff     slot
#> Talisman of Ephemeral Power    572.90  0.24 trinket1
#> Zandalarian Hero Charm         572.81  0.15 trinket1
#> current                        572.66  0.00         
#> Band of Forced Concentration   571.77 -0.89  finger1
#> Band of Dark Dominion          571.03 -1.63  finger1
#> Choker of the Fire Lord        569.90 -2.76     neck
#> Eye of the Beast               569.74 -2.92 trinket1
```
