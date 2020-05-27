
# Equip

This file keeps track of my current stats, equip and potential upgrades.

``` r
library(warlockr)

my_stats <- list(
  int = 278 + 31 + 16,
  sp = 497 + 33 + 40,
  crit = 5,
  hit = 4,
  mp5 = 0
)
unlist(my_stats)
#>  int   sp crit  hit  mp5 
#>  325  570    5    4    0

my_stats_ony <- sum_stats(list(my_stats, list(crit = 10)))

my_equip <- list(
  head = list(int = 16, sp = 32),
  neck = list(int = 8, sp = 14),
  shoulders = list(int = 13, sp = 23),
  back = list(int = 10, sp = 23, hit = 1),
  chest = list(int = 16, sp = 32, crit = 1),
  wrist = list(int = 8, sp = 16),
  hands = list(int = 15, sp = 15, crit = 1),
  waist = list(int = 8, sp = 25, crit = 1),
  legs = list(int = 6, sp = 37, hit = 1),
  feet = list(int = 16, sp = 19, hit = 1),
  finger1 = list(int = 6, sp = 33),
  finger2 = list(int = 12, sp = 21, hit = 1),
  trinket1 = list(sp = 29),
  trinket2 = "zhc",
  weapon = list(int = 29, sp = 84, crit = 2),
  wand = list(sp = 18)
)

my_changes <- list(
  "MC Choker of the Fire Lord" =
    list(neck = list(int = 7, sp = 34)),
  "MC Choker of the Fire Lord (Set)" = list(
    neck = list(int = 7, sp = 34),
    shoulders = list(int = 19, sp = 12)
  ),
  "MC Robe of Volatile Power" =
    list(chest = list(int = 15, sp = 23, crit = 2)),
  "MC Mana Igniting Cord" =
    list(waist = list(int = 16, sp = 25, crit = 1)),
  "MC Talisman of Ephemeral Power" =
    list(trinket1 = "toep"),
  "MC Talisman of Ephemeral Power 2" =
    list(trinket2 = "toep"),
  "BWL Nemesis Bracers" =
    list(wrist = list(int = 11, sp = 15)),
  "BWL Nemesis Bracers (Set)" = list(
    wrist = list(int = 11, sp = 15),
    neck = list(sp = 22 - 12, mp5 = 3)
  ),
  "BWL Nemesis Boots" =
    list(feet = list(int = 17, sp = 23)),
  "BWL Mantle of the Blackwing Cabal" =
    list(shoulders = list(int = 16, sp = 34)),
  "BWL Bracers of Arcane Accuarcy" =
    list(wrist = list(int = 12, sp = 21, hit = 1)),
  "BWL Bracers of Arcane Accuarcy (Set)" = list(
    wrist = list(int = 12, sp = 21, hit = 1),
    neck = list(sp = 22 - 12, mp5 = 3)
  ),
  "BWL Ebony Flame Gloves" =
    list(hands = list(int = 12, sp = 43)),
  "BWL Neltharions's Tear" =
    list(trinket1 = list(sp = 44, hit = 2)),
  "BWL Neltharions's Tear 2" =
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
    list(hands = list(int = 10, sp = 19, hit = 1))
)

my_bank <- list(
  "Jeklik's Opaline Talisman" =
    list(neck = list(sp = 22, mp5 = 3)),
  "Jeklik's Opaline Talisman (Set)" = list(
    neck = list(sp = 22, mp5 = 3),
    shoulders = list(int = 19, sp = 12)
  ),
  "Band of Servitude" =
    list(finger1 = list(int = 9, sp = 23)),
  "Zandalar Demoniac's Mantle" =
    list(shoulders = list(int = 19, sp = 12)),
  "Zandalar Demoniac's Robe" =
    list(chest = list(sp = 27, hit = 1)),
  "Zandalar Demoniac's Robe (Set)" = list(
    chest = list(sp = 27, hit = 1),
    neck = list(sp = 22, mp5 = 3)
  ),
  "Royal Seal of Eldre'Thalas" =
    list(trinket2 = list(sp = 23)),
  "Felheart Bracers" =
    list(wrist = list(int = 11, sp = 13)),
  "Felheart Bracers (Set)" = list(
    wrist = list(int = 11, sp = 13),
    neck = list(sp = 22 - 12, mp5 = 3)
  ),
  "Maleki's Footwraps" =
    list(feet = list(int = 9, sp = 27)),
  "Felcloth Gloves" =
    list(hands = list(sp = 33)),
  "Soul Corrupter's Necklace" =
    list(neck = list(int = 16, hit = 1)),
  "Soul Corrupter's Necklace (Set)" = list(
    neck = list(int = 16, hit = 1),
    shoulders = list(int = 19, sp = 12)
  ),
  "Eye of the Beast" =
    list(trinket1 = list(crit = 2)),
  "Eye of the Beast 2" =
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

w <- max(nchar(names(c(my_changes, my_bank))))
show_result <- function(stats, changes) {
  set.seed(42)
  df <- compare_equip(stats, my_equip, changes)
  df <- df[order(-df$dps), ]
  row.names(df) <- format(row.names(df), width = w)
  df[c("dps", "diff")] <- lapply(df[c("dps", "diff")], round, digits = 2)
  df
}


show_statweights(my_stats)
#>        int         sp       crit        hit        mp5 
#>  0.3343152  1.0000000 12.7594734 12.0040831  0.3488011
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3092732  1.0000000 10.6309548 11.9744874  0.3349032

show_result(my_stats, my_changes)
#>                                                dps  diff            slot
#> BWL Neltharions's Tear                      500.82 18.38        trinket1
#> BWL Neltharions's Tear 2                    500.47 18.03        trinket2
#> BWL Mish'undare, Circlet of the Mind Flayer 497.23 14.79            head
#> ZG Bloodvine Garb                           496.91 14.47 chest/legs/feet
#> MC Choker of the Fire Lord                  491.56  9.11            neck
#> BWL Bracers of Arcane Accuarcy              491.05  8.61           wrist
#> BWL Ebony Flame Gloves                      488.93  6.48           hands
#> BWL Bracers of Arcane Accuarcy (Set)        488.30  5.85      wrist/neck
#> BWL Mantle of the Blackwing Cabal           488.03  5.58       shoulders
#> MC Choker of the Fire Lord (Set)            487.46  5.02  neck/shoulders
#> ZG The Hexxer's Cover                       485.60  3.16            head
#> ZG Bloodvine Vest                           484.75  2.30           chest
#> MC Robe of Volatile Power                   484.01  1.57           chest
#> MC Mana Igniting Cord                       483.73  1.29           waist
#> MC Talisman of Ephemeral Power              483.25  0.80        trinket1
#> ZG Bloodtinged Gloves                       483.00  0.55           hands
#> MC Talisman of Ephemeral Power 2            482.80  0.36        trinket2
#> BWL Nemesis Bracers                         482.50  0.05           wrist
#> current                                     482.44  0.00            <NA>
#> BWL Nemesis Bracers (Set)                   479.64 -2.80      wrist/neck
#> BWL Nemesis Boots                           478.83 -3.62            feet
#> ZG Zanzil's Seal                            478.53 -3.91         finger1
#> ZG Zanzil's Concentration                   477.49 -4.96 finger1/finger2

show_result(my_stats, my_bank)
#>                                                dps  diff           slot
#> Jeklik's Opaline Talisman                   485.14  2.70           neck
#> Soul Corrupter's Necklace                   482.80  0.36           neck
#> current                                     482.44  0.00           <NA>
#> Felcloth Gloves                             482.22 -0.22          hands
#> Felheart Bracers                            481.55 -0.90          wrist
#> Jeklik's Opaline Talisman (Set)             481.12 -1.32 neck/shoulders
#> Eye of the Beast                            480.53 -1.91       trinket1
#> Robe of the Void                            480.36 -2.09          chest
#> Eye of the Beast 2                          480.08 -2.37       trinket2
#> Zandalar Demoniac's Robe (Set)              479.77 -2.67     chest/neck
#> Maleki's Footwraps                          479.30 -3.15           feet
#> Nemesis Leggings                            479.28 -3.17           legs
#> Royal Seal of Eldre'Thalas                  479.21 -3.23       trinket2
#> Felheart Bracers (Set)                      478.71 -3.74     wrist/neck
#> Soul Corrupter's Necklace (Set)             478.61 -3.83 neck/shoulders
#> Band of Servitude                           478.25 -4.19        finger1
#> Zandalar Demoniac's Mantle                  478.22 -4.22      shoulders
#> Zandalar Demoniac's Robe                    477.07 -5.37          chest
show_result(my_stats_ony, my_bank)
#>                                                dps  diff           slot
#> Jeklik's Opaline Talisman                   544.17  3.13           neck
#> Felcloth Gloves                             542.11  1.06          hands
#> Soul Corrupter's Necklace                   541.33  0.29           neck
#> current                                     541.04  0.00           <NA>
#> Robe of the Void                            540.02 -1.02          chest
#> Felheart Bracers                            539.98 -1.07          wrist
#> Jeklik's Opaline Talisman (Set)             539.59 -1.45 neck/shoulders
#> Zandalar Demoniac's Robe (Set)              539.49 -1.55     chest/neck
#> Maleki's Footwraps                          537.61 -3.43           feet
#> Royal Seal of Eldre'Thalas                  537.41 -3.63       trinket2
#> Nemesis Leggings                            537.35 -3.69           legs
#> Felheart Bracers (Set)                      536.93 -4.11     wrist/neck
#> Eye of the Beast                            536.77 -4.27       trinket1
#> Soul Corrupter's Necklace (Set)             536.52 -4.52 neck/shoulders
#> Zandalar Demoniac's Robe                    536.32 -4.72          chest
#> Band of Servitude                           536.28 -4.76        finger1
#> Eye of the Beast 2                          536.26 -4.78       trinket2
#> Zandalar Demoniac's Mantle                  536.21 -4.83      shoulders
```
