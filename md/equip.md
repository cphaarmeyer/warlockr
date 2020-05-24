
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
#>  0.3757275  1.0000000 13.1873383 12.1810065  0.2745131
show_statweights(my_stats_ony)
#>        int         sp       crit        hit        mp5 
#>  0.3410901  1.0000000 11.1198261 12.2403698  0.2646944

show_result(my_stats, my_changes)
#>                                     dps        diff            slot
#> BWL Neltharions's Tear         486.9376 18.17441085        trinket1
#> BWL2 Neltharions's Tear        485.2748 16.51160755        trinket2
#> BWL Mish'undare, Circlet of th 483.2640 14.50081560            head
#> ZG Bloodvine Garb              483.1165 14.35326497 chest/legs/feet
#> BWL Mantle of the Blackwing Ca 478.4535  9.69029062       shoulders
#> BWL Bracers of Arcane Accuarcy 477.4305  8.66731108           wrist
#> BWLS Bracers of Arcane Accuarc 475.8941  7.13088642 wrist/shoulders
#> MC Choker of the Fire Lord     475.1815  6.41832927            neck
#> BWL Ebony Flame Gloves         475.1518  6.38859852           hands
#> BWL Band of Forced Concentrati 473.8896  5.12633696         finger1
#> BWLS Mantle of the Blackwing C 472.9385  4.17529884       shoulders
#> MC Talisman of Ephemeral Power 472.3600  3.59674141        trinket1
#> ZG The Hexxer's Cover          472.0413  3.27808372            head
#> MC Ring of Spell Power         471.9697  3.20651884         finger1
#> ZG Bloodvine Vest              471.2764  2.51322760           chest
#> MC2 Talisman of Ephemeral Powe 470.6146  1.85141201        trinket2
#> MC Robe of Volatile Power      470.3690  1.60580168           chest
#> MC Mana Igniting Cord          470.1321  1.36883681           waist
#> ZGS Kezan's Ustoppable Taint   470.0958  1.33262698  neck/shoulders
#> ZG Bloodtinged Gloves          469.5612  0.79797129           hands
#> ZG Zanzil's Seal               468.9273  0.16411226         finger1
#> ZG Zanzil's Concentration      468.8251  0.06184043 finger1/finger2
#> BWL Nemesis Bracers            468.8138  0.05058784           wrist
#> current                        468.7632  0.00000000            <NA>
#> BWLS Nemesis Bracers           467.4560 -1.30721279 wrist/shoulders
#> ZG Kezan's Ustoppable Taint    465.9370 -2.82620166            neck
#> BWL Nemesis Boots              465.2437 -3.51949672            feet

show_result(my_stats, my_bank)
#>                                     dps         diff            slot
#> Nemesis Spaulders              472.9383  4.175106084       shoulders
#> current                        468.7632  0.000000000            <NA>
#> Felcloth Gloves                468.7620 -0.001242436           hands
#> Felheart Bracers               467.8774 -0.885849805           wrist
#> S Zandalar Demoniac's Robe     467.5384 -1.224827837 chest/shoulders
#> S Nemesis Spaulders            467.3716 -1.391648793       shoulders
#> Eye of the Beast               466.7840 -1.979249825        trinket1
#> Robe of the Void               466.7310 -2.032196690           chest
#> S Felheart Bracers             466.5699 -2.193283716 wrist/shoulders
#> Kezan's Taint                  465.9370 -2.826201657            neck
#> Maleki's Footwraps             465.8848 -2.878365314            feet
#> Nemesis Leggings               465.8443 -2.918921501            legs
#> Star of Mystaria               465.1525 -3.610733662            neck
#> 2 Eye of the Beast             465.0022 -3.761007275        trinket2
#> Zanzil's Band                  464.7894 -3.973775637         finger1
#> Royal Seal of Eldre'Thalas     464.2647 -4.498490339        trinket2
#> Zandalar Demoniac's Robe       463.5257 -5.237539287           chest
show_result(my_stats_ony, my_bank)
#>                                     dps        diff            slot
#> Nemesis Spaulders              530.5218  4.74457316       shoulders
#> Felcloth Gloves                527.0444  1.26720762           hands
#> S Zandalar Demoniac's Robe     525.7937  0.01642186 chest/shoulders
#> current                        525.7772  0.00000000            <NA>
#> Robe of the Void               524.7788 -0.99845325           chest
#> Felheart Bracers               524.7229 -1.05434251           wrist
#> S Nemesis Spaulders            524.2723 -1.50497308       shoulders
#> S Felheart Bracers             523.3363 -2.44094538 wrist/shoulders
#> Maleki's Footwraps             522.5976 -3.17960960            feet
#> Kezan's Taint                  522.4653 -3.31197209            neck
#> Nemesis Leggings               522.3245 -3.45273921            legs
#> Star of Mystaria               521.5862 -4.19108045            neck
#> Eye of the Beast               521.4940 -4.28320836        trinket1
#> Zanzil's Band                  521.2494 -4.52789209         finger1
#> Zandalar Demoniac's Robe       521.1764 -4.60081907           chest
#> Royal Seal of Eldre'Thalas     520.7265 -5.05076430        trinket2
#> 2 Eye of the Beast             519.5114 -6.26584766        trinket2
```
