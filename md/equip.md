
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 265 + 31 + 16,
  sp = 472 + 33 + 40,
  crit = 5,
  hit = 3,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  312  545    5    3    3

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
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
#>  0.3779880  1.0000000 12.9527431 12.0592818  0.2926736
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3303014  1.0000000 10.6636079 11.9800983  0.2827753

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Neltharions's Tear         482.7989 18.04556607        trinket1
#> BWL2 Neltharions's Tear        481.0784 16.32509509        trinket2
#> BWL Mish'undare, Circlet of th 479.0662 14.31282778            head
#> ZG Bloodvine Garb              478.7090 13.95565971 chest/legs/feet
#> BWL Bracers of Arcane Accuarcy 473.3328  8.57944470           wrist
#> BWL Band of Forced Concentrati 472.5026  7.74923816         finger1
#> BWL Ebony Flame Gloves         471.2332  6.47988316           hands
#> MC Choker of the Fire Lord     471.0087  6.25539936            neck
#> MC Ring of Spell Power         470.5035  5.75012417         finger1
#> BWL Mantle of the Blackwing Ca 470.3777  5.62438783       shoulders
#> MC Talisman of Ephemeral Power 468.4138  3.66043747        trinket1
#> ZG The Hexxer's Cover          467.9040  3.15066618            head
#> ZG Kezan's Ustoppable Taint    467.6481  2.89479224            neck
#> ZG Zanzil's Seal               467.5022  2.74881078         finger1
#> ZG Band of Servitube           467.3596  2.60627442         finger1
#> ZG Zanzil's Concentration      467.2216  2.46828027 finger1/finger2
#> ZG Bloodvine Vest              466.9733  2.21995662           chest
#> MC2 Talisman of Ephemeral Powe 466.6457  1.89233683        trinket2
#> MC Robe of Volatile Power      466.0855  1.33218684           chest
#> MC Mana Igniting Cord          466.0271  1.27370876           waist
#> current                        464.7533  0.00000000            <NA>
#> BWL Nemesis Bracers            464.6866 -0.06674115           wrist
#> BWL Nemesis Boots              461.2669 -3.48646660            feet

show_result(my_stats, my_bank)
#>                                 dps       diff     slot
#> current                    464.7533  0.0000000     <NA>
#> Felcloth Gloves            464.5522 -0.2011088    hands
#> Felheart Bracers           463.8405 -0.9128113    wrist
#> Zanzil's Band              463.3245 -1.4288348  finger1
#> Eye of the Beast           462.7810 -1.9723626 trinket1
#> Robe of the Void           462.6491 -2.1042154    chest
#> Kezan's Taint              461.9311 -2.8222141     neck
#> Maleki's Footwraps         461.7792 -2.9741090     feet
#> Nemesis Leggings           461.7486 -3.0047208     legs
#> Star of Mystaria           461.0659 -3.6874330     neck
#> 2 Eye of the Beast         460.9536 -3.7996954 trinket2
#> Royal Seal of Eldre'Thalas 460.2737 -4.4796294 trinket2
show_result(my_stats_ony, my_bank)
#>                                 dps      diff     slot
#> Felcloth Gloves            522.4559  1.075119    hands
#> current                    521.3808  0.000000     <NA>
#> Robe of the Void           520.3357 -1.045127    chest
#> Felheart Bracers           520.2944 -1.086368    wrist
#> Zanzil's Band              519.7001 -1.680701  finger1
#> Maleki's Footwraps         518.1535 -3.227241     feet
#> Kezan's Taint              518.1085 -3.272335     neck
#> Nemesis Leggings           517.8578 -3.522964     legs
#> Eye of the Beast           517.1420 -4.238812 trinket1
#> Star of Mystaria           517.1121 -4.268701     neck
#> Royal Seal of Eldre'Thalas 516.3494 -5.031340 trinket2
#> 2 Eye of the Beast         515.0912 -6.289606 trinket2
```
