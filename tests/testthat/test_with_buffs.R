context("with_buffs")


test_that("with_buffs works as expected", {
  stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
  out <- with_buffs(stats)

  expect_true(do.call(all, do_call_stats(list(out, stats), `>=`)))
  expect_true(do.call(any, do_call_stats(list(out, stats), `>`)))
  expect_error(with_buffs(stats, worldbuffs = c("dm", "wb")))
  expect_gt(with_buffs(stats, worldbuffs = "zg")$int, stats$int)
  expect_error(with_buffs(stats, consumables = c("gae", "eogf")))
  expect_error(with_buffs(stats, buffs = c("ai", "gae")))
})
