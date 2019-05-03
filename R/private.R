#check whether prob is valid
check_prob <- function(prob){
  if (prob < 0 | prob > 1 | length(prob) > 1){
    stop("invalid prob value")
  }
  else {
    return(TRUE)
  }
}

#check whether trials is valid
check_trials <- function(trials){
  if (!is.numeric(trials)){
    stop("invalid trials value")
  }
  if (length(trials) != 1){
    stop("invalid trials value")
  }
  if (trials < 0){
    stop("invalid trials value")
  }
  else {
    return(TRUE)
  }
}

#check whether success is valid
check_success <- function(success, trials){
  for (i in success) {
    if (!is.numeric(i)){
      stop("invalid success value")
    }
    if (i > trials | i < 0) {
      stop("invalid success value")
    }
  }
  return (TRUE)
}

#compute the mean for distribution
aux_mean <- function(trials, prob) {
  return (trials * prob)
}

#compute the variance for distribution
aux_variance <- function(trials, prob) {
  return (trials * prob * (1 - prob))
}

#compute the mode for distribution
aux_mode <- function(trials, prob) {
  m <- as.integer(trials * prob + prob)
  return (m)
}

#compute the skewness for distribution
aux_skewness <- function(trials, prob) {
  one <- 1 - 2 * prob
  two <- sqrt(trials * prob * (1 - prob))
  return (one / two)
}

#compute the kurtosis for distribution
aux_kurtosis <- function(trials, prob) {
  one <- 1 - 6 * prob * (1 - prob)
  two <- trials * prob * (1 - prob)
  return (one / two)
}
