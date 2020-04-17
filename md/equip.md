
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

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 9, hit = 1),
  shoulders = list(sp = 26),
  back = list(int = 6, sp = 23),
  chest = list(sp = 46),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 16, sp = 39),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 7, sp = 18),
  finger2 = list(int = 6, sp = 33),
  trinket1 = list(crit = 2),
  trinket2 = list(sp = 29),
  weapon = list(int = 12, sp = 40 + 20, crit = 1),
  wand = list(int = 4, sp = 11)
)

set.seed(42)
compute_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3386459  1.0000000 12.1197405 11.3061057  0.3336375

my_changes <- list(
  "0 Royal Seal of Eldre'Thalas" = list(
    trinket1 = list(sp = 23)
  ),
  "5 Dark Advisor's Pendant" = list(
    neck = list(int = 7, sp = 20)
  ),
  "MC Choker of the Fire Lord" = list(
    neck = list(int = 7, sp = 34)
  ),
  "MC Choker of Enlightenment" = list(
    neck = list(int = 10, sp = 18)
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
  "BWL Nemesis Bracers" = list(
    wrist = list(int = 11, sp = 15)
  ),
  "BWL Nemesis Boots" = list(
    feet = list(int = 17, sp = 23)
  ),
  "BWL Nemesis Spaulders" = list(
    shoulders = list(int = 13, sp = 23)
  ),
  "BWL Nemesis Robes" = list(
    chest = list(int = 16, sp = 32, crit = 1)
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
  "ZG Jeklik's Opaline Talisman" = list(
    neck = list(sp = 22, mp5 = 3)
  ),
  "ZG Zanzil's Seal" = list(
    finger1 = list(int = 10, sp = 11, hit = 1)
  ),
  "ZG Zanzil's Concentration" = list(
    finger1 = list(int = 10, sp = 11, hit = 1),
    finger2 = list(int = 13, sp = 6, hit = 2, mp5 = 4)
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
  "ZG Soul Corrupter's Necklace" = list(
    neck = list(int = 16, hit = 1)
  ),
  "ZG Touch of Chaos" = list(
    wand = list(sp = 18)
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
  "ZG Kezan's Taint" = list(
    neck = list(int = 8, sp = 14)
  ),
  "ZG Kezan's Ustoppable Taint" = list(
    neck = list(int = 8, sp = 14 + 12)
  ),
  "ZG Zandalarian Hero Charm" = list(
    trinket1 = "zhc"
  )
)

set.seed(42)
df <- compare_equip(my_stats, my_equip, my_changes)
df[order(-df$dps), ]
#>                                                  dps        diff
#> BWL Neltharions's Tear                      438.8242 18.91966183
#> BWL Staff of the Shadow Flame               438.7709 18.86635977
#> ZG Bloodvine Garb                           436.0664 16.16190111
#> BWL Mish'undare, Circlet of the Mind Flayer 432.9658 13.06133884
#> MC Choker of the Fire Lord                  429.7369  9.83243725
#> BWL Bracers of Arcane Accuarcy              427.7150  7.81052517
#> BWL Band of Forced Concentration            426.9639  7.05942193
#> BWL Ebony Flame Gloves                      426.5923  6.68781293
#> BWL Claw of Chromaggus                      426.5825  6.67798000
#> ZG Kezan's Ustoppable Taint                 426.3413  6.43680007
#> BWL Mantle of the Blackwing Cabal           425.9459  6.04135083
#> BWL Master Dragonslayer's Orb               425.5804  5.67586458
#> MC Ring of Spell Power                      425.5735  5.66900314
#> ZG Jin'do's Bag of Whammies                 425.5392  5.63472070
#> ZG Cloak of Consumption                     425.4750  5.57050575
#> MC Talisman of Ephemeral Power              424.5918  4.68726167
#> ZG Jeklik's Opaline Talisman                423.7785  3.87403016
#> 5 Dark Advisor's Pendant                    423.4458  3.54130011
#> BWL Cloak of the Brood Lord                 423.2921  3.38763824
#> MC Choker of Enlightenment                  423.0779  3.17344373
#> ZG Zandalarian Hero Charm                   423.0724  3.16785688
#> ZG The Hexxer's Cover                       423.0713  3.16678766
#> ZG Bloodvine Vest                           422.9588  3.05425394
#> ZG Bloodvine Leggings                       422.5213  2.61676070
#> ZG Touch of Chaos                           422.4175  2.51298126
#> ZG Band of Servitube                        422.3969  2.49244636
#> ZG Zanzil's Seal                            422.1155  2.21095648
#> MC Robe of Volatile Power                   422.0000  2.09547470
#> ZG Zanzil's Concentration                   421.2162  1.31174438
#> BWL Nemesis Robes                           421.1689  1.26436833
#> MC Mana Igniting Cord                       421.0166  1.11205043
#> ZG Kezan's Taint                            420.9544  1.04993109
#> ZG Soul Corrupter's Necklace                420.9011  0.99662248
#> BWL Nemesis Spaulders                       420.4835  0.57898879
#> current                                     419.9045  0.00000000
#> BWL Nemesis Bracers                         419.8686 -0.03595014
#> 0 Royal Seal of Eldre'Thalas                419.3360 -0.56847537
#> BWL Nemesis Boots                           416.8271 -3.07743580
```
