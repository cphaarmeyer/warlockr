
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 244 + 31 + 16,
  sp = 448 + 33 + 40,
  crit = 4,
  hit = 2,
  mp5 = 3
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  291  521    4    2    3

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
#>  0.3408522  1.0000000 12.8926149 11.7561182  0.3305238
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3093079  1.0000000 10.8300359 11.6608172  0.2874060

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Staff of the Shadow Flame  458.6394 19.16886953          weapon
#> BWL Neltharions's Tear         456.8540 17.38345548        trinket1
#> BWL2 Neltharions's Tear        455.0795 15.60893961        trinket2
#> BWL Mish'undare, Circlet of th 453.1739 13.70334242            head
#> ZG Bloodvine Garb              452.8687 13.39814094 chest/legs/feet
#> BWL Bracers of Arcane Accuarcy 447.5071  8.03655578           wrist
#> BWL Band of Forced Concentrati 446.7786  7.30802045         finger1
#> BWL Claw of Chromaggus         445.6965  6.22594990          weapon
#> BWL Ebony Flame Gloves         445.6261  6.15553702           hands
#> ZG Jin'do's Bag of Whammies    445.4955  6.02500134          weapon
#> MC Choker of the Fire Lord     445.4733  6.00279816            neck
#> ZG Cloak of Consumption        445.3381  5.86752705            back
#> BWL Master Dragonslayer's Orb  445.2587  5.78812692          weapon
#> MC Ring of Spell Power         445.0606  5.59010686         finger1
#> BWL Mantle of the Blackwing Ca 444.8380  5.36749395       shoulders
#> BWL Cloak of the Brood Lord    442.9935  3.52297320            back
#> MC Talisman of Ephemeral Power 442.9333  3.46278039        trinket1
#> ZG The Hexxer's Cover          442.5481  3.07752021            head
#> ZG Kezan's Ustoppable Taint    442.0961  2.62556794            neck
#> ZG Band of Servitube           442.0373  2.56672381         finger1
#> ZG Zanzil's Seal               442.0318  2.56122838         finger1
#> ZG Zanzil's Concentration      441.5925  2.12198620 finger1/finger2
#> ZG Bloodvine Vest              441.4322  1.96171515           chest
#> MC2 Talisman of Ephemeral Powe 441.2886  1.81802987        trinket2
#> MC Robe of Volatile Power      440.7774  1.30685830           chest
#> MC Mana Igniting Cord          440.6695  1.19900881           waist
#> current                        439.4705  0.00000000            <NA>
#> BWL Nemesis Bracers            439.4603 -0.01020363           wrist
#> BWL Nemesis Boots              436.1842 -3.28637122            feet

show_result(my_stats, my_bank)
#>                                 dps       diff     slot
#> current                    439.4705  0.0000000     <NA>
#> Felcloth Gloves            439.2975 -0.1730499    hands
#> Felheart Bracers           438.5675 -0.9030393    wrist
#> Zanzil's Band              438.0239 -1.4466805  finger1
#> Robe of the Void           437.4288 -2.0416856    chest
#> Eye of the Beast           437.2629 -2.2075946 trinket1
#> Kezan's Taint              436.7520 -2.7185747     neck
#> Nemesis Leggings           436.7319 -2.7385925     legs
#> Maleki's Footwraps         436.7000 -2.7705160     feet
#> Star of Mystaria           435.7583 -3.7122691     neck
#> 2 Eye of the Beast         435.5903 -3.8802153 trinket2
#> Royal Seal of Eldre'Thalas 434.9793 -4.4912171 trinket2
#> Felheart Slippers          433.0635 -6.4070089     feet
show_result(my_stats_ony, my_bank)
#>                                 dps       diff     slot
#> Felcloth Gloves            495.3900  1.1008799    hands
#> current                    494.2891  0.0000000     <NA>
#> Robe of the Void           493.2975 -0.9915916    chest
#> Felheart Bracers           493.2568 -1.0322892    wrist
#> Zanzil's Band              492.6219 -1.6671855  finger1
#> Maleki's Footwraps         491.2555 -3.0336259     feet
#> Kezan's Taint              491.1223 -3.1668248     neck
#> Nemesis Leggings           491.0755 -3.2136091     legs
#> Star of Mystaria           490.0006 -4.2884844     neck
#> Eye of the Beast           489.9444 -4.3447459 trinket1
#> Royal Seal of Eldre'Thalas 489.2445 -5.0446058 trinket2
#> 2 Eye of the Beast         488.0724 -6.2167113 trinket2
#> Felheart Slippers          487.1470 -7.1421540     feet
```
