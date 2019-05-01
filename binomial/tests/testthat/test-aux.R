context("Auxillary Functions")

test_that("aux_mean computes mean", {
  expect_equal(aux_mean(10,.3),3)
  expect_equal(aux_mean(0,.3),0)
  expect_equal(aux_mean(5,1),5)
})

test_that("aux_variance computes variance", {
  expect_equal(aux_variance(10,.3),2.1)
  expect_equal(aux_variance(0,.3),0)
  expect_equal(aux_variance(5,1),0)
})

test_that("aux_mode computes mode", {
  expect_equal(aux_mode(10,.3),3)
  expect_equal(aux_mode(0,.7),0)
  expect_equal(aux_mode(5,1),c(5,6))
})

test_that("aux_skewness computes skewness", {
  expect_equal(aux_skewness(10,.3),(1-2*.3)/sqrt(10*.3*.7))
  expect_equal(aux_skewness(4,.5),0)
  expect_equal(aux_skewness(16,.25),.5/sqrt(3))
})

test_that("aux_kurtosis computes kurtosis", {
  expect_equal(aux_kurtosis(10,.3),(1-6*.3*.7)/(10*.3*.7))
  expect_equal(aux_kurtosis(4,.5),-.5)
  expect_equal(aux_kurtosis(16,.25),(1-9/8)/3)
})
