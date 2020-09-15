context("compute_critchance")


test_that("compute_critchance works as expected", {
  c1 <- compute_critchance(3, 267)
  c2 <- compute_critchance(4, 267)
  c3 <- compute_critchance(3, 268)
  c4 <- compute_critchance(3, 267, list(devastation = 0))

  expect_length(c1, 1)
  expect_type(c1, "double")
  expect_gt(c2, c1)
  expect_gt(c3, c1)
  expect_lt(c4, c1)
})
