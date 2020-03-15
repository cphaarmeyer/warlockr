context("compute_manacost")


test_that("compute_manacost works as expected", {
  sb <- compute_manacost()
  lt <- compute_manacost("lifetap", sp = 346)

  expect_length(sb, 1)
  expect_length(lt, 1)
  expect_type(sb, "double")
  expect_type(lt, "double")
  expect_gt(sb, 0)
  expect_gt(lt, 0)
})
