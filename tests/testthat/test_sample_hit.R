context("sample_hit")


test_that("sample_hit works as expected", {
  p <- sample_hit(50000)

  expect_length(p, 50000)
  expect_true(all(p >= 0))
  expect_true(all(p <= 100))
})
