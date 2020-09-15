context("lifetap")


test_that("lifetap works as expected", {
  lt <- lifetap(346)

  expect_length(lt, 4)
  expect_type(lt, "double")
  expect_gt(lt[[2]], 0)
  expect_true(lt[[3]] == 1.5)
  expect_true(all(lt[c(1, 4)] == 0))
  expect_named(lt, c("dmg", "mana", "time", "proc"))
})
