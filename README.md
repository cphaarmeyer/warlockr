
<!-- README.md is generated from README.Rmd. Please edit that file -->

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
  int = 213 + 31 + 12, # with buffs
  sp = 360 + 119 + 40, # shadow spell damage
  crit = 4,
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
#>  0.3681915  1.0000000 13.2547359 10.4922716  0.3375856
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
  hands = list(sp = 33),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 9, sp = 27),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(crit = 2),
  trinket2 = list(sp = 29),
  weapon = list(int = 12, sp = 60, crit = 1) # includes off hand
)
```

Next we need a list of which items to change.

``` r
my_changes <- list(
  "Royal Seal of Eldre'Thalas" = list(
    trinket1 = list(sp = 23)
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
#> Band of Forced Concentration 433.7967  6.9662434
#> Ring of Spell Power          432.4196  5.5891521
#> Band of Servitude            429.4197  2.5892899
#> Zanzil's Seal                428.8979  2.0674564
#> Zanzil's Concentration       427.5459  0.7155293
#> Ring of Blackrock            427.3686  0.5381741
#> current                      426.8304  0.0000000
#> Dragonslayer's Signet        425.0566 -1.7738480
#> Royal Seal of Eldre'Thalas   424.7618 -2.0685928
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>        int         sp       crit        hit        mp5 
#>  0.3195379  1.0000000 10.6953307 10.4988950  0.3443375
set.seed(42)
df_ony <- compare_equip(my_stats, my_equip, my_changes)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff
#> Band of Forced Concentration 491.9584  7.8173762
#> Ring of Spell Power          490.6409  6.4998095
#> Band of Servitude            487.0413  2.9002395
#> Zanzil's Seal                486.4475  2.3064442
#> Ring of Blackrock            484.9065  0.7654778
#> Zanzil's Concentration       484.8301  0.6890048
#> Royal Seal of Eldre'Thalas   484.6356  0.4945705
#> current                      484.1411  0.0000000
#> Dragonslayer's Signet        480.7759 -3.3651879
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
