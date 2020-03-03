
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

  - computing how much a stat increases your dps (stat weights)
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

The `compute_statweights` function first simulates your DPS. Then for
every stat it simulates the DPS with that stat increased by 1. Finally
the difference is scaled such that spell power has weight 1.

``` r
set.seed(42)
my_weights <- compute_statweights(my_stats)
my_weights
#>         int          sp        crit         hit         mp5 
#>  0.27700560  1.00000000 13.39516411 10.44493367  0.07319366
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
  "Choker of Enlightenment" = list(int = 1, sp = 18, hit = -1),
  "Choker of the Fire Lord" = list(int = -2, sp = 34, hit = -1),
  "Dragonslayer's Signet" = list(int = 5, sp = -9, crit = 1),
  "Ring of Spell Power" = list(int = -7, sp = 24),
  "Band of Forced Concentration" = list(int = 5, sp = 12, hit = 1),
  "Band of Dark Dominion" = list(int = -1, sp = 24)
)
set.seed(42)
df <- compare_items(my_stats, items = items)
df[order(-df$dps), ]
#>                                   dps      diff
#> Band of Dark Dominion        401.3438 10.588962
#> Band of Forced Concentration 401.2636 10.508816
#> Choker of the Fire Lord      401.1903 10.435469
#> Ring of Spell Power          400.3898  9.635007
#> Mana Igniting Cord           398.0544  7.299561
#> Dark Advisor's Pendant       394.9601  4.205324
#> Choker of Enlightenment      394.5622  3.807420
#> Robe of Volatile Power       393.3884  2.633558
#> Dragonslayer's Signet        392.9063  2.151521
#> current                      390.7548  0.000000
#> Burial Shawl                 390.4903 -0.264467
#> Dragon's Touch               389.6693 -1.085475
#> Royal Seal of Eldre'Thalas   389.4183 -1.336544
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>         int          sp        crit         hit         mp5 
#>  0.24197011  1.00000000 10.74445977 10.49508121  0.07249578
set.seed(42)
df_ony <- compare_items(my_stats, items = items)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff
#> Band of Dark Dominion        456.3276 12.0608080
#> Choker of the Fire Lord      456.1616 11.8947801
#> Band of Forced Concentration 456.1388 11.8719830
#> Ring of Spell Power          455.3930 11.1261789
#> Mana Igniting Cord           451.2074  6.9406025
#> Dark Advisor's Pendant       449.0751  4.8083109
#> Choker of Enlightenment      448.5748  4.3079482
#> Royal Seal of Eldre'Thalas   445.4387  1.1718728
#> Dragonslayer's Signet        445.3898  1.1229958
#> Robe of Volatile Power       444.5889  0.3220315
#> current                      444.2668  0.0000000
#> Burial Shawl                 443.6605 -0.6063566
#> Dragon's Touch               442.8720 -1.3948407
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
