# Replicating the paper on the equivalence between the Beta-Geometric and Pareto
# distribution of the second kind, P(II) -- https://doi.org/10.1080/00031305.2018.1543134. 
# Following the pattern of BTYD, this script will be called equi.R and all the functions 
# defined here will have names that start with equi.

#' Beta-geometric log-likelihood function
#'
#' Log-likelihood function for the BG
#'
#' The log-likelihood function is a building block for estimating the value of
#' `params` given a buying pattern `x` observed over time `t`. See the example.
#'
#' @param params A vector of the two Beta-Geometric parameters gamma and delta.
#' @param x A vector with the number of transactions at discrete times t.
#' @param t The timeline of transactions in vector x.
#' @param n The total possible number of transactions at time t.
#' @return The log likelihood of observing the combination of transactions `x`
#'   over timeline `t` given that `x` follows a Beta-Geometric distribution with
#'   parameters `params`.
#' @references Peter S. Fader, Bruce G. S. Hardie, Daniel McCarthy & Ramnath
#'   Vaidyanathan (2019) Exploring the Equivalence of Two Common Mixture Models
#'   for Duration Data, The American Statistician, 73:3, 288-295, DOI:
#'   10.1080/00031305.2018.1543134
#'   [Web](https://doi.org/10.1080/00031305.2019.1543134)
#' @examples
#' # Get the calibration data. Remember that
#' # counts of households are cumulative, so 
#' # turn them to incremental:
#' data("ace_snackfoods")
#' data <- ace_snackfoods$calibration %>% 
#'   rename(x = `Number of households`) %>% 
#'   mutate(bought = x - lag(x)) %>% 
#'   mutate(bought = if_else(is.na(bought), x, bought))
#'   
#' # Get maximum likelihood estimates:   
#' mlset <- optim(par = c(0, 3), 
#'                fn = equi.bg.LL, 
#'                x = data$bought, 
#'                t = data$Week, 
#'                n = 1499, 
#'                method="BFGS", 
#'                control=list(fnscale=-1))
#' 
#' # Log-likelihood maximum:
#' LL <- mlset$value
#' 
#' # Parameter estimates:
#' # Recall that bg.LL exponentiates par in
#' # order to enforce gamma > 0, delta > 0.
#' params <- exp(mlset$par)
#' @md
equi.bg.LL <- function(params, 
                       x, 
                       t,
                       n) {
  bought <- x
  didnotbuy <- n - sum(x)
  if(all(is.na(t))) t <- seq_along(x)
  gamma <- exp(params[1])
  delta <- exp(params[2])
  denom <- lbeta(gamma, delta)
  log.bought <- sum(bought * (lbeta(gamma + 1, delta + t - 1) - denom))
  log.didnotbuy <- didnotbuy * (lbeta(gamma, delta + max(t)) - denom)
  log.bought + log.didnotbuy
}

#' P(II) log-likelihood function
#'
#' Log-likelihood function for the Pareto distribution of the second kind,
#' P(II), also known as the Lomax distribution.
#'
#' This is a distribution of continuous-time duration data. Observed duration
#' times follow an exponential distribution with a rate lambda that is specific
#' to each individual; the individual values of the lambda parameter are drawn
#' from a gamma distribution with shape parameter r and inverse-scale parameter
#' alpha. The P(II) pdf and cdf have closed forms where t is conditioned on r
#' and alpha alone.
#'
#' In other places alpha is called a scale parameter; R documentation calls
#' it a rate parameter.
#'
#' @param params A vector of the two Gamma parameters r and alpha.
#' @inheritParams equi.bg.LL
#' @return The log likelihood of observing the combination of transactions `x`
#'   over timeline `t` given that `x` follows a P(II) distribution with
#'   parameters `params`.
#' @references Peter S. Fader, Bruce G. S. Hardie, Daniel McCarthy & Ramnath
#'   Vaidyanathan (2019) Exploring the Equivalence of Two Common Mixture Models
#'   for Duration Data, The American Statistician, 73:3, 288-295, DOI:
#'   10.1080/00031305.2018.1543134
#'   [Web](https://doi.org/10.1080/00031305.2019.1543134)
#' @examples
#' # Get the calibration data. Remember that
#' # counts of households are cumulative, so 
#' # turn them to incremental:
#' data("ace_snackfoods")
#' data <- ace_snackfoods$calibration %>% 
#'   rename(x = `Number of households`) %>% 
#'   mutate(bought = x - lag(x)) %>% 
#'   mutate(bought = if_else(is.na(bought), x, bought))
#'   
#' # Get maximum likelihood estimates:   
#' mlset <- optim(par = c(0, 3), 
#'                fn = equi.pii.LL, 
#'                x = data$bought, 
#'                t = data$Week, 
#'                n = 1499, 
#'                method="BFGS", 
#'                control=list(fnscale=-1))
#' 
#' # Log-likelihood maximum:
#' LL <- mlset$value
#' 
#' # Parameter estimates:
#' # Recall that bg.LL exponentiates par in
#' # order to enforce r > 0, alpha > 0.
#' params <- exp(mlset$par)
#' @md
equi.pii.LL <- function(params,
                        x, 
                        t, 
                        n) {
  bought <- x
  didnotbuy <- n - sum(x)
  if(all(is.na(t))) t <- seq_along(x)
  r <- exp(params[1])
  alpha <- exp(params[2])  
  cdf <- function(t, r, alpha) {
    1 - (alpha / (alpha + t)) ^ r
  }
  log.bought <- sum(bought * log(cdf(t, r, alpha) - cdf(t -1 , r, alpha)))
  log.didnotbuy <- didnotbuy * log(1 - cdf(max(t), r, alpha))
  log.bought + log.didnotbuy
}
  
