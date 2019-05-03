library(testthat)
context("Check for summary measures")

test_that("aux_mean works with ok valid values", {
  
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(10, 0.5), 5)
  expect_equal(aux_mean(10, 0.4), 4)
})

test_that("aux_variance works with ok valid values", {
  
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(20, 0.7), 4.2)
})

test_that("aux_mode works with ok valid values", {
  
  expect_equal(aux_mode(10, 0.7), 7)
  expect_equal(aux_mode(10, 0.5), 5)
  expect_equal(aux_mode(20, 0.8), 16)
})

test_that("aux_skewness works with ok valid values", {
  
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance = 0.002)
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(aux_skewness(20, 0.4),  0.0912, tolerance = 0.002)
})

test_that("aux_kurtosis works with ok valid values", {
  
  expect_equal(aux_kurtosis(10, 0.4), -0.1833333, tolerance = 0.002)
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
  expect_equal(aux_kurtosis(20, 0.5),  -0.1, tolerance = 0.002)
})

