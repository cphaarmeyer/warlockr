
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 284,
  sp = 750,
  crit = 8,
  hit = 10,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  331  855   19   10    0

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
#>              int        sp     crit       hit       mp5
#> weight 0.3957157 1.0000000 14.67886 13.971777 0.3428627
#> dps    0.2129558 0.5381534  7.89948  7.518959 0.1845127
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3748017 1.0000000 12.417142 13.854102 0.3558698
#> dps    0.2252783 0.6010601  7.463449  8.327148 0.2138991
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3811595 1.0000000 13.821641 12.928355 0.3255295
#> dps    0.2017367 0.5292711  7.315395  6.842605 0.1722934

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff     slot
#> Mark of the Champion          710.91 19.55 trinket1
#> Cloak of the Necropolis       701.22  9.87     back
#> Leggings of Polarity          698.87  7.52     legs
#> Doomfinger                    698.10  6.75     wand
#> Wand of Fates                 697.07  5.71     wand
#> AQ Dark Storm Gauntlets       696.21  4.85    hands
#> Plagueheart Leggings          695.78  4.42     legs
#> AQ Cloak of the Devoured      695.17  3.82     back
#> AQ Eyestalk Waist Cord        694.30  2.94    waist
#> Gem of Trapped Innocents      693.25  1.89     neck
#> Rockfury Bracers              691.85  0.50    wrist
#> The Soul Harvester's Bindings 691.43  0.07    wrist
#> current                       691.35  0.00         
#> Seal of the Damned            691.31 -0.04  finger1

show_result(my_stats_buffed, my_bank)
#>                                  dps   diff     slot
#> current                       691.35   0.00         
#> Talisman of Ephemeral Power   681.56  -9.79 trinket1
#> Zandalarian Hero Charm        681.46  -9.89 trinket1
#> Briarwood Reed                681.27 -10.08 trinket1
show_result(my_stats_ony, my_bank)
#>                                  dps   diff     slot
#> current                       769.07   0.00         
#> Talisman of Ephemeral Power   758.17 -10.89 trinket1
#> Zandalarian Hero Charm        758.07 -11.00 trinket1
#> Briarwood Reed                757.85 -11.21 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                  dps   diff     slot
#> current                       628.45   0.00         
#> Talisman of Ephemeral Power   618.79  -9.66 trinket1
#> Zandalarian Hero Charm        618.71  -9.74 trinket1
#> Briarwood Reed                618.42 -10.03 trinket1
```
