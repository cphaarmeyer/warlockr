context("with_buffs")


test_that("with_buffs works as expected", {
  stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
  out_id <- with_buffs(stats, buffs = character())
  out_buffs <- with_buffs(stats)
  out_consumables <- with_buffs(stats, consumables = c("gae", "eosp"))
  out_wordbuffs <- with_buffs(stats, worldbuffs = c("ony", "zg"))
  out_mult <- with_buffs(stats,
    buffs = c("ai", "motw"), worldbuffs = c("ony", "zg")
  )

  expect_identical(out_id, clean_stats(stats))
  is_greater_somewhere <- function(out) {
    do.call(any, do_call_stats(list(out, stats), `>`))
  }
  expect_true(is_greater_somewhere(out_buffs))
  expect_true(is_greater_somewhere(out_consumables))
  expect_true(is_greater_somewhere(out_wordbuffs))
  expect_true(is_greater_somewhere(out_mult))
  expect_error(with_buffs(stats, worldbuffs = c("dm", "wb")))
  expect_gt(out_wordbuffs$int, stats$int)
  expect_error(with_buffs(stats, consumables = c("gae", "eogf")))
  expect_error(with_buffs(stats, buffs = c("ai", "gae")))
})
