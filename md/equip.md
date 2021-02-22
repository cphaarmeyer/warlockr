
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 283,
  sp = 742,
  crit = 8,
  hit = 10,
  mp5 = 0
)

my_stats_unbuffed <- with_buffs(my_stats)
my_stats_buffed <- with_buffs(my_stats, consumables = c("gae", "eosp", "bwo"))
my_stats_ony <- add_buff(my_stats_buffed, "ony")
unlist(my_stats_ony)
#>  int   sp crit  hit  mp5 
#>  330  847   19   10    0

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
#> weight 0.3938557 1.0000000 14.580853 13.873791 0.3414183
#> dps    0.2119836 0.5382267  7.847805  7.467245 0.1837604
show_statweights(my_stats_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3735966 1.0000000 12.345268 13.772153 0.3528096
#> dps    0.2244648 0.6008214  7.417301  8.274604 0.2119756
show_statweights(my_stats_unbuffed)
#>              int        sp      crit       hit       mp5
#> weight 0.3782030 1.0000000 13.728220 12.835632 0.3254351
#> dps    0.2001603 0.5292404  7.265528  6.793135 0.1722334

show_result(my_stats_buffed, my_changes)
#>                                  dps  diff      slot
#> Mark of the Champion          706.52 19.60  trinket1
#> Cloak of the Necropolis       696.54  9.62      back
#> Leggings of Polarity          694.43  7.51      legs
#> Doomfinger                    693.74  6.82      wand
#> Wand of Fates                 692.53  5.62      wand
#> AQ Dark Storm Gauntlets       691.66  4.74     hands
#> Plagueheart Shoulderpads      691.35  4.43 shoulders
#> AQ Cloak of the Devoured      690.49  3.57      back
#> AQ Eyestalk Waist Cord        689.99  3.07     waist
#> Gem of Trapped Innocents      688.76  1.84      neck
#> Rockfury Bracers              687.61  0.69     wrist
#> The Soul Harvester's Bindings 687.03  0.11     wrist
#> current                       686.92  0.00          
#> Seal of the Damned            686.85 -0.07   finger1

show_result(my_stats_buffed, my_bank)
#>                                  dps   diff     slot
#> current                       686.92   0.00         
#> Talisman of Ephemeral Power   677.19  -9.73 trinket1
#> Zandalarian Hero Charm        677.08  -9.83 trinket1
#> Briarwood Reed                676.77 -10.15 trinket1
show_result(my_stats_ony, my_bank)
#>                                  dps   diff     slot
#> current                       764.17   0.00         
#> Talisman of Ephemeral Power   753.33 -10.83 trinket1
#> Zandalarian Hero Charm        753.22 -10.95 trinket1
#> Briarwood Reed                752.87 -11.30 trinket1
show_result(my_stats_unbuffed, my_bank)
#>                                  dps   diff     slot
#> current                       623.99   0.00         
#> Talisman of Ephemeral Power   614.47  -9.52 trinket1
#> Zandalarian Hero Charm        614.38  -9.61 trinket1
#> Briarwood Reed                613.56 -10.43 trinket1
```
