
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 281,
  sp = 700,
  crit = 8,
  hit = 10,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  328  805   19   10    0

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
#> weight 0.3874420 1.0000000 14.162173 13.457120 0.3298916
#> dps    0.2079715 0.5367811  7.601987  7.223527 0.1770796
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3676307 1.0000000 11.978446 13.352996 0.3413108
#> dps    0.2204132 0.5995506  7.181684  8.005797 0.2046331
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3725577 1.0000000 13.292585 12.397291 0.3178870
#> dps    0.1966629 0.5278724  7.016788  6.544187 0.1678037

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff      slot
#> Soulseeker                    686.92 22.56    weapon
#> Brimstone Staff               686.51 22.15    weapon
#> Wraith Blade + Jin'do's Bag   684.15 19.79    weapon
#> Mark of the Champion          683.83 19.47  trinket1
#> Cloak of the Necropolis       673.67  9.31      back
#> Leggings of Polarity          671.45  7.09      legs
#> Doomfinger                    670.73  6.37      wand
#> Wand of Fates                 669.66  5.30      wand
#> AQ Dark Storm Gauntlets       668.85  4.49     hands
#> Plagueheart Shoulderpads      668.60  4.24 shoulders
#> AQ Cloak of the Devoured      667.96  3.60      back
#> AQ Eyestalk Waist Cord        667.39  3.03     waist
#> Gem of Trapped Innocents      665.88  1.52      neck
#> Rockfury Bracers              664.84  0.48     wrist
#> The Soul Harvester's Bindings 664.40  0.04     wrist
#> current                       664.36  0.00          
#> Seal of the Damned            663.89 -0.47   finger1

show_result(my_stats_buffed, my_bank)
#>                                  dps   diff     slot
#> current                       664.36   0.00         
#> Talisman of Ephemeral Power   654.44  -9.92 trinket1
#> Zandalarian Hero Charm        654.34 -10.02 trinket1
#> Briarwood Reed                654.28 -10.08 trinket1
show_result(my_stats_ony, my_bank)
#>                                  dps   diff     slot
#> current                       739.09   0.00         
#> Talisman of Ephemeral Power   728.06 -11.04 trinket1
#> Zandalarian Hero Charm        727.94 -11.15 trinket1
#> Briarwood Reed                727.87 -11.22 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                  dps  diff     slot
#> current                       601.79  0.00         
#> Talisman of Ephemeral Power   592.12 -9.67 trinket1
#> Zandalarian Hero Charm        592.00 -9.79 trinket1
#> Briarwood Reed                591.81 -9.99 trinket1
```
