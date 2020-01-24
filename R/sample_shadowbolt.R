#' Sample Shadow Bolt
#'
#' Use the sample function so simulate the base damage of a shadow bolt.
#' Intended for vectorisation if the simulation.
#'
#' @param n number of samples
#'
#' @export
#'
#' @examples
#' sample_shadowbolt()
#' sample_shadowbolt(5)
sample_shadowbolt <- function(n = 1) {
  sample(455:507, n)
}
