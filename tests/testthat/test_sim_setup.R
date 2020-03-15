context("sim_setup")


test_that("sim_setup works as expected", {
  out <- sim_setup(10, 2, 1, 277, 346)

  expect_named(out, c(
    "mana", "sb_dmg", "sb_miss", "sb_crit",
    "sb_manacost", "lt_manacost", "curse_miss"
  ))
  expect_type(out, "list")
  expect_equivalent(lengths(out), c(1, 10, 10, 10, 1, 1, 10))
  expect_equivalent(
    lapply(out, typeof),
    c("double", "double", "logical", "logical", "double", "double", "logical")
  )
  expect_gt(out$mana, 0)
  expect_lt(out$sb_manacost, 0)
  expect_gt(out$lt_manacost, 0)
  expect_true(all(out$sb_dmg >= 0))
})
