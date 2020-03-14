context("clean_stats")


test_that("clean_stats works as expected", {
  s <- list(int = 277, sp = 346, crit = 2, hit = 2)
  s1 <- c(s, list(a = 2))
  s2 <- s[c("int", "crit")]
  s3 <- s[c("crit", "hit", "int", "sp")]

  expect_identical(
    clean_stats(s),
    list(int = 277, sp = 346, crit = 2, hit = 2, mp5 = 0)
  )
  expect_identical(clean_stats(s1), clean_stats(s))
  expect_identical(
    clean_stats(s2),
    list(int = 277, sp = 0, crit = 2, hit = 0, mp5 = 0)
  )
  expect_identical(clean_stats(s3), clean_stats(s))
})
