context("clean_stats")


test_that("clean_stats works as expected", {
  s <- list(int = 277, sp = 346, crit = 2, hit = 2)
  s1 <- c(s, list(a = 2))
  s2 <- s[c("int", "crit")]
  s3 <- s[c("crit", "hit", "int", "sp")]
  res <- list(int = 277, sp = 346, crit = 2, hit = 2, mp5 = 0)

  expect_identical(clean_stats(s), res)
  expect_error(clean_stats(s1))
  expect_identical(
    clean_stats(s2),
    list(int = 277, sp = 0, crit = 2, hit = 0, mp5 = 0)
  )
  expect_identical(clean_stats(s3), res)
})
