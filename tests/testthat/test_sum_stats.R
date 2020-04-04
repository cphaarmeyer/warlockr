context("sum_stats")


test_that("sum_stats works as expected", {
  test_list <- list(
    list(int = 1, sp = 2),
    list(crit = 3, hit = 4)
  )
  test_sum <- list(int = 1, sp = 2, crit = 3, hit = 4, mp5 = 0)

  expect_identical(sum_stats(test_list), test_sum)
})
