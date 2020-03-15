context("shadowbolt")


test_that("shadowbolt works as expected", {
  sb <- shadowbolt(2, 1, 277, 346)

  expect_length(sb, 4)
  expect_type(sb, "double")
  expect_lt(sb[[2]], 0)
  expect_gt(sb[[3]], 0)
  expect_true(all(sb[c(1, 4)] >= 0))
})
