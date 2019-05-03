library(ggplot2)

#' @export
print.binvar <- function(result) {
  cat('"Binomial variable"\n\n')
  cat('Paramaters\n')
  cat('- number of trials:', result[[1]], '\n')
  cat('- prob of success:', result[[2]])
}

#' @export
summary.binvar <- function(result){
  mean <- aux_mean(result[[1]], result[[2]])
  var <- aux_variance(result[[1]], result[[2]])
  mode <- aux_mode(result[[1]], result[[2]])
  ske <- aux_skewness(result[[1]], result[[2]])
  kur <- aux_kurtosis(result[[1]], result[[2]])
  sum <- list(trials = result[[1]], prob = result[[2]], mean = mean, variance = var, mode = mode, skewness = ske, kurtosis = kur)
  class(sum) <- "summary.binvar"
  return(sum)
}

#' @export
print.summary.binvar <- function(result) {
  cat('"Summary Binomial"\n\n')
  cat('Paramaters\n')
  cat('- number of trials:', result[[1]], '\n')
  cat('- prob of success:', result[[2]], '\n\n')
  cat('Measures\n')
  cat('- mean    :', result[[3]], '\n')
  cat('- variance:', result[[4]], '\n')
  cat('- mode    :', result[[5]], '\n')
  cat('- skewness:', result[[6]], '\n')
  cat('- kurtosis:', result[[7]], '\n')
}

#' @export
plot.bindis <- function(data) {
  ggplot(data, aes(x = data$success, y = data$probability)) +
    geom_bar(stat="identity") + labs(x = "success", y = "probablility") + ggtitle("binomial probability distribution")
}

#' @export
plot.bincum <- function(data) {
  ggplot(data, aes(x = data$success, y = data$cumulative)) +
    geom_line(stat="identity") + labs(x = "success", y = "probablility") + geom_point(shape=1) +  ggtitle("binomial cumulative distribution")
}

