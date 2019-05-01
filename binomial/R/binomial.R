#' @title bin_choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations of k successes in n trials
#' @export
#' @examples
#' 
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' 
#' # Using a list for k
#' bin_choose(5, 1:3)
#' 
bin_choose <- function(n,k) {
  if(any(k > n)) {
    stop("k cannot be greater than n")
  }
  return(factorial(n)/(factorial(k)*factorial(n-k)))
}

#' @title bin_probability
#' @description calculates probability of success according to binomial distribution
#' @param success number of successes
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return probablility of success successes
#' @export
#' @examples
#' 
#' # probability of getting 2 successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 
#' # probabilities of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_success(success, trials)
  
  return(bin_choose(trials,success)*prob^success*(1-prob)^(trials-success))
}

#' @title bin_distribution
#' @description generates a dataframe of number of successes to probability, up to trials
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return data.frame with two classes: c("bindis","data.frame")
#' @export
#' @examples
#' 
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)
#' 
bin_distribution <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  v = seq(0,trials,1)
  df = data.frame(success=v, probability=bin_probability(v,trials,prob))
  class(df) <- c("bindis","data.frame")
  return(df)
}

#' @export
plot.bindis <- function(df) {
  barplot(df$probability, names.arg = df$success, xlab = "success", ylab="probablility")
}

#' @title bin_cumulative
#' @description generates a dataframe of number of successes to probability and cumulative probability, up to trials
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return data.frame with two classes: c("bincum","data.frame")
#' @export
#' @examples
#' 
#' # binomial cumulative distribution
#' bin_cumulative(trials = 5, prob = 0.5)
#' 
bin_cumulative <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  v = seq(0,trials,1)
  p = bin_probability(v,trials,prob)
  c = cumsum(p)
  df = data.frame(success=v, probability=p,cumulative=c)
  class(df) <- c("bincum","data.frame")
  return(df)
}

#' @export
plot.bincum <- function(df, ...) {
  lines(x=df$success,y=df$cumulative)
}

#' @title bin_variable
#' @description generates an object of class binvar, a list with named elements trials and prob
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return object of class binvar
#' @export
#' @examples
#' 
#' # binvar object
#' bin_variable(trials = 5, prob = 0.5)
#' 
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  binvar = c("trials"=trials, "prob"=prob)
  class(binvar) <- "binvar"
  return(binvar)
}

#' @export
print.binvar <- function(binvar) {
  sprintf("\"Binomial variable\"\n\nParameters\n- number of trials: %d\n- prob of success : %f",
          binvar$trials, binvar$prob)
}

#' @export
summary.binvar <- function(binvar) {
  sb = c(binvar,
         "mean"=aux_mean(binvar$trials, binvar$prob),
         "variance": aux_variance(binvar$trials, binvar$prob),
         "mode"=aux_mode(binvar$trials, binvar$prob),
         "skewness"=aux_skewness(binvar$trials, binvar$prob),
         "kurtosis"=aux_kurtosis(binvar$trials, binvar$prob))
  class(sb) = "summary.binvar"
  return(sb)
}

#' @export
print.summary.binvar <- function(sb) {
  sprintf(paste("\"Summary Binomial\"\n\nParameters",
          "\n- number of trials: %d",
          "\n- prob of success : %f",
          "\n\nMeasures",
          "\n- mean : %f",
          "\n- variance: %f",
          "\n- mode : %f",
          "\n- skewness: %f",
          "\n- kurtosis: %f"),
          sb$trials, sb$prob, sb$mean, sb$variance, 
          sb$mode, sb$skewness, sb$kurtosis)
}

#' @title bin_mean
#' @description computes binomial mean
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return mean of binomial
#' @export
#' @examples
#' 
#' # mean
#' bin_mean(10, 0.3)
#' 
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  return(aux_mean(trials,prob))
}

#' @title bin_variance
#' @description computes binomial variance
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return variance of binomial
#' @export
#' @examples
#' 
#' # variance
#' bin_variance(10, 0.3)
#'
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  return(aux_variance(trials,prob))
}

#' @title bin_mode
#' @description computes binomial mode
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return mode of binomial
#' @export
#' @examples
#' 
#' # mode
#' bin_mode(10, 0.3)
#'
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  return(aux_mode(trials,prob))
}

#' @title bin_skewness
#' @description computes binomial skewness
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return skewness of binomial
#' @export
#' @examples
#' 
#' # skewness
#' bin_skewness(10, 0.3)
#'
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  return(aux_skewness(trials,prob))
}

#' @title bin_kurtosis
#' @description computes binomial kurtosis
#' @param trials number of trials
#' @param prob parameter p to the binomial distribution
#' @return kurtosis of binomial
#' @export
#' @examples
#' 
#' # kurtosis
#' bin_kurtosis(10, 0.3)
#'
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  
  return(aux_kurtosis(trials,prob))
}