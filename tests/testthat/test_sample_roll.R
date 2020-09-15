context("sample_roll")


test_that("sample_roll works as expected", {
  p <- sample_roll(50000)

  expect_length(p, 50000)
  expect_true(all(p >= 0))
  expect_true(all(p <= 100))
})
