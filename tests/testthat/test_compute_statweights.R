context("compute_statweights")


test_that("compute_statweights works as expected", {
  stats <- list(int = 277, sp = 346, crit = 2, hit = 2)
  weights <- compute_statweights(stats, iter = 1000)
  seed <- sample_seed()
  w_seed1 <- compute_statweights(stats, iter = 1000, seed = seed)
  w_seed2 <- compute_statweights(stats, iter = 1000, seed = seed)

  expect_s3_class(weights, "data.frame")
  expect_named(weights, c("weight", "dps"))
  expect_identical(row.names(weights), c("int", "sp", "crit", "hit", "mp5"))
  expect_type(weights[["weight"]], "double")
  expect_true(weights[["sp", "weight"]] == 1)
  expect_identical(w_seed1, w_seed2)
  verify_output(
    test_path("test_compute_statweights.txt"),
    compute_statweights(stats, iter = 1000, seed = 42)
  )
})
