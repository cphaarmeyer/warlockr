context("sim_setup")


test_that("sim_setup works as expected", {
  out <- sim_setup(30, 2, 1, 277, 346)

  expect_named(out, c(
    "mana", "sb_dmg", "sb_miss", "sb_crit", "sb_manacost",
    "lt_manacost", "curse_miss", "sp_bonus"
  ))
  expect_type(out, "list")
  expect_equivalent(lengths(out), c(1, 13, 13, 13, 1, 1, 13, 0))
  expect_equivalent(
    lapply(out, typeof), c(
      "double", "integer", "logical", "logical",
      "double", "double", "logical", "NULL"
    )
  )
  expect_gt(out$mana, 0)
  expect_lt(out$sb_manacost, 0)
  expect_gt(out$lt_manacost, 0)
  expect_true(all(out$sb_dmg >= 0))
})
