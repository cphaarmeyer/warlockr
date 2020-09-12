#' Compute Miss
#'
#' Determines from the sample whether a spell misses.
#'
#' @param s random numbers returned by \code{sample_roll}
#' @inheritParams sim_setup
#'
#' @return logical vector
compute_miss <- function(s, hit) {
  s <= 1 | s <= (17 - hit)
}
