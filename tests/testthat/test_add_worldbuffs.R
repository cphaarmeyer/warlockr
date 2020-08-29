context("add_worldbuffs")


test_that("add_worldbuffs works as expected", {
  stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
  out <- add_worldbuffs(stats)

  expect_true(do.call(all, do_call_stats(list(out, stats), `>=`)))
  expect_true(do.call(any, do_call_stats(list(out, stats), `>`)))
  expect_error(add_worldbuffs(stats, c("dm", "wb")))
  expect_gt(add_worldbuffs(stats, "zg")$int, stats$int)
})
