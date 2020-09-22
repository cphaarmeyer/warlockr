
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
my_stats <- with_buffs(list(
  int = 267,
  sp = 512 + 63, # shadow spell damage
  crit = 7,
  hit = 10,
  mp5 = 0
),
consumables = c("gae", "eosp", "bwo")
)
```

The `compute_statweights` function simulates the DPS in the neighborhood
of your current stats. Then it evaluates the impact of every stat and
scales such that spell power has weight 1.

``` r
my_weights <- compute_statweights(my_stats, trinkets = "toep", seed = 42)
t(my_weights)
#>              int        sp      crit       hit       mp5
#> weight 0.3619131 1.0000000 14.083848 12.732024 0.2668214
#> dps    0.1880581 0.5196223  7.318281  6.615843 0.1386463
```

To use the `compare_equip` function we need a list of our current items.
If your just want a quick comparison see `compare_items`.

``` r
my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 5, sp = 27, crit = 1),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 13, sp = 27, hit = 2),
  wrist = list(int = 12, sp = 21, hit = 1),
  hands = list(int = 12, sp = 43),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 12, sp = 21, hit = 1),
  finger2 = list(sp = 14, crit = 1, hit = 1),
  trinket1 = "toep",
  trinket2 = list(sp = 44, hit = 2),
  weapon = list(int = 29, sp = 84, crit = 2),
  wand = list(sp = 18)
)
```

Next we need a list of which items to change.

``` r
my_changes <- list(
  "Zandalarian Hero Charm" =
    list(trinket1 = "zhc"),
  "Briarwood Reed" =
    list(trinket1 = list(sp = 29)),
  "Doomcaller's Robes" =
    list(chest = list(int = 17, sp = 41, crit = 1)),
  "Fel Infused Leggings" =
    list(legs = list(sp = 64)),
  "Boots of Epiphany" =
    list(feet = list(int = 19, sp = 34)),
  "Robes + Leggings + Boots" = list(
    chest = list(int = 17, sp = 41, crit = 1),
    legs = list(sp = 64),
    feet = list(int = 19, sp = 34)
  ),
  "Robes + Leggings + Boots - Setbonus" = list(
    chest = list(int = 17, sp = 41, crit = 1 - 2),
    legs = list(sp = 64),
    feet = list(int = 19, sp = 34)
  )
)
```

Now we can simulate.

``` r
df <- compare_equip(my_stats, my_equip, my_changes, seed = 561)
df[order(-df$dps), ]
#>                                          dps        diff            slot
#> Robes + Leggings + Boots            612.6468  8.72416549 chest/legs/feet
#> Fel Infused Leggings                610.1060  6.18342595            legs
#> Doomcaller's Robes                  605.4479  1.52535500           chest
#> Boots of Epiphany                   605.4359  1.51334626            feet
#> current                             603.9226  0.00000000                
#> Zandalarian Hero Charm              603.8308 -0.09175812        trinket1
#> Briarwood Reed                      603.1765 -0.74608273        trinket1
#> Robes + Leggings + Boots - Setbonus 598.2975 -5.62505718 chest/legs/feet
```

If you want to know what impact world buffs have, simulate again.

``` r
my_stats <- add_buff(my_stats, "ony")
weights_ony <- compute_statweights(my_stats, trinkets = "toep", seed = 42)
t(weights_ony)
#>              int        sp      crit       hit       mp5
#> weight 0.3398773 1.0000000 11.849965 12.768214 0.2746858
#> dps    0.1968847 0.5792817  6.864467  7.396392 0.1591205
df_ony <- compare_equip(my_stats, my_equip, my_changes, seed = 561)
df_ony[order(-df_ony$dps), ]
#>                                          dps       diff            slot
#> Robes + Leggings + Boots            681.8057  8.4831251 chest/legs/feet
#> Fel Infused Leggings                680.3640  7.0414502            legs
#> Boots of Epiphany                   674.9246  1.6020169            feet
#> Doomcaller's Robes                  673.7222  0.3995946           chest
#> current                             673.3226  0.0000000                
#> Zandalarian Hero Charm              673.2026 -0.1200204        trinket1
#> Briarwood Reed                      672.4864 -0.8362158        trinket1
#> Robes + Leggings + Boots - Setbonus 668.2354 -5.0872230 chest/legs/feet
```

This can help setting your priorities right. Note that this is only
about the DPS and ignores survivability. You might want to trade small a
amount of DPS for stamina.
