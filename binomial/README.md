
## Overview

`"binomial"` is an [R](http://www.r-project.org/) package that provides
functions for computing binomial distribution measures and probabilites.

  - `bin_choose()` computes the number of combinations of choosing k
    objects from n total.
  - `bin_probability()` computes the probability of k successes in n
    trials given the probability of success.
  - `bin_distribution()` computes the probability distribution of n
    trials given the probability of success. Returns a `"bindis"` object
    which is a `data.frame`.
  - `bin_distribution()` computes the cumulative distribution of n
    trials given the probability of success. Returns a `"bincum"` object
    which is a `data.frame`.
  - `plot()` method for a `"bindis"` or `"bincum"` object to plot the
    distribution.
  - `bin_variable()` creates a binomial variable object (of class
    `"binvar"`)
  - `summary()` method for a `"binvar"` object.

Given number of trials and probability of success:

  - `bin_mean()` computes the mean.
  - `bin_variance()` computes the variance.
  - `bin_mode()` computes the mode.
  - `bin_skewness()` computes the skewness.
  - `bin_kurtosis()` computes the kurtosis.

## Motivation

This package has been developed to illustrate some of the concepts
behind the creation of an R package.

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-GavrilM/binomial")
# install "binomial" (with vignettes)
devtools::install_github("/stat133-sp19/hw-stat133-GavrilM/binomial", build_vignettes = TRUE)
```

## Usage

``` r
library(binomial)
# n choose k
bin_choose(n = 5, k = 2)
# probabilities of getting 2 or less successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
# binomial probability distribution
bindis <- bin_distribution(trials = 5, prob = 0.5)
bindis
#plot distribution
plot(bindis)
# binomial cumulative distribution
bincum <- bin_cumulative(trials = 5, prob = 0.5)
bincum
# plotting 
plot(dis2)
#create binomial random variable
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
# summary
summary(bin1)
#Functions of Measures
#mean
bin_mean(10, 0.3)
#variance
bin_variance(10, 0.3)
#mode
bin_mode(10, 0.3)
#skewness
bin_skewness(10, 0.3)
#kurtosis
bin_kurtosis(10, 0.3)
```
