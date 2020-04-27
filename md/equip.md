
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 254 + 31 + 16,
  sp = 440 + 33 + 40,
  crit = 4,
  hit = 1
)
unlist(my_stats)
#>  int   sp crit  hit 
#>  301  513    4    1

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 6, sp = 23),
  chest = list(int = 16, sp = 32, crit = 1),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 12, sp = 40 + 20, crit = 1),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Choker of the Fire Lord" = list(
    neck = list(int = 7, sp = 34)
  ),
  "MC Robe of Volatile Power" = list(
    chest = list(int = 15, sp = 23, crit = 2)
  ),
  "MC Mana Igniting Cord" = list(
    waist = list(int = 16, sp = 25, crit = 1)
  ),
  "MC Ring of Spell Power" = list(
    finger1 = list(sp = 33)
  ),
  "MC Talisman of Ephemeral Power" = list(
    trinket1 = "toep"
  ),
  "MC2 Talisman of Ephemeral Power" = list(
    trinket2 = "toep"
  ),
  "BWL Nemesis Bracers" = list(
    wrist = list(int = 11, sp = 15)
  ),
  "BWL Nemesis Boots" = list(
    feet = list(int = 17, sp = 23)
  ),
  "BWL Mantle of the Blackwing Cabal" = list(
    shoulders = list(int = 16, sp = 34)
  ),
  "BWL Bracers of Arcane Accuarcy" = list(
    wrist = list(int = 12, sp = 21, hit = 1)
  ),
  "BWL Band of Forced Concentration" = list(
    finger1 = list(int = 12, sp = 21, hit = 1)
  ),
  "BWL Ebony Flame Gloves" = list(
    hands = list(int = 12, sp = 43)
  ),
  "BWL Cloak of the Brood Lord" = list(
    back = list(int = 14, sp = 28)
  ),
  "BWL Neltharions's Tear" = list(
    trinket1 = list(sp = 44, hit = 2)
  ),
  "BWL2 Neltharions's Tear" = list(
    trinket2 = list(sp = 44, hit = 2)
  ),
  "BWL Mish'undare, Circlet of the Mind Flayer" = list(
    head = list(int = 24, sp = 35, crit = 2)
  ),
  "BWL Staff of the Shadow Flame" = list(
    weapon = list(int = 29, sp = 84, crit = 2)
  ),
  "BWL Master Dragonslayer's Orb" = list(
    weapon = list(int = 12 + 14, sp = 40 + 28, crit = 1)
  ),
  "BWL Claw of Chromaggus" = list(
    weapon = list(int = 17, sp = 64 + 20, mp5 = 4)
  ),
  "ZG Band of Servitube" = list(
    finger1 = list(int = 9, sp = 23)
  ),
  "ZG Zanzil's Seal" = list(
    finger1 = list(int = 10, sp = 11, hit = 1)
  ),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "ZG Jin'do's Bag of Whammies" = list(
    weapon = list(int = 12 + 11, sp = 40 + 18, crit = 1, hit = 1)
  ),
  "ZG The Hexxer's Cover" = list(
    head = list(int = 10, sp = 41)
  ),
  "ZG Cloak of Consumption" = list(
    back = list(int = 10, sp = 23, hit = 1)
  ),
  "ZG Bloodvine Vest" = list(
    chest = list(int = 13, sp = 27, hit = 2)
  ),
  "ZG Bloodvine Leggings" = list(
    legs = list(int = 6, sp = 37, hit = 1)
  ),
  "ZG Bloodvine Garb" = list(
    chest = list(int = 13, sp = 27, hit = 2),
    legs = list(int = 6, sp = 37, hit = 1),
    feet = list(int = 16, sp = 19, crit = 2, hit = 1)
  ),
  "ZG Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14 + 12)
  )
)

my_bank <- list(
  "Royal Seal of Eldre'Thalas" = list(
    trinket2 = list(sp = 23)
  ),
  "Kezan's Taint" = list(
    neck = list(int = 6, sp = 12)
  ),
  "Zanzil's Band" = list(
    finger1 = list(int = 13, hit = 1, mp5 = 4)
  ),
  "Felheart Bracers" = list(
    wrist = list(int = 11, sp = 13)
  ),
  "Felheart Slippers" = list(
    feet = list(int = 11, sp = 18)
  ),
  "Maleki's Footwraps" = list(
    feet = list(int = 9, sp = 27)
  ),
  "Felcloth Gloves" = list(
    hands = list(sp = 33)
  ),
  "Star of Mystaria" = list(
    neck = list(int = 9, hit = 1)
  ),
  "Eye of the Beast" = list(
    trinket1 = list(crit = 2)
  ),
  "2 Eye of the Beast" = list(
    trinket2 = list(crit = 2)
  ),
  "Robe of the Void" = list(
    chest = list(sp = 46)
  )
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats)
}

