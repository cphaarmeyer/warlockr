
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 273 + 31 + 16,
  sp = 478 + 33 + 40,
  crit = 5,
  hit = 3,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  320  551    5    3    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 19, sp = 12),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 16, sp = 32, crit = 1),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 9, sp = 23),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 29, sp = 84, crit = 2),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Choker of the Fire Lord" =
    list(neck = list(int = 7, sp = 34)),
  "MC Robe of Volatile Power" =
    list(chest = list(int = 15, sp = 23, crit = 2)),
  "MC Mana Igniting Cord" =
    list(waist = list(int = 16, sp = 25, crit = 1)),
  "MC Ring of Spell Power" =
    list(finger1 = list(sp = 33)),
  "MC Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "MC2 Talisman of Ephemeral Power" =
    list(trinket2 = "toep"),
  "BWL Nemesis Bracers" =
    list(wrist = list(int = 11, sp = 15)),
  "BWLS Nemesis Bracers" = list(
    wrist = list(int = 11, sp = 15 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Nemesis Boots" =
    list(feet = list(int = 17, sp = 23)),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWLS Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34 - 12)),
  "BWL Bracers of Arcane Accuarcy" =
    list(wrist = list(int = 12, sp = 21, hit = 1)),
  "BWLS Bracers of Arcane Accuarcy" = list(
    wrist = list(int = 12, sp = 21 - 12, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Band of Forced Concentration" =
    list(finger1 = list(int = 12, sp = 21, hit = 1)),
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
  "BWL Neltharions's Tear" =
    list(trinket1 = list(sp = 44, hit = 2)),
  "BWL2 Neltharions's Tear" =
    list(trinket2 = list(sp = 44, hit = 2)),
  "BWL Mish'undare, Circlet of the Mind Flayer" =
    list(head = list(int = 24, sp = 35, crit = 2)),
  "ZG Zanzil's Seal" =
    list(finger1 = list(int = 10, sp = 11, hit = 1)),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 1 + 1, mp5 = 4)
  ),
  "ZG The Hexxer's Cover" =
    list(head = list(int = 10, sp = 41)),
  "ZG Bloodvine Vest" =
    list(chest = list(int = 13, sp = 27, hit = 2)),
  "ZG Bloodvine Garb" = list(
    chest = list(int = 13, sp = 27, hit = 2),
    legs = list(int = 6, sp = 37, hit = 1),
    feet = list(int = 16, sp = 19, crit = 2, hit = 1)
  ),
  "ZG Bloodtinged Gloves" =
    list(hands = list(int = 10, sp = 19, hit = 1)),
  "ZG Kezan's Ustoppable Taint" =
    list(neck = list(int = 8, sp = 14)),
  "ZGS Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 13, sp = 23)
  )
)

my_bank <- list(
  "Zandalar Demoniac's Robe" =
    list(chest = list(sp = 27, hit = 1)),
  "S Zandalar Demoniac's Robe" = list(
    chest = list(sp = 27, hit = 1),
    shoulders = list(int = 13, sp = 23)
  ),
  "Nemesis Spaulders" =
    list(shoulders = list(int = 13, sp = 23)),
  "S Nemesis Spaulders" =
    list(shoulders = list(int = 13, sp = 23 - 12)),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Kezan's Taint" =
    list(neck = list(int = 8, sp = 14)),
  "Zanzil's Band" =
    list(finger1 = list(int = 13, hit = 1, mp5 = 4)),
  "Felheart Bracers" =
    list(wrist = list(int = 11, sp = 13)),
  "S Felheart Bracers" = list(
    wrist = list(int = 11, sp = 13 - 12),
    shoulders = list(int = 13, sp = 23)
  ),
  "Maleki's Footwraps" =
    list(feet = list(int = 9, sp = 27)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Star of Mystaria" =
    list(neck = list(int = 9, hit = 1)),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2)),
  "2 Eye of the Beast" =
    list(trinket2 = list(crit = 2)),
  "Robe of the Void" =
    list(chest = list(sp = 46)),
  "Nemesis Leggings" =
    list(legs = list(int = 16, sp = 39))
)

show_statweights <- function(stats) {
  set.seed(42)
  compute_statweights(stats, trinkets = "zhc")
}

