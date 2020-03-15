context("compute_mana")


test_that("compute_mana works as expected", {
  m1 <- compute_mana(267)
  m2 <- compute_mana(268)

  expect_length(m1, 1)
  expect_type(m1, "double")
  expect_gt(m2, m1)
})