show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  row.names(df) <- substr(row.names(df), 1, 30)
  df[order(-df$dps), ]
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3495637  1.0000000 12.0823139 11.1792099  0.3359091
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3138718  1.0000000 10.1842898 11.1905442  0.3486077

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Staff of the Shadow Flame  450.1798 18.93417331          weapon
#> BWL Neltharions's Tear         448.3484 17.10275402        trinket1
#> BWL2 Neltharions's Tear        447.3484 16.10271589        trinket2
#> ZG Bloodvine Garb              447.1684 15.92271316 chest/legs/feet
#> BWL Mish'undare, Circlet of th 444.8361 13.59046433            head
#> BWL Bracers of Arcane Accuarcy 439.2622  8.01653905           wrist
#> BWL Band of Forced Concentrati 438.5085  7.26287450         finger1
#> BWL Claw of Chromaggus         437.5531  6.30741226          weapon
#> BWL Ebony Flame Gloves         437.4070  6.16133580           hands
#> MC Choker of the Fire Lord     437.2973  6.05164496            neck
#> ZG Jin'do's Bag of Whammies    437.2734  6.02776982          weapon
#> BWL Master Dragonslayer's Orb  437.0253  5.77967328          weapon
#> ZG Cloak of Consumption        436.9908  5.74514747            back
#> MC Ring of Spell Power         436.8301  5.58447585         finger1
#> BWL Mantle of the Blackwing Ca 436.5765  5.33080339       shoulders
#> BWL Cloak of the Brood Lord    434.8004  3.55469671            back
#> ZG The Hexxer's Cover          434.3154  3.06973810            head
#> ZG Bloodvine Leggings          433.9364  2.69069910            legs
#> ZG Kezan's Ustoppable Taint    433.9018  2.65617222            neck
#> MC Talisman of Ephemeral Power 433.8867  2.64105560        trinket1
#> ZG Band of Servitube           433.7437  2.49801494         finger1
#> ZG Zanzil's Seal               433.6865  2.44086050         finger1
#> ZG Zanzil's Concentration      433.3962  2.15048666 finger1/finger2
#> ZG Bloodvine Vest              433.2247  1.97901534           chest
#> MC2 Talisman of Ephemeral Powe 432.7754  1.52972771        trinket2
#> MC Robe of Volatile Power      432.5835  1.33785510           chest
#> MC Mana Igniting Cord          432.5336  1.28793252           waist
#> BWL Nemesis Bracers            431.2661  0.02042997           wrist
#> current                        431.2457  0.00000000            <NA>
#> BWL Nemesis Boots              427.9537 -3.29197519            feet

show_result(my_stats, my_bank)
#>                                 dps        diff     slot
#> Felcloth Gloves            431.2577  0.01207188    hands
#> current                    431.2457  0.00000000     <NA>
#> Felheart Bracers           430.4095 -0.83614248    wrist
#> Zanzil's Band              429.8144 -1.43126826  finger1
#> Robe of the Void           429.3279 -1.91776682    chest
#> Eye of the Beast           429.0656 -2.18004972 trinket1
#> Maleki's Footwraps         428.6034 -2.64228051     feet
#> 2 Eye of the Beast         427.9372 -3.30850229 trinket2
#> Royal Seal of Eldre'Thalas 427.5152 -3.73050249 trinket2
#> Star of Mystaria           427.5139 -3.73171752     neck
#> Kezan's Taint              427.3255 -3.92016523     neck
#> Felheart Slippers          424.9106 -6.33506144     feet
show_result(my_stats_ony, my_bank)
#>                                 dps       diff     slot
#> Felcloth Gloves            486.1423  1.2434131    hands
#> current                    484.8988  0.0000000     <NA>
#> Robe of the Void           483.9740 -0.9248706    chest
#> Felheart Bracers           483.9080 -0.9907895    wrist
#> Zanzil's Band              483.2142 -1.6846119  finger1
#> Maleki's Footwraps         482.0306 -2.8682471     feet
#> Royal Seal of Eldre'Thalas 480.7124 -4.1863947 trinket2
#> Eye of the Beast           480.6139 -4.2849344 trinket1
#> Star of Mystaria           480.5682 -4.3306756     neck
#> Kezan's Taint              480.4041 -4.4947350     neck
#> 2 Eye of the Beast         479.3574 -5.5414042 trinket2
#> Felheart Slippers          477.8387 -7.0601640     feet
```
