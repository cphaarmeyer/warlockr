
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 271 + 31 + 16,
  sp = 473 + 33 + 40,
  crit = 5,
  hit = 3,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  318  546    5    3    3

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
  finger1 = list(int = 7, sp = 18),
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
  "ZG Band of Servitube" =
    list(finger1 = list(int = 9, sp = 23)),
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
  "ZG Kezan's Ustoppable Taint" =
    list(neck = list(int = 8, sp = 14)),
  "ZGS Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14),
    shoulders = list(int = 13, sp = 23)
  )
)

my_bank <- list(
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
#>  0.3717626  1.0000000 13.1107152 12.1125270  0.3280933
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3302418  1.0000000 10.9770695 12.1202214  0.3344611

show_result(my_stats, my_changes)
#>                                     dps       diff            slot
#> BWL Neltharions's Tear         484.2659 18.0249524        trinket1
#> BWL2 Neltharions's Tear        482.5846 16.3436466        trinket2
#> BWL Mish'undare, Circlet of th 480.5679 14.3269366            head
#> ZG Bloodvine Garb              480.2737 14.0326833 chest/legs/feet
#> BWL Mantle of the Blackwing Ca 475.8396  9.5986231       shoulders
#> BWL Bracers of Arcane Accuarcy 474.6697  8.4287263           wrist
#> BWL Band of Forced Concentrati 473.8774  7.6364772         finger1
#> BWLS Bracers of Arcane Accuarc 473.3328  7.0918180 wrist/shoulders
#> BWL Ebony Flame Gloves         472.6436  6.4026429           hands
#> MC Choker of the Fire Lord     472.4160  6.1750761            neck
#> MC Ring of Spell Power         471.9576  5.7165885         finger1
#> BWLS Mantle of the Blackwing C 470.3777  4.1367612       shoulders
#> MC Talisman of Ephemeral Power 469.7238  3.4828734        trinket1
#> ZG The Hexxer's Cover          469.3111  3.0701533            head
#> ZG Zanzil's Seal               468.9154  2.6744799         finger1
#> ZG Zanzil's Concentration      468.8135  2.5724915 finger1/finger2
#> ZG Band of Servitube           468.7512  2.5102512         finger1
#> ZG Bloodvine Vest              468.5106  2.2695927           chest
#> MC2 Talisman of Ephemeral Powe 468.1188  1.8778085        trinket2
#> ZGS Kezan's Ustoppable Taint   467.6481  1.4071656  neck/shoulders
#> MC Robe of Volatile Power      467.6150  1.3740072           chest
#> MC Mana Igniting Cord          467.5877  1.3467354           waist
#> current                        466.2410  0.0000000            <NA>
#> BWL Nemesis Bracers            466.1360 -0.1050035           wrist
#> BWLS Nemesis Bracers           464.6866 -1.5543678 wrist/shoulders
#> ZG Kezan's Ustoppable Taint    463.3603 -2.8806856            neck
#> BWL Nemesis Boots              462.6514 -3.5896127            feet

show_result(my_stats, my_bank)
#>                                     dps       diff            slot
#> Nemesis Spaulders              470.2986  4.0576529       shoulders
#> current                        466.2410  0.0000000            <NA>
#> Felcloth Gloves                466.0848 -0.1562107           hands
#> Felheart Bracers               465.3036 -0.9374197           wrist
#> Zanzil's Band                  464.7778 -1.4631911         finger1
#> S Nemesis Spaulders            464.7533 -1.4876267       shoulders
#> Robe of the Void               464.1412 -2.0998103           chest
#> Eye of the Beast               464.0637 -2.1772744        trinket1
#> S Felheart Bracers             463.8405 -2.4004379 wrist/shoulders
#> Kezan's Taint                  463.3603 -2.8806856            neck
#> Maleki's Footwraps             463.2526 -2.9883292            feet
#> Nemesis Leggings               463.2267 -3.0142459            legs
#> Star of Mystaria               462.5269 -3.7140422            neck
#> 2 Eye of the Beast             462.4308 -3.8101362        trinket2
#> Royal Seal of Eldre'Thalas     461.6908 -4.5501338        trinket2
show_result(my_stats_ony, my_bank)
#>                                     dps      diff            slot
#> Nemesis Spaulders              527.6014  4.639505       shoulders
#> Felcloth Gloves                524.0772  1.115265           hands
#> current                        522.9619  0.000000            <NA>
#> Robe of the Void               521.8987 -1.063257           chest
#> Felheart Bracers               521.8670 -1.094881           wrist
#> S Nemesis Spaulders            521.3808 -1.581138       shoulders
#> Zanzil's Band                  521.2363 -1.725654         finger1
#> S Felheart Bracers             520.2944 -2.667506 wrist/shoulders
#> Maleki's Footwraps             519.6996 -3.262333            feet
#> Kezan's Taint                  519.6022 -3.359696            neck
#> Nemesis Leggings               519.4093 -3.552616            legs
#> Star of Mystaria               518.6426 -4.319296            neck
#> Eye of the Beast               518.4923 -4.469594        trinket1
#> Royal Seal of Eldre'Thalas     517.8600 -5.101917        trinket2
#> 2 Eye of the Beast             516.6713 -6.290587        trinket2
```
