library(testthat)
context("Check for checkers")

test_that("check_prob works with ok prob", {
  
  expect_true(check_prob(0.3))
  expect_true(check_prob(0.5))
  expect_true(check_prob(0.2))
})

test_that("check_prob fails with invalid value", {
  
  expect_error(check_prob(-1))
  expect_error(check_prob(5))
  expect_error(check_prob(-2))
})

test_that("check_prob fails with invalid length", {
  
  expect_error(check_prob(c(1, 3)))
  expect_error(check_prob(c(2, 5)))
  expect_error(check_prob(c(1, 5, 3)))
})

test_that("check_prob fails with invalid type", {
    
  expect_error(check_prob("one"))
  expect_error(check_prob("prob"))
  expect_error(check_prob("two"))
})

test_that("check_trials with invalid value", {
  
  expect_error(check_trials(-1))
  expect_error(check_trials(-2))
  expect_error(check_trials(-4))
})

test_that("check_trials with invalid length", {
  
  expect_error(check_trials(c(1, 2)))
  expect_error(check_trials(c(2, 3)))
  expect_error(check_trials(c(2, 3, 3)))
})

test_that("check_trials with invalid type", {
  
  expect_error(check_trials("one"))
  expect_error(check_trials("trials"))
  expect_error(check_trials("two"))
})

test_that("check_success with invalid value", {
  
  expect_error(check_success(5, 4))
  expect_error(check_success(4, 3))
  expect_error(check_success(9, 3))
})

test_that("check_success with invalid input", {
  
  expect_error(check_success(-2, 4))
  expect_error(check_success(-1, 3))
  expect_error(check_success(-9, 4))
})

test_that("check_success with invalid type", {
  
  expect_error(check_success("one", 4))
  expect_error(check_success("success", 3))
  expect_error(check_success("two", 3))
})

