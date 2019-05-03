#' @title bin_choose
#' @description calculates the number of combinations
#' @param n trials
#' @param k successes
#' @return a number or a vector of numbers
#' @export
#' @examples
#' bin_choose(5, 2)
#' 5 
bin_choose <- function(n, k) {
  for (i in k) {
    if (i > n) {
      stop("k cannot be greater than n")
    }
  }
  k_fac <- factorial(k) 
  n_k <- factorial(n - k) 
  n_fac <- factorial(n)
  return (n_fac/(k_fac* n_k))
}

#' @title bin_probability
#' @description calculates the probability
#' @param success a number or a vector
#' @param trials a number
#' @param prob a number, the probability 
#' @return a number
#' @export
#' @examples
#' bin_probability(2, 5, 0.5)
#' bin_probability(0:2, 5, 0.5)
bin_probability <- function(success, trials, prob) {
  if (check_trials(trials)) {
    if (check_prob(prob)){
      if(check_success(success, trials)){
        first <- bin_choose(trials, success)
        second <- prob ** success
        third <- (1 - prob) ** (trials - success)
        return (first *second * third)
      }
    }
  }
}
#' @title bin_distribution
#' @description calculates the probability with all possible success
#' @param trials a number
#' @param prob a number
#' @return a dataframe
#' @export
#' @examples
#' bin_distribution(1, 0.7)
#' bin_cumulative(1, 0.2)
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  result <- data.frame(success, probability)
  class(result) <- c("bindis", "data.frame")
  return (result)
}

#' @title bin_cumulative
#' @description calculates the cumluative probability
#' @param trials a number
#' @param prob a number
#' @return a dataframe
#' @export
#' @examples
#' bin_cumulative(1, 0.7)
#' bin_cumulative(1, 0.2)
bin_cumulative <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  cumulative <- probability
  for (i in seq(2, length(cumulative))) {
    cumulative[i] <- cumulative[i] + cumulative[i-1]
  }
  result <- data.frame(success, probability, cumulative)
  class(result) <- c("bincum", "data.frame")
  return(result)
}
#' @title bin_variable
#' @description put variables in a list
#' @param trials a number
#' @param prob a number
#' @return a list
#' @export
#' @examples
#' bin_variable(3, 0.2)
#' bin_variable(3, 0.2)
bin_variable <- function(trials, prob) {
  if (check_trials(trials)){
    if (check_prob(prob)) {
      result <- list(trials = trials, prob = prob)
      class(result) <- "binvar"
      return(result)
    }
  }
}
#' @title bin_mean
#' @description compute the mean for distribution
#' @param trials number of trials
#' @param prob prob the probability to success occurs in a trial
#' @return the mean value
#' @export
#' @examples
#' bin_choose(5, 0.5)
#' 2.5
bin_mean <- function(trials, prob){
  if (check_trials(trials)){
    if(check_prob(prob)){
      return (aux_mean(trials, prob))
    }
  }
}
#' @title bin_variance
#' @description compute the variance for distribution
#' @param trials number of trials
#' @param prob prob the probability to success occurs in a trial
#' @return the variance value
#' @export
#' @examples
#' bin_variance(5, 0.5)
#' 1.25
bin_variance <- function(trials, prob){
  if (check_trials(trials)){
    if(check_prob(prob)){
      return (aux_variance(trials, prob))
    }
  }
}
#' @title bin_mode
#' @description compute the mode for distribution
#' @param trials number of trials
#' @param prob the probability to success occurs in a trial
#' @return the mode value
#' @export
#' @examples
#' bin_mode(5, 0.5)
#' 3
bin_mode <- function(trials, prob){
  if (check_trials(trials)){
    if(check_prob(prob)){
      return (aux_mode(trials, prob))
    }
  }
}
#' @title bin_skewness
#' @description compute the skewness for distribution
#' @param trials number of trials
#' @param prob the probability to success occurs in a trial
#' @return the skewness value
#' @export
#' @examples
#' bin_skewness(5, 0.5)
#' 0
bin_skewness <- function(trials, prob){
  if (check_trials(trials)){
    if(check_prob(prob)){
      return (aux_skewness(trials, prob))
    }
  }
}
#' @title bin_kurtosis
#' @description compute the kurtosis for distribution
#' @param trials number of trials
#' @param prob the probability to success occurs in a trial
#' @return the kurtosis value
#' @export
#' @examples
#' bin_kurtosis(5, 0.5)
#' -0.4
bin_kurtosis <- function(trials, prob){
  if (check_trials(trials)){
    if(check_prob(prob)){
      return (aux_kurtosis(trials, prob))
    }
  }
}