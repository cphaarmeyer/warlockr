context("compare_buffs")


test_that("compare_buffs works as expected", {
  out <- compare_buffs(list(int = 275, sp = 581, crit = 5, hit = 9),
    iter = 1000
  )

  expect_s3_class(out, "data.frame")
  expect_named(out, c("dps", "diff"))
  expect_true(all(names(available_consumables) %in% rownames(out)))
  expect_true(all(names(available_worldbuffs) %in% rownames(out)))
  expect_true(all(out$diff >= 0))
})
