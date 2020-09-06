context("add_buff")


test_that("add_buff works as expected", {
  stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
  with_buffs0 <- function(stats, buffs = character(), ...) {
    with_buffs(stats = stats, buffs = buffs, ...)
  }

  expect_identical(
    add_buff(stats, "ony"), with_buffs0(stats, worldbuffs = "ony")
  )
  expect_identical(
    add_buff(stats, "eosp"), with_buffs0(stats, consumables = "eosp")
  )
  expect_identical(
    add_buff(stats, "ai"), with_buffs0(stats, buffs = "ai")
  )
  expect_error(add_buff(stats, c("ony", "zg")))
  expect_error(add_buff(stats, "toep"), "buff not found")
})