show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  row.names(df) <- format(substr(row.names(df), 1, 30), width = 30)
  df[order(-df$dps), ]
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3757358  1.0000000 13.1876271 12.1812739  0.2745192
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3410977  1.0000000 11.1200704 12.2406392  0.2647003

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Neltharions's Tear         486.9250 18.17379346        trinket1
#> BWL2 Neltharions's Tear        485.2623 16.51111306        trinket2
#> BWL Mish'undare, Circlet of th 483.2516 14.50041465            head
#> ZG Bloodvine Garb              483.1042 14.35294914 chest/legs/feet
#> BWL Mantle of the Blackwing Ca 478.4410  9.68982416       shoulders
#> BWL Bracers of Arcane Accuarcy 477.4183  8.66703970           wrist
#> BWLS Bracers of Arcane Accuarc 475.8819  7.13066399 wrist/shoulders
#> MC Choker of the Fire Lord     475.1693  6.41804591            neck
#> BWL Ebony Flame Gloves         475.1394  6.38816010           hands
#> BWL Band of Forced Concentrati 473.8774  5.12622606         finger1
#> BWLS Mantle of the Blackwing C 472.9263  4.17509277       shoulders
#> MC Talisman of Ephemeral Power 472.3477  3.59652231        trinket1
#> ZG The Hexxer's Cover          472.0291  3.27791074            head
#> MC Ring of Spell Power         471.9576  3.20633734         finger1
#> ZG Bloodvine Vest              471.2644  2.51321345           chest
#> MC2 Talisman of Ephemeral Powe 470.6025  1.85131944        trinket2
#> MC Robe of Volatile Power      470.3571  1.60585128           chest
#> MC Mana Igniting Cord          470.1200  1.36880232           waist
#> ZGS Kezan's Ustoppable Taint   470.0838  1.33256282  neck/shoulders
#> ZG Bloodtinged Gloves          469.5491  0.79791128           hands
#> ZG Zanzil's Seal               468.9154  0.16422871         finger1
#> ZG Zanzil's Concentration      468.8135  0.06224036 finger1/finger2
#> BWL Nemesis Bracers            468.8018  0.05059670           wrist
#> current                        468.7512  0.00000000            <NA>
#> BWLS Nemesis Bracers           467.4441 -1.30715981 wrist/shoulders
#> ZG Kezan's Ustoppable Taint    465.9252 -2.82604984            neck
#> BWL Nemesis Boots              465.2318 -3.51944602            feet

show_result(my_stats, my_bank)
#>                                     dps         diff            slot
#> Nemesis Spaulders              472.9261  4.174890195       shoulders
#> current                        468.7512  0.000000000            <NA>
#> Felcloth Gloves                468.7498 -0.001418977           hands
#> Felheart Bracers               467.8654 -0.885797448           wrist
#> S Zandalar Demoniac's Robe     467.5264 -1.224856450 chest/shoulders
#> S Nemesis Spaulders            467.3596 -1.391603431       shoulders
#> Eye of the Beast               466.7723 -1.978905676        trinket1
#> Robe of the Void               466.7189 -2.032282051           chest
#> S Felheart Bracers             466.5580 -2.193188113 wrist/shoulders
#> Kezan's Taint                  465.9252 -2.826049837            neck
#> Maleki's Footwraps             465.8729 -2.878370371            feet
#> Nemesis Leggings               465.8324 -2.918865966            legs
#> Star of Mystaria               465.1408 -3.610420486            neck
#> 2 Eye of the Beast             464.9907 -3.760533683        trinket2
#> Zanzil's Band                  464.7778 -3.973442302         finger1
#> Royal Seal of Eldre'Thalas     464.2530 -4.498235769        trinket2
#> Zandalar Demoniac's Robe       463.5139 -5.237357140           chest
show_result(my_stats_ony, my_bank)
#>                                     dps        diff            slot
#> Nemesis Spaulders              530.5081  4.74432923       shoulders
#> Felcloth Gloves                527.0308  1.26697669           hands
#> S Zandalar Demoniac's Robe     525.7801  0.01635407 chest/shoulders
#> current                        525.7638  0.00000000            <NA>
#> Robe of the Void               524.7652 -0.99858209           chest
#> Felheart Bracers               524.7095 -1.05428217           wrist
#> S Nemesis Spaulders            524.2589 -1.50492365       shoulders
#> S Felheart Bracers             523.3230 -2.44083844 wrist/shoulders
#> Maleki's Footwraps             522.5842 -3.17961653            feet
#> Kezan's Taint                  522.4520 -3.31179797            neck
#> Nemesis Leggings               522.3111 -3.45267227            legs
#> Star of Mystaria               521.5731 -4.19072568            neck
#> Eye of the Beast               521.4810 -4.28277072        trinket1
#> Zanzil's Band                  521.2363 -4.52751650         finger1
#> Zandalar Demoniac's Robe       521.1631 -4.60064719           chest
#> Royal Seal of Eldre'Thalas     520.7133 -5.05047857        trinket2
#> 2 Eye of the Beast             519.4985 -6.26526568        trinket2
```
