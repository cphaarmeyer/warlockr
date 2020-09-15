#' Sample Shadow Bolt
#'
#' Use the sample function so simulate the base damage of a shadow bolt.
#' Intended for vectorisation if the simulation.
#'
#' @param n number of samples
#'
sample_shadowbolt <- function(n = 1) {
  sample(482:538, n, replace = TRUE)
}
