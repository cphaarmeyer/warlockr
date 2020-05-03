
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
#>  0.3613858  1.0000000 12.7523011 11.8428705  0.2348229
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3185888  1.0000000 10.7256099 11.7372306  0.3019199

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Staff of the Shadow Flame  450.8351 18.96312545          weapon
#> BWL Neltharions's Tear         448.9916 17.11962518        trinket1
#> ZG Bloodvine Garb              447.8334 15.96138924 chest/legs/feet
#> BWL2 Neltharions's Tear        447.3484 15.47635635        trinket2
#> BWL Mish'undare, Circlet of th 445.4820 13.61000630            head
#> BWL Bracers of Arcane Accuarcy 439.8922  8.02014411           wrist
#> BWL Band of Forced Concentrati 439.1421  7.27007909         finger1
#> BWL Claw of Chromaggus         438.1755  6.30352599          weapon
#> BWL Ebony Flame Gloves         438.0514  6.17937346           hands
#> MC Choker of the Fire Lord     437.9257  6.05371354            neck
#> ZG Jin'do's Bag of Whammies    437.9150  6.04293943          weapon
#> BWL Master Dragonslayer's Orb  437.6756  5.80354859          weapon
#> ZG Cloak of Consumption        437.6153  5.74329057            back
#> MC Ring of Spell Power         437.4500  5.57798875         finger1
#> BWL Mantle of the Blackwing Ca 437.2122  5.34021717       shoulders
#> BWL Cloak of the Brood Lord    435.4424  3.57038922            back
#> MC Talisman of Ephemeral Power 435.4205  3.54842728        trinket1
#> ZG The Hexxer's Cover          434.9417  3.06969403            head
#> ZG Bloodvine Leggings          434.5646  2.69261345            legs
#> ZG Kezan's Ustoppable Taint    434.5251  2.65302789            neck
#> ZG Band of Servitube           434.3664  2.49441791         finger1
#> ZG Zanzil's Seal               434.3314  2.45940583         finger1
#> ZG Zanzil's Concentration      434.0240  2.15197924 finger1/finger2
#> ZG Bloodvine Vest              433.8479  1.97588900           chest
#> MC2 Talisman of Ephemeral Powe 433.6619  1.78989842        trinket2
#> MC Robe of Volatile Power      433.2109  1.33891993           chest
#> MC Mana Igniting Cord          433.1542  1.28222566           waist
#> BWL Nemesis Bracers            431.8923  0.02027379           wrist
#> current                        431.8720  0.00000000            <NA>
#> BWL Nemesis Boots              428.5732 -3.29880267            feet

show_result(my_stats, my_bank)
#>                                 dps         diff     slot
#> Felcloth Gloves            431.8734  0.001400476    hands
#> current                    431.8720  0.000000000     <NA>
#> Felheart Bracers           431.0245 -0.847496978    wrist
#> Zanzil's Band              430.4236 -1.448387560  finger1
#> Robe of the Void           429.9462 -1.925845339    chest
#> Eye of the Beast           429.7278 -2.144271949 trinket1
#> Maleki's Footwraps         429.2201 -2.651948025     feet
#> Star of Mystaria           428.1519 -3.720095323     neck
#> Kezan's Taint              427.9495 -3.922539016     neck
#> 2 Eye of the Beast         427.9372 -3.934861830 trinket2
#> Royal Seal of Eldre'Thalas 427.5152 -4.356862026 trinket2
#> Felheart Slippers          425.5146 -6.357379557     feet
show_result(my_stats_ony, my_bank)
#>                                 dps       diff     slot
#> Felcloth Gloves            486.8337  1.2161674    hands
#> current                    485.6175  0.0000000     <NA>
#> Robe of the Void           484.6787 -0.9388855    chest
#> Felheart Bracers           484.6075 -1.0100778    wrist
#> Zanzil's Band              483.8991 -1.7184036  finger1
#> Maleki's Footwraps         482.7344 -2.8831321     feet
#> Eye of the Beast           481.3592 -4.2583660 trinket1
#> Star of Mystaria           481.2844 -4.3331495     neck
#> Kezan's Taint              481.1152 -4.5023944     neck
#> Royal Seal of Eldre'Thalas 480.7124 -4.9051013 trinket2
#> 2 Eye of the Beast         479.3574 -6.2601108 trinket2
#> Felheart Slippers          478.5185 -7.0990021     feet
```
