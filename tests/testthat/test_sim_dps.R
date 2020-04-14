context("sim_dps")


test_that("sim_dps works as expected", {
  stats <- list(int = 277, sp = 346, crit = 2, hit = 2)
  seed <- sample(1:1000, 1)
  mat <- sim_dps(stats, iter = 1000, seed = seed)
  mat_toep <- sim_dps(stats, iter = 1000, seed = seed, trinkets = "toep")

  expect_equal(dim(mat), c(1000, 4))
  expect_type(mat, "double")
  expect_true(all(mat >= 0))
  expect_true(all(mat_toep[, 4] >= mat[, 4]))
})
