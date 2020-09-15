context("trinket_sp")


test_that("trinket_sp works as expected", {
  times <- c(15, 20, 25, 139, 140, 142, 240, 241, 261) + 5

  expect_equal(
    trinket_uptime(times, 20, 120),
    list(
      15, 20, 20,
      c(20, 19), c(20, 20), c(20, 20),
      c(20, 20, 0), c(20, 20, 1), c(20, 20, 20)
    )
  )
  expect_equal(
    trinket_uptime(times[1:3], 20, 120),
    list(15, 20, 20)
  )
  expect_equal(
    trinket_uptime(times[4:6], 20, 120),
    list(c(20, 19), c(20, 20), c(20, 20))
  )
  expect_equal(
    trinket_uptime(times[c(1:2, 7)], 15, 90), list(15, 15, c(15, 15, 15))
  )

  expect_equal(
    lengths(trinket_sp("zhc", times)), c(5, 7, 7, 14, 14, 14, 14, 14, 21)
  )
})
