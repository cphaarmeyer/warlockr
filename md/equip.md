
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 238 + 31 + 16,
  sp = 454 + 33 + 40,
  crit = 5,
  hit = 1
)
unlist(my_stats)
#>  int   sp crit  hit 
#>  285  527    5    1

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
  shoulders = list(int = 13, sp = 23),
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
  ),
  "ZG Zandalarian Hero Charm" = list(
    trinket1 = "zhc"
  ),
  "ZG2 Zandalarian Hero Charm" = list(
    trinket2 = "zhc"
  )
)

my_bank <- list(
  "Royal Seal of Eldre'Thalas" = list(
    trinket1 = list(sp = 23)
  ),
  "Kezan's Taint" = list(
    neck = list(int = 6, sp = 12)
  ),
  "Zanzil's Band" = list(
    finger1 = list(int = 13, hit = 1, mp5 = 4)
  ),
  "Felherat Robes" = list(
    chest = list(int = 20, sp = 13, hit = 1)
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
  "Seal + Gloves" = list(
    trinket1 = list(sp = 23),
    hands = list(sp = 33)
  ),
  "Star of Mystaria" = list(
    neck = list(int = 9, hit = 1)
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
#>  0.3462644  1.0000000 12.0512546 11.2916756  0.3457936
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3140152  1.0000000 10.1659216 11.3133457  0.3546922

show_result(my_stats, my_changes)
#>                                     dps         diff            slot
#> BWL Staff of the Shadow Flame  445.3790 18.893680690          weapon
#> BWL Neltharions's Tear         445.2731 18.787817214        trinket1
#> BWL2 Neltharions's Tear        443.5812 17.095856773        trinket2
#> ZG Bloodvine Garb              443.5429 17.057562259 chest/legs/feet
#> BWL Mish'undare, Circlet of th 439.8546 13.369260564            head
#> BWL Bracers of Arcane Accuarcy 434.4259  7.940566327           wrist
#> BWL Band of Forced Concentrati 433.6794  7.194043394         finger1
#> BWL Claw of Chromaggus         432.9790  6.493682145          weapon
#> BWL Ebony Flame Gloves         432.9653  6.479969963           hands
#> MC Choker of the Fire Lord     432.4568  5.971459361            neck
#> ZG Jin'do's Bag of Whammies    432.3722  5.886910420          weapon
#> ZG Cloak of Consumption        432.1834  5.698105482            back
#> BWL Master Dragonslayer's Orb  432.1524  5.667122057          weapon
#> MC Ring of Spell Power         432.1245  5.639137353         finger1
#> BWL Mantle of the Blackwing Ca 431.7968  5.311509615       shoulders
#> MC Talisman of Ephemeral Power 430.8320  4.346710367        trinket1
#> ZG Bloodvine Vest              430.0942  3.608877506           chest
#> BWL Cloak of the Brood Lord    429.8951  3.409745928            back
#> ZG The Hexxer's Cover          429.5531  3.067792540            head
#> ZG Zandalarian Hero Charm      429.3279  2.842580011        trinket1
#> ZG Bloodvine Leggings          429.1596  2.674246911            legs
#> ZG Kezan's Ustoppable Taint    429.0904  2.605076105            neck
#> MC2 Talisman of Ephemeral Powe 429.0861  2.600742497        trinket2
#> MC Robe of Volatile Power      429.0515  2.566220957           chest
#> ZG Band of Servitube           428.9625  2.477229847         finger1
#> ZG Zanzil's Seal               428.8279  2.342553003         finger1
#> ZG Zanzil's Concentration      428.2586  1.773330423 finger1/finger2
#> BWL Nemesis Robes              427.9372  1.451844541           chest
#> MC Mana Igniting Cord          427.7248  1.239491396           waist
#> ZG2 Zandalarian Hero Charm     427.5672  1.081868201        trinket2
#> current                        426.4853  0.000000000            <NA>
#> BWL Nemesis Bracers            426.4753 -0.009979768           wrist
#> BWL Nemesis Boots              423.2738 -3.211516779            feet

show_result(my_stats, my_bank)
#>                                 dps       diff           slot
#> Felcloth Gloves            426.7390  0.2536365          hands
#> current                    426.4853  0.0000000           <NA>
#> Felheart Bracers           425.6298 -0.8555279          wrist
#> Royal Seal of Eldre'Thalas 425.5759 -0.9094556       trinket1
#> Seal + Gloves              425.5203 -0.9649741 trinket1/hands
#> Zanzil's Band              424.8631 -1.6222659        finger1
#> Maleki's Footwraps         423.8276 -2.6577010           feet
#> Star of Mystaria           422.5992 -3.8861301           neck
#> Kezan's Taint              422.5475 -3.9378114           neck
#> Felheart Slippers          420.1239 -6.3614334           feet
#> Felherat Robes             419.7227 -6.7625956          chest
show_result(my_stats_ony, my_bank)
#>                                 dps       diff           slot
#> Seal + Gloves              481.0311  2.1707610 trinket1/hands
#> Felcloth Gloves            480.2988  1.4384027          hands
#> Royal Seal of Eldre'Thalas 479.7483  0.8878754       trinket1
#> current                    478.8604  0.0000000           <NA>
#> Felheart Bracers           477.8641 -0.9962744          wrist
#> Zanzil's Band              476.9403 -1.9201099        finger1
#> Maleki's Footwraps         475.9426 -2.9177312           feet
#> Kezan's Taint              474.3492 -4.5111830           neck
#> Star of Mystaria           474.3462 -4.5141658           neck
#> Felheart Slippers          471.7573 -7.1030447           feet
#> Felherat Robes             470.9550 -7.9054228          chest
```
