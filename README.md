
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
  int = 223 + 31 + 12, # with buffs
  sp = 312 + 26 + 33 + 27 + 40, # shadow spell damage
  crit = 3,
  hit = 2
)
```

The `compute_statweights` function first simluates your DPS. Then for
every stat it simulates the dps with that stat increased by 1. The
weights are the difference in DPS.

``` r
set.seed(42)
my_weights <- compute_statweights(my_stats)
my_weights
#>          int           sp         crit          hit          mp5 
#>  0.237446277  1.000000000 13.891408930 11.260823773  0.008799019
```

The `compare_items` function works very similar. As additional input it
takes a list of items in which you specify the stat differences.

``` r
items <- list(
  "Royal Seal of Eldre'Thalas" = list(sp = 23, crit = -2),
  "Mana Igniting Cord" = list(int = 5, sp = 12, crit = 1, hit = -1),
  "Robe of Volatile Power" = list(int = 15, sp = -23, crit = 2),
  "Burial Shawl" = list(int = 16, sp = -6),
  "Dragon's Touch" = list(int = 8, sp = -5),
  "Dark Advisor's Pendant" = list(int = -2, sp = 20, hit = -1),
  "Choker of Elightenment" = list(int = 1, sp = 18, hit = -1),
  "Choker of the Fire Lord" = list(int = -2, sp = 34, hit = -1),
  "Dragonslayer's Signet" = list(int = 5, sp = -9, crit = 1),
  "Ring of Spell Power" = list(int = -7, sp = 24),
  "Band of Forced Concentration" = list(int = 5, sp = 12, hit = 1),
  "Band of Dark Dominion" = list(int = -1, sp = 24)
)
set.seed(42)
df <- compare_items(my_stats, items = items)
df[order(-df$dps), ]
#>                                   dps       diff
#> Band of Forced Concentration 410.0833 10.6330257
#> Band of Dark Dominion        409.7451 10.2947700
#> Choker of the Fire Lord      409.3528  9.9025378
#> Ring of Spell Power          408.7354  9.2851051
#> Mana Igniting Cord           406.4540  7.0037305
#> Dark Advisor's Pendant       403.2049  3.7545849
#> Robe of Volatile Power       402.9815  3.5312348
#> Choker of Elightenment       402.8903  3.4400088
#> Dragonslayer's Signet        401.7351  2.2848002
#> Burial Shawl                 399.7550  0.3047165
#> current                      399.4503  0.0000000
#> Dragon's Touch               398.6069 -0.8433522
#> Royal Seal of Eldre'Thalas   397.8161 -1.6341752
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>          int           sp         crit          hit          mp5 
#>  0.180555331  1.000000000 11.441861972 11.312041022  0.008228931
set.seed(42)
df_ony <- compare_items(my_stats, items = items)
df_ony[order(-df_ony$dps), ]
#>                                   dps         diff
#> Band of Forced Concentration 465.8048 11.985413329
#> Band of Dark Dominion        465.5455 11.726082448
#> Choker of the Fire Lord      465.1017 11.282273611
#> Ring of Spell Power          464.5180 10.698591758
#> Mana Igniting Cord           460.5443  6.724859057
#> Dark Advisor's Pendant       458.1137  4.294265273
#> Choker of Elightenment       457.6799  3.860501904
#> Dragonslayer's Signet        455.2262  1.406806345
#> Robe of Volatile Power       455.0969  1.277452539
#> Royal Seal of Eldre'Thalas   454.5713  0.751865659
#> Burial Shawl                 453.8214  0.002039264
#> current                      453.8194  0.000000000
#> Dragon's Touch               452.6723 -1.147147456
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
