# Save this file as `R/BayeComp_Stan.R`

#' Bayesian Comparability with Stan
#'
#' @export
#' @param datalist a list of input values.
#' @param iter the number of iteration.
#' @param algorithm algorithm for sampling.
#' @param chains the number of chains.
#' @param seed seed value for sampling.
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'

BayeComp_Stan <- function(datalist, iter, chains, ...) {

  out <- rstan::sampling(stanmodels$comp,
                         data = datalist,
                         algorithm = "NUTS",
                         iter = iter,
                         chains = chains,
                         seed = 9182567,...)
  return(out)
}
