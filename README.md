
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
  int = 238 + 31 + 16, # with buffs
  sp = 402 + 59 + 40, # shadow spell damage
  crit = 5,
  hit = 2
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
#>  0.3386380  1.0000000 12.1194592 11.3058433  0.3336297
```

To use the `compare_equip` function we need a list of our current items.
If your just want a quick comparison see `compare_items`.

``` r
my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 9, hit = 1),
  shoulders = list(sp = 26),
  back = list(int = 6, sp = 23),
  chest = list(sp = 46),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(crit = 2),
  trinket2 = list(sp = 29),
  weapon = list(int = 12, sp = 40 + 20, crit = 1), # includes off hand
  wand = list(int = 4, sp = 11)
)
```

Next we need a list of which items to change.

``` r
my_changes <- list(
  "Royal Seal of Eldre'Thalas" =
    list(trinket1 = list(sp = 23)),
  "Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "Zandalarian Hero Charm" =
    list(trinket1 = "zhc"),
  "Dragonslayer's Signet" =
    list(finger1 = list(int = 10, crit = 1)),
  "Ring of Spell Power" =
    list(finger1 = list(sp = 33)),
  "Ring of Blackrock" =
    list(finger1 = list(sp = 19, mp5 = 9)),
  "Band of Forced Concentration" =
    list(finger1 = list(int = 12, sp = 21, hit = 1)),
  "Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "Zanzil's Seal" =
    list(finger1 = list(int = 10, sp = 11, hit = 1)),
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23))
)
```

Now we can simulate.

``` r
set.seed(42)
df <- compare_equip(my_stats, my_equip, my_changes)
df[order(-df$dps), ]
#>                                   dps       diff            slot
#> Band of Forced Concentration 426.9740  7.0596202         finger1
#> Ring of Spell Power          425.5837  5.6692934         finger1
#> Talisman of Ephemeral Power  425.4945  5.5800840        trinket1
#> Zandalarian Hero Charm       423.7274  3.8129614        trinket1
#> Band of Servitude            422.4070  2.4925574         finger1
#> Zanzil's Seal                422.1253  2.2109347         finger1
#> Zanzil's Concentration       421.2258  1.3114073 finger1/finger2
#> Ring of Blackrock            420.4470  0.5325703         finger1
#> current                      419.9144  0.0000000            <NA>
#> Royal Seal of Eldre'Thalas   419.3462 -0.5682540        trinket1
#> Dragonslayer's Signet        417.2600 -2.6543872         finger1
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>        int         sp       crit        hit        mp5 
#>  0.3081963  1.0000000 10.1806983 11.3439061  0.3016408
set.seed(42)
df_ony <- compare_equip(my_stats, my_equip, my_changes)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff            slot
#> Talisman of Ephemeral Power  479.6425  8.1743857        trinket1
#> Band of Forced Concentration 479.3577  7.8895720         finger1
#> Ring of Spell Power          477.9219  6.4537812         finger1
#> Zandalarian Hero Charm       477.6385  6.1702955        trinket1
#> Band of Servitude            474.2509  2.7827652         finger1
#> Zanzil's Seal                473.9369  2.4687831         finger1
#> Zanzil's Concentration       472.7997  1.3315855 finger1/finger2
#> Royal Seal of Eldre'Thalas   472.7116  1.2434661        trinket1
#> Ring of Blackrock            472.1537  0.6855659         finger1
#> current                      471.4682  0.0000000            <NA>
#> Dragonslayer's Signet        467.5589 -3.9092764         finger1
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
