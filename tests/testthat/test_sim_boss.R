context("sim_boss")


test_that("sim_boss works as expected", {
  stats <- list(int = 277, sp = 346, crit = 2, hit = 2)
  sim <- sim_boss(stats)

  expect_length(sim, 4)
  expect_type(sim, "double")
  expect_true(all(sim >= 0))
  expect_gte(sim[[3]], 150)
})
