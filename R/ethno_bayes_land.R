#' Bayesian Consensus Model for Landscape Knowledge
#'
#' Fits a Bayesian model to estimate consensus among informants
#' regarding landscape use and ecological knowledge.
#'
#' @usage ethno_bayes_land(data, iter = 2000, chains = 4)
#'
#' @param data an ethnoecology data set with columns 'informant' and 'landscape_unit'.
#' @param iter number of MCMC iterations.
#' @param chains number of MCMC chains.
#'
#' @return A Bayesian model object (Stan).
#'
#' @importFrom rstan stan
#' @importFrom dplyr select
#'
#' @examples
#' \donttest{
#'   data(ethnoecology_data)
#'   ethno_bayes_land(ethnoecology_data, iter = 1000, chains = 2)
#' }
#'
#' @export
ethno_bayes_land <- function(data, iter = 2000, chains = 4) {
  if (!requireNamespace("rstan", quietly = TRUE)) {
    stop("Package \"rstan\" needed. Please install it.", call. = FALSE)
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Package \"dplyr\" needed for this function. Please install it.", call. = FALSE)
  }

  use_matrix <- as.matrix(dplyr::select(data, -informant, -landscape_unit))
  N <- nrow(use_matrix)
  K <- ncol(use_matrix)

  stan_data <- list(
    N = N,
    K = K,
    y = use_matrix
  )

  stan_code <- "
    data {
      int<lower=0> N;
      int<lower=0> K;
      array[N, K] int<lower=0, upper=1> y;
    }
    parameters {
      array[K] real<lower=0, upper=1> theta;
    }
    model {
      theta ~ beta(1, 1);
      for (n in 1:N) {
        y[n] ~ bernoulli(theta);
      }
    }
  "

  fit <- rstan::stan(model_code = stan_code, data = stan_data,
                     iter = iter, chains = chains)

  return(fit)
}
