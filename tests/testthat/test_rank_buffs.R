context("rank_buffs")


test_that("rank_buffs works as expected", {
  stats <- with_buffs(list(int = 275, sp = 581, crit = 5, hit = 9))
  consumables <- c("gae", "eosp", "bwo")
  worldbuffs <- c("ony", "zg")
  out <- rank_buffs(stats,
    consumables = consumables, worldbuffs = worldbuffs, iter = 1000
  )

  expect_s3_class(out, "data.frame")
  expect_true(setequal(row.names(out), c("current", consumables, worldbuffs)))
  expect_equal(out$dps, sort(out$dps))
})
