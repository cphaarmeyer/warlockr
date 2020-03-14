context("compare_items")


test_that("compare_items works as expected", {
  df <- compare_items(
    list(int = 277, sp = 346, crit = 2, hit = 2),
    items = list(
      sp = list(sp = 1),
      int = list(int = -1),
      crit = list(crit = 1),
      hit = list(hit = -1)
    ),
    iter = 1000
  )

  expect_s3_class(df, "data.frame")
  expect_named(df, c("dps", "diff"))
  expect_identical(rownames(df), c("current", "sp", "int", "crit", "hit"))
  expect_true(df[1, 2] == 0)
  expect_true(all(df[c(2, 4), 2] > 0))
  expect_true(all(df[c(3, 5), 2] < 0))
})
