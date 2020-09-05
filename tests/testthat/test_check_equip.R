context("check_equip")


test_that("check_equip works as expected", {
  equip <- setNames(rep(list(list()), 16), c(
    "head", "neck", "shoulders", "back", "chest", "wrist",
    "hands", "waist", "legs", "feet", "finger1", "finger2",
    "trinket1", "trinket2", "weapon", "wand"
  ))
  equip_miss <- equip[1:15]
  equip_extra <- c(equip, list(a = list()))
  equip_typo <- c(equip[1:15], list(weapn = list()))
  equip_shuffle <- equip[sample.int(16)]
  equip_mult <- c(equip, list(weapon = list()))

  expect_true(check_equip(equip))
  expect_false(check_equip(equip_miss))
  expect_false(check_equip(equip_extra))
  expect_false(check_equip(equip_typo))
  expect_true(check_equip(equip_shuffle))
  expect_false(check_equip(equip_mult))
})
