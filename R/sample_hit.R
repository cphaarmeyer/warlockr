#' Sample Hit
#'
#' Vectorised function to simulate whether a spell hits or crits.
#'
#' @inheritParams sample_shadowbolt
#'
#' @export
#'
#' @examples
#' sample_hit()
#' sample_hit(5)
sample_hit <- function(n = 1) {
  stats::runif(n, min = 0, max = 100)
}
