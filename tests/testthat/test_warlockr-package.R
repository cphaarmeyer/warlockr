context("warlockr-package")


test_that("warlockr-package works as expected", {
  expect_type(.onUnload, "closure")
  unloadNamespace("warlockr")
})
