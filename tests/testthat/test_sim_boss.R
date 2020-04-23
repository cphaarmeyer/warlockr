context("sim_boss")


test_that("sim_boss works as expected", {
  stats <- list(int = 277, sp = 346, crit = 2, hit = 2, mp5 = 8)
  seed <- sample(1:1000, 1)
  set.seed(seed)
  sim <- sim_boss(stats)
  set.seed(seed)
  sim_toep <- sim_boss(stats, trinkets = "toep")
  set.seed(seed)
  sim_toep_zhc <- sim_boss(stats, trinkets = c("toep", "zhc"))
  set.seed(seed)
  sim_cpp <- sim_boss(stats, cpp = TRUE)

  expect_length(sim, 4)
  expect_type(sim, "double")
  expect_true(all(sim >= 0))
  expect_gte(sim[[3]], 150)
  expect_gte(sim_toep[[1]], sim[[1]])
  expect_gte(sim_toep_zhc[[1]], sim[[1]])
  expect_equal(sim, sim_cpp)
})
