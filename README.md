
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
#>  0.3402901  1.0000000 11.8346503 10.3760295  0.3524043
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
#> Band of Forced Concentration 424.3432  6.7410179
#> Ring of Spell Power          423.2380  5.6358690
#> Band of Servitude            420.0699  2.4677141
#> Zanzil's Seal                419.5855  1.9833729
#> Ring of Blackrock            418.2301  0.6279237
#> Zanzil's Concentration       418.1087  0.5065712
#> current                      417.6022  0.0000000
#> Royal Seal of Eldre'Thalas   416.9170 -0.6851741
#> Dragonslayer's Signet        415.2432 -2.3590184
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats$crit <- my_stats$crit + 10
set.seed(42)
weights_ony <- compute_statweights(my_stats)
weights_ony
#>        int         sp       crit        hit        mp5 
#>  0.3037038  1.0000000  9.7574255 10.4654931  0.3558472
set.seed(42)
df_ony <- compare_equip(my_stats, my_equip, my_changes)
df_ony[order(-df_ony$dps), ]
#>                                   dps       diff
#> Band of Forced Concentration 476.1989  7.5237655
#> Ring of Spell Power          475.0910  6.4158855
#> Band of Servitude            471.4155  2.7403759
#> Zanzil's Seal                470.8837  2.2085747
#> Royal Seal of Eldre'Thalas   470.1008  1.4256193
#> Ring of Blackrock            469.4696  0.7944512
#> Zanzil's Concentration       469.2116  0.5364099
#> current                      468.6751  0.0000000
#> Dragonslayer's Signet        465.0192 -3.6559143
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
