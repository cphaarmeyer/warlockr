
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 238 + 31 + 16,
  sp = 402 + 59 + 40,
  crit = 5,
  hit = 2
)
unlist(my_stats)
#>  int   sp crit  hit 
#>  285  501    5    2

set.seed(42)
compute_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3386459  1.0000000 12.1197405 11.3061057  0.3336375
```
