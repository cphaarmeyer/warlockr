#' Compute Miss
#'
#' Determines from the sample whether a spell misses.
#'
#' @param s random numbers returned by \code{sample_hit}
#' @inheritParams sim_setup
#'
#' @return logical vector
#' @export
#'
#' @examples
#' compute_miss(sample_hit(10), 2)
compute_miss <- function(s, hit) {
  s <= 1 | s <= (17 - hit)
}
