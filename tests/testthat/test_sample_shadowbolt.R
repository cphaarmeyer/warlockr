context("sample_shadowbolt")


test_that("sample_shadowbolt works as expected", {
  d <- sample_shadowbolt(50000)

  expect_length(d, 50000)
  expect_true(all(d >= 482))
  expect_true(all(d <= 538))
})
