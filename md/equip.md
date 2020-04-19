
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 225 + 31 + 16,
  sp = 431 + 59 + 40,
  crit = 5,
  hit = 1
)
unlist(my_stats)
#>  int   sp crit  hit 
#>  272  530    5    1

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(sp = 22, mp5 = 3),
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
  "Felheart Shoulder Pads" = list(
    shoulders = list(int = 17, sp = 9)
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
#>  0.3465069  1.0000000 12.1348644 11.3126048  0.3483035
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3123391  1.0000000 10.2276265 11.3520345  0.3553391

show_result(my_stats, my_changes)
#>                                     dps         diff            slot
#> BWL Staff of the Shadow Flame  444.6619 18.766545873          weapon
#> BWL Neltharions's Tear         444.4706 18.575268678        trinket1
#> BWL2 Neltharions's Tear        442.9006 17.005246139        trinket2
#> ZG Bloodvine Garb              442.8572 16.961849442 chest/legs/feet
#> BWL Mish'undare, Circlet of th 439.1514 13.256061322            head
#> BWL Bracers of Arcane Accuarcy 433.8390  7.943717772           wrist
#> BWL Band of Forced Concentrati 433.0836  7.188304542         finger1
#> BWL Ebony Flame Gloves         432.2958  6.400506917           hands
#> BWL Claw of Chromaggus         432.2746  6.379238501          weapon
#> MC Choker of the Fire Lord     431.9021  6.006788380            neck
#> BWL Mantle of the Blackwing Ca 431.7968  5.901501045       shoulders
#> ZG Jin'do's Bag of Whammies    431.7275  5.832208197          weapon
#> ZG Cloak of Consumption        431.5389  5.643551824            back
#> MC Ring of Spell Power         431.5312  5.635881127         finger1
#> BWL Master Dragonslayer's Orb  431.5113  5.616011989          weapon
#> MC Talisman of Ephemeral Power 430.1192  4.223840612        trinket1
#> ZG Bloodvine Vest              429.4614  3.566054714           chest
#> BWL Cloak of the Brood Lord    429.3134  3.418039220            back
#> ZG The Hexxer's Cover          428.9939  3.098599485            head
#> ZG Zandalarian Hero Charm      428.6496  2.754312803        trinket1
#> ZG Kezan's Ustoppable Taint    428.4924  2.597048249            neck
#> ZG Bloodvine Leggings          428.4837  2.588397632            legs
#> MC2 Talisman of Ephemeral Powe 428.4648  2.569486448        trinket2
#> ZG Band of Servitube           428.3829  2.487612559         finger1
#> MC Robe of Volatile Power      428.3679  2.472582260           chest
#> ZG Zanzil's Seal               428.2673  2.371953702         finger1
#> ZG Zanzil's Concentration      427.6169  1.721541614 finger1/finger2
#> BWL Nemesis Robes              427.3411  1.445801016           chest
#> MC Mana Igniting Cord          427.0734  1.178089312           waist
#> ZG2 Zandalarian Hero Charm     426.9448  1.049487192        trinket2
#> BWL Nemesis Spaulders          426.4853  0.589991430       shoulders
#> current                        425.8953  0.000000000            <NA>
#> BWL Nemesis Bracers            425.8900 -0.005277509           wrist
#> BWL Nemesis Boots              422.6466 -3.248764144            feet

show_result(my_stats, my_bank)
#>                                 dps       diff           slot
#> Felcloth Gloves            426.1448  0.2494869          hands
#> current                    425.8953  0.0000000           <NA>
#> Felheart Bracers           424.9843 -0.9109767          wrist
#> Royal Seal of Eldre'Thalas 424.9769 -0.9184664       trinket1
#> Seal + Gloves              424.6828 -1.2125525 trinket1/hands
#> Zanzil's Band              424.2824 -1.6129756        finger1
#> Maleki's Footwraps         423.1350 -2.7603040           feet
#> Star of Mystaria           422.0680 -3.8273524           neck
#> Kezan's Taint              421.8952 -4.0001206           neck
#> Felheart Shoulder Pads     420.8484 -5.0468813      shoulders
#> Felheart Slippers          419.5210 -6.3742971           feet
#> Felherat Robes             419.0835 -6.8118364          chest
show_result(my_stats_ony, my_bank)
#>                                 dps       diff           slot
#> Seal + Gloves              480.3091  1.9778887 trinket1/hands
#> Felcloth Gloves            479.8349  1.5036992          hands
#> Royal Seal of Eldre'Thalas 479.2748  0.9435787       trinket1
#> current                    478.3313  0.0000000           <NA>
#> Felheart Bracers           477.2871 -1.0441765          wrist
#> Zanzil's Band              476.4613 -1.8699678        finger1
#> Maleki's Footwraps         475.3151 -3.0161691           feet
#> Star of Mystaria           473.9359 -4.3953841           neck
#> Kezan's Taint              473.7831 -4.5481401           neck
#> Felheart Shoulder Pads     472.4776 -5.8536544      shoulders
#> Felheart Slippers          471.2279 -7.1033299           feet
#> Felherat Robes             470.4369 -7.8943802          chest
```
