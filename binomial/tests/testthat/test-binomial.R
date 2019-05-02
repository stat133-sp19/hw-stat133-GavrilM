context("Main Functions")

test_that("bin_choose computes nCk", {
  expect_equal(bin_choose(5,2),10)
  expect_equal(bin_choose(5, 1:3),c(5,10,10))
  expect_error(bin_choose(1,5))
})

test_that("bin_probability computes binomial prob", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5),0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5),c(0.03125,0.15625,0.31250))
  expect_error(bin_probability(1:6,5,1))
})

test_that("bin_distribution computes a binomial distribution", {
  expect_equal(class(bin_distribution(5,.5)),c("bindis","data.frame"))
  expect_equal(class(plot(bin_distribution(5,.5))),"matrix")
  expect_equal(bin_distribution(5,.5)$probability,c(0.03125,0.15625,0.31250,0.31250,0.15625,0.03125))
  expect_error(bin_distribution(1,5))
})

test_that("bin_cumulative computes a binomial cumulative distribution", {
  expect_equal(class(bin_cumulative(5,.5)),c("bincum","data.frame"))
  expect_equal(class(plot(bin_cumulative(5,.5))),"NULL")
  expect_equal(bin_cumulative(5,.5)$cumulative,c(0.03125,0.18750,.5,0.81250,0.96875,1.0))
  expect_error(bin_cumulative(1,5))
})