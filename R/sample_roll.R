#' Sample Roll
#'
#' Vectorised function to simulate whether a spell hits or crits.
#'
#' @inheritParams sample_shadowbolt
#'
#' @export
#'
#' @examples
#' sample_roll()
#' sample_roll(5)
sample_roll <- function(n = 1) {
  stats::runif(n, min = 0, max = 100)
}
