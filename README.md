
<!-- README.md is generated from README.Rmd. Please edit that file -->

# warlockr

The goal of warlockr is to collect useful functions for Warlocks in WoW
Classic. Right now this is mostly about simulating the DPS. The starting
point was
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

  - computing how much a stat inceases your dps (stat weights)
  - computing the impact of an item on your dps (compare items)

But first we set up the simulation with our current stats.

``` r
library(warlockr)
my_stats <- list(
  int = 258 + 31 + 12, # with buffs
  sp = 168 + 33 + 26 + 27, # shadow spell damage
  crit = 3,
  hit = 3
)
```

The `compute_statweights` function first simluates your DPS. Then for
every stat it simulates the dps with that stat increased by 1. The
weights are the difference in DPS.

``` r
set.seed(42)
my_weights <- compute_statweights(my_stats)
my_weights
#>        int         sp       crit        hit        mp5 
#> 0.11018689 0.40267577 4.63549578 3.63483455 0.01678176
```

The `compare_items` function works very similar. As additional input it
takes a list of items in which you specify the stat differences.

``` r
items <- list(
  "Robe of the Void" = list(hit = -1, int = -20, sp = 33),
  "Felcloth Shoulder" = list(int = -17, sp = 17),
  "Burial Shawl" = list(int = -1, sp = 11),
  "Shroud of the Nathrezim" = list(int = -1, crit = 1),
  "Deep Woodlands Cloak" = list(int = 9, sp = -6)
)
set.seed(42)
df <- compare_items(my_stats, items = items)
df[order(-df$dps), ]
#>                              dps       diff
#> Robe of the Void        335.0949  7.7611997
#> Felcloth Shoulder       332.7232  5.3895119
#> Shroud of the Nathrezim 331.9091  4.5753669
#> Burial Shawl            331.7885  4.4547772
#> current                 327.3337  0.0000000
#> Deep Woodlands Cloak    326.3356 -0.9980676
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>        int         sp       crit        hit        mp5 
#> 0.10022948 0.45677110 4.18339646 4.13774837 0.01795692
set.seed(42)
df_ony <- compare_items(my_stats, items = items)
df_ony[order(-df_ony$dps), ]
#>                              dps      diff
#> Robe of the Void        380.5442  9.144664
#> Felcloth Shoulder       377.8230  6.423492
#> Burial Shawl            376.4630  5.063513
#> Shroud of the Nathrezim 375.5234  4.123893
#> current                 371.3995  0.000000
#> Deep Woodlands Cloak    370.1150 -1.284497
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
