context("sim_dps")


test_that("sim_dps works as expected", {
  mat <- sim_dps(list(int = 277, sp = 346, crit = 2, hit = 2), iter = 1000)

  expect_equal(dim(mat), c(1000, 4))
  expect_type(mat, "double")
  expect_true(all(mat >= 0))
})
