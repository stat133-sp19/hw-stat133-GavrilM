# checks if a probability is valid
check_prob <- function(prob) {
  if (!(typeof(prob) == 'double' || typeof(prob) == 'integer') || 
      prob<0 || prob>1 || length(prob) > 1) {
    stop("p has to be a number betwen 0 and 1")
  }
  return(TRUE)
}

#make sure trials is nonnegative integer
check_trials <- function(trials) {
  if (!(typeof(trials) == 'double' || typeof(trials) == 'integer') || 
      trials<0 || trials%%1!=0) {
    stop("invalid trials value")
  }
  return(TRUE)
}

#ensure success is a vector of non-negative integer(s) less than or equal to trials
check_success <- function(success,trials) {
  check_trials(trials)
  if (!(typeof(success) == 'double' || typeof(success) == 'integer') || 
      any(success%%1!=0)) {
    stop("invalid success value")
  }
  if (any(success > trials)) {
    stop('success cannot be greater than trials')
  }
  return(TRUE)
}