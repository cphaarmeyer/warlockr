
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 261 + 31 + 16,
  sp = 472 + 33 + 40,
  crit = 5,
  hit = 2,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  308  545    5    2    3

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
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 29, sp = 84, crit = 2),
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
  "ZG The Hexxer's Cover" = list(
    head = list(int = 10, sp = 41)
  ),
  "ZG Cloak of Consumption" = list(
    back = list(int = 10, sp = 23, hit = 1)
  ),
  "ZG Bloodvine Vest" = list(
    chest = list(int = 13, sp = 27, hit = 2)
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
    neck = list(int = 8, sp = 14)
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
  ),
  "Nemesis Leggings" = list(
    legs = list(int = 16, sp = 39)
  )
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats, trinkets = "zhc")
}

show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  row.names(df) <- substr(row.names(df), 1, 30)
  df[order(-df$dps), ]
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3842275  1.0000000 13.2340248 12.2143398  0.2845505
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3482511  1.0000000 11.0911818 12.1090738  0.2730000

show_result(my_stats, my_changes)
#>                                     dps       diff            slot
#> BWL Neltharions's Tear         476.6419 18.0025247        trinket1
#> BWL2 Neltharions's Tear        474.8837 16.2442637        trinket2
#> BWL Mish'undare, Circlet of th 472.8186 14.1792288            head
#> ZG Bloodvine Garb              472.6390 13.9995950 chest/legs/feet
#> BWL Bracers of Arcane Accuarcy 467.0452  8.4057530           wrist
#> BWL Band of Forced Concentrati 466.2801  7.6407322         finger1
#> BWL Ebony Flame Gloves         465.0731  6.4336549           hands
#> MC Choker of the Fire Lord     464.8227  6.1832962            neck
#> ZG Cloak of Consumption        464.7533  6.1139405            back
#> MC Ring of Spell Power         464.3187  5.6793035         finger1
#> BWL Mantle of the Blackwing Ca 464.1187  5.4793273       shoulders
#> BWL Cloak of the Brood Lord    462.2901  3.6506937            back
#> MC Talisman of Ephemeral Power 462.2465  3.6071053        trinket1
#> ZG The Hexxer's Cover          461.7453  3.1059327            head
#> ZG Zanzil's Seal               461.3848  2.7453866         finger1
#> ZG Zanzil's Concentration      461.3273  2.6878832 finger1/finger2
#> ZG Band of Servitube           461.2826  2.6431545         finger1
#> ZG Kezan's Ustoppable Taint    461.2689  2.6294935            neck
#> ZG Bloodvine Vest              461.0197  2.3803250           chest
#> MC2 Talisman of Ephemeral Powe 460.4703  1.8308789        trinket2
#> MC Robe of Volatile Power      460.0464  1.4069546           chest
#> MC Mana Igniting Cord          459.9033  1.2639273           waist
#> BWL Nemesis Bracers            458.7811  0.1416949           wrist
#> current                        458.6394  0.0000000            <NA>
#> BWL Nemesis Boots              455.2718 -3.3676340            feet

show_result(my_stats, my_bank)
#>                                 dps       diff     slot
#> current                    458.6394  0.0000000     <NA>
#> Felcloth Gloves            458.4785 -0.1608554    hands
#> Felheart Bracers           457.8738 -0.7656270    wrist
#> Zanzil's Band              457.3338 -1.3056334  finger1
#> Eye of the Beast           456.6510 -1.9884435 trinket1
#> Robe of the Void           456.5824 -2.0570361    chest
#> Kezan's Taint              455.9348 -2.7045670     neck
#> Nemesis Leggings           455.7504 -2.8890474     legs
#> Maleki's Footwraps         455.7331 -2.9063438     feet
#> Star of Mystaria           455.0135 -3.6259156     neck
#> 2 Eye of the Beast         454.8430 -3.7963745 trinket2
#> Royal Seal of Eldre'Thalas 454.2183 -4.4211014 trinket2
#> Felheart Slippers          452.0900 -6.5494508     feet
show_result(my_stats_ony, my_bank)
#>                                 dps       diff     slot
#> Felcloth Gloves            515.6799  1.1383393    hands
#> current                    514.5415  0.0000000     <NA>
#> Felheart Bracers           513.6609 -0.8806269    wrist
#> Robe of the Void           513.5370 -1.0045534    chest
#> Zanzil's Band              513.0059 -1.5355951  finger1
#> Maleki's Footwraps         511.4479 -3.0936048     feet
#> Kezan's Taint              511.3926 -3.1489533     neck
#> Nemesis Leggings           511.1849 -3.3566176     legs
#> Star of Mystaria           510.3622 -4.1793201     neck
#> Eye of the Beast           510.3576 -4.1839658 trinket1
#> Royal Seal of Eldre'Thalas 509.5830 -4.9585105 trinket2
#> 2 Eye of the Beast         508.3343 -6.2072312 trinket2
#> Felheart Slippers          507.3297 -7.2118095     feet
```
