context("shadowbolt")


test_that("shadowbolt works as expected", {
  sb <- shadowbolt(2, 1, 277, 346)
  sb_impl <- shadowbolt_impl(123, FALSE, TRUE, 123, 2.5, 2)

  expect_length(sb, 4)
  expect_type(sb, "double")
  expect_lt(sb[[2]], 0)
  expect_gt(sb[[3]], 0)
  expect_true(all(sb[c(1, 4)] >= 0))
  expect_equal(sb_impl[4], 4)
})
