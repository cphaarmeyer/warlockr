context("compare_buffs")


test_that("compare_buffs works as expected", {
  consumables <- c("gae", "eosp", "bwo")
  worldbuffs <- c("ony", "zg", "ss", "dm")
  out <- compare_buffs(list(int = 275, sp = 581, crit = 5, hit = 9),
    consumables = consumables, worldbuffs = worldbuffs, iter = 1000
  )

  expect_s3_class(out, "data.frame")
  expect_named(out, c("dps", "diff"))
  expect_true(all(consumables %in% rownames(out)))
  expect_true(all(worldbuffs %in% rownames(out)))
  expect_true(all(out$diff >= 0))
  expect_true(nrow(out) == length(consumables) + length(worldbuffs) + 1)
})
