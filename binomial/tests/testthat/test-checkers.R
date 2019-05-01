context("Checkers")

test_that("check_prob validates probabilities", {
  expect_true(check_prob(.5))
  expect_error(check_prob(-1), "p has to be a number betwen 0 and 1")
  expect_error(check_prob('c'), "p has to be a number betwen 0 and 1")
})

test_that("check_trials validates trials", {
  expect_true(check_trials(5))
  expect_error(check_trials(-1), "invalid trials value")
  expect_error(check_trials(1.5), "invalid trials value")
  expect_error(check_trials('c'), "invalid trials value")
})

test_that("check_success validates success and trials", {
  expect_true(check_success(5,20))
  expect_true(check_success(c(2,20,5),20))
  expect_true(check_success(0:2,20))
  expect_error(check_success(.5,20), "invalid success value")
  expect_error(check_success(c(7,25,3),20), "success cannot be greater than trials")
  expect_error(check_success('c',20), "invalid success value")
})