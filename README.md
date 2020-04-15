
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![R build
status](https://github.com/cphaarmeyer/warlockr/workflows/R-CMD-check/badge.svg)](https://github.com/cphaarmeyer/warlockr/actions)
<!-- badges: end -->

# warlockr

The goal of warlockr is to collect useful functions for Warlocks in WoW
Classic. Furthermore it should only have minimal package dependencies.
Right now this is mostly about simulating the DPS. The starting point
was
[this](https://www.reddit.com/r/classicwow/comments/dh5r6g/so_i_made_a_warlock_shadowbolt_simulator/)
Reddit post by [u/natehax](https://www.reddit.com/user/natehax/).

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cphaarmeyer/warlockr")
```

## Example

There are two main uses of the DPS simulation:

  - computing how much a stat increases your DPS (stat weights)
  - computing the impact of an item on your DPS (compare equip)

But first we set up the simulation with our current stats.

``` r
library(warlockr)
my_stats <- list(
  int = 228 + 31 + 16, # with buffs
  sp = 375 + 86 + 40, # shadow spell damage
  crit = 5,
  hit = 1
)
```

The `compute_statweights` function simulates the DPS in the neighborhood
of your current stats. Then it evaluates the impact of every stat and
scales such that spell power has weight 1.

``` r
set.seed(42)
my_weights <- compute_statweights(my_stats)
my_weights
#>        int         sp       crit        hit        mp5 
#>  0.3388921  1.0000000 11.7802173 10.9839519  0.3471447
```

To use the `compare_equip` function we need a list of our current items.
If your just want a quick comparison see `compare_items`.

``` r
my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 9, hit = 1),
  shoulders = list(sp = 26),
  back = list(sp = 18),
  chest = list(sp = 46),
  wrist = list(int = 11, sp = 13),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 9, sp = 27),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(crit = 2),
  trinket2 = list(sp = 29),
  weapon = list(int = 12, sp = 60, crit = 1), # includes off hand
  wand = list(int = 4, sp = 11)
)
```

Next we need a list of which items to change.

``` r
my_changes <- list(
  "Royal Seal of Eldre'Thalas" = list(
    trinket1 = list(sp = 23)
  ),
  "Talisman of Ephemeral Power" = list(
    trinket1 = "toep"
  ),
  "Zandalarian Hero Charm" = list(
    trinket1 = "zhc"
  ),
  "Dragonslayer's Signet" = list(
    finger1 = list(int = 10, crit = 1)
  ),
  "Ring of Spell Power" = list(
    finger1 = list(sp = 33)
  ),
  "Ring of Blackrock" = list(
    finger1 = list(sp = 19, mp5 = 9)
  ),
  "Band of Forced Concentration" = list(
    finger1 = list(int = 12, sp = 21, hit = 1)
  ),
  "Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 2, mp5 = 4)
  ),
  "Zanzil's Seal" = list(
    finger1 = list(int = 10, sp = 11, hit = 1)
  ),
  "Band of Servitude" = list(
    finger1 = list(int = 9, sp = 23)
  )
)
```

Now we can simulate.

``` r
set.seed(42)
df <- compare_equip(my_stats, my_equip, my_changes)
df[order(-df$dps), ]
#>                                   dps       diff
#> Band of Forced Concentration 420.4064  6.9403011
#> Ring of Spell Power          419.0524  5.5863193
#> Talisman of Ephemeral Power  418.0182  4.5520888
#> Zandalarian Hero Charm       416.5446  3.0785102
#> Band of Servitude            415.9064  2.4403568
#> Zanzil's Seal                415.6928  2.2266931
#> Zanzil's Concentration       414.7751  1.3090036
#> Ring of Blackrock            414.0943  0.6282092
#> current                      413.4661  0.0000000
#> Royal Seal of Eldre'Thalas   412.8764 -0.5896412
#> Dragonslayer's Signet        411.0963 -2.3698232
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>        int         sp       crit        hit        mp5 
#>  0.3068978  1.0000000  9.9262208 11.0274521  0.3506991
set.seed(42)
df_ony <- compare_equip(my_stats, my_equip, my_changes)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff
#> Band of Forced Concentration 472.0794  7.7322541
#> Talisman of Ephemeral Power  471.3969  7.0497012
#> Ring of Spell Power          470.6959  6.3487185
#> Zandalarian Hero Charm       469.7370  5.3898680
#> Band of Servitude            467.0664  2.7192526
#> Zanzil's Seal                466.8085  2.4613136
#> Zanzil's Concentration       465.7183  1.3711674
#> Royal Seal of Eldre'Thalas   465.6070  1.2598763
#> Ring of Blackrock            465.1270  0.7798082
#> current                      464.3472  0.0000000
#> Dragonslayer's Signet        460.8118 -3.5353641
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
