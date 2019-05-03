library(testthat)
context("Check for binomial")

test_that("bin_choose works with ok values", {
  
  expect_equal(bin_choose(10, 2), 45)
  expect_equal(bin_choose(10, c(2,3)), c(45, 120))
  expect_error(bin_choose(2, 5))
})

test_that("bin_probability works with ok values", {
  
  expect_equal(bin_probability(3, 10, 0.5), 0.1171875, tolerance = 0.002)
  expect_equal(bin_probability(5, 10, 0.3), 0.1029193, tolerance = .002)
  expect_equal(bin_probability(c(3, 7), 10, 0.6), c(0.04246733, 0.21499085), tolerance = .002)
})

test_that("bin_distribution works with ok values", {
  
  expect_equal(as.data.frame(bin_distribution(1, 0.7)), data.frame(success=as.integer(c(0, 1)), probability=c(0.3, 0.7)))
  expect_equal(as.data.frame(bin_distribution(1, 0.2)), data.frame(success=c(0, 1), probability=c(0.8, 0.2)))
  expect_equal(as.data.frame(bin_distribution(1, 0.3)), data.frame(success=c(0, 1), probability=c(0.7, 0.3)))
})

test_that("bin_cumulative works with ok values", {
  
  expect_equal(as.data.frame(bin_cumulative(1, 0.7)), data.frame(success=c(0, 1), probability=c(0.3, 0.7), cumulative=c(0.3, 1.0)))
  expect_equal(as.data.frame(bin_cumulative(1, 0.2)), data.frame(success=c(0, 1), probability=c(0.8, 0.2), cumulative=c(0.8, 1.0)))
  expect_equal(as.data.frame(bin_cumulative(1, 0.3)), data.frame(success=c(0, 1), probability=c(0.7, 0.3), cumulative=c(0.7, 1.0)))
})

