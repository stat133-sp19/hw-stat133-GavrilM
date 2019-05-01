# computes binomial mean
aux_mean <- function(trials, prob) {
  return(trials*prob)
}

# computes binomial variance 
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}

# computes binomial mode
aux_mode <- function(trials, prob){
  m=trials*prob + prob
  if (m%%1==0) {
    return(c(m-1,m))
  }
  return(floor(m))
}

#computes binomial skewness
aux_skewness <- function(trials, prob) {
  return((1-2*prob)/sqrt(aux_variance(trials,prob)))
}

#computes binomial kurtosis
aux_kurtosis <- function(trials, prob) {
  return((1-6*prob*(1-prob))/aux_variance(trials,prob))
}