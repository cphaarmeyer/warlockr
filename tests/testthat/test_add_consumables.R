context("add_consumables")


test_that("add_consumables works as expected", {
  stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
  out <- add_consumables(stats)

  expect_true(do.call(all, do_call_stats(list(out, stats), `>=`)))
  expect_true(do.call(any, do_call_stats(list(out, stats), `>`)))
  expect_error(add_consumables(stats, c("gae", "eogf")))
})
