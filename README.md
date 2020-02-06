
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
  int = 245 + 31 + 12, # with buffs
  sp = 198 + 26 + 33 + 27 + 40, # shadow spell damage
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
#>       int        sp      crit       hit       mp5 
#> 0.2364905 0.4035008 5.0548178 3.9542273 0.2917499
```

The `compare_items` function works very similar. As additional input it
takes a list of items in which you specify the stat differences.

``` r
items <- list(
  "Robe of the Void" = list(hit = -1, int = -20, sp = 33),
  "Robe of Volatile Power" = list(int = -5, sp = 10, crit = 2, hit = -1),
  "Burial Shawl" = list(int = 16, sp = -6),
  "Dragon's Touch" = list(int = 8, sp = -5),
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
#> Choker of the Fire Lord      367.2111 10.7640087
#> Band of Dark Dominion        367.1732 10.7260950
#> Band of Forced Concentration 366.8956 10.4484852
#> Robe of Volatile Power       366.1194  9.6723194
#> Ring of Spell Power          365.8703  9.4232083
#> Robe of the Void             363.2897  6.8426263
#> Dragonslayer's Signet        358.3131  1.8660636
#> Burial Shawl                 356.8194  0.3723557
#> current                      356.4471  0.0000000
#> Dragon's Touch               355.9592 -0.4878970
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>       int        sp      crit       hit       mp5 
#> 0.2585044 0.4579874 4.5540694 4.5017102 0.3323468
set.seed(42)
df_ony <- compare_items(my_stats, items = items)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff
#> Choker of the Fire Lord      416.9118 12.2603827
#> Band of Dark Dominion        416.8658 12.2143952
#> Band of Forced Concentration 416.4622 11.8107500
#> Ring of Spell Power          415.5127 10.8612157
#> Robe of Volatile Power       413.3693  8.7178260
#> Robe of the Void             412.8166  8.1651972
#> Dragonslayer's Signet        405.5100  0.8585828
#> Burial Shawl                 404.7936  0.1421466
#> current                      404.6514  0.0000000
#> Dragon's Touch               403.9401 -0.7113183
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
