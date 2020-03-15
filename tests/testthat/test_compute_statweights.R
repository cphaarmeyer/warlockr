context("compute_statweights")


test_that("compute_statweights works as expected", {
  weights <- compute_statweights(list(int = 277, sp = 346, crit = 2, hit = 2), iter = 1000)

  expect_named(weights, c("int", "sp", "crit", "hit", "mp5"))
  expect_type(weights, "double")
  expect_true(weights[["sp"]] == 1)
})
