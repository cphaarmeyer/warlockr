#' Sample Hit
#'
#' Vectorised function to simulate wheather a spell hits or crits.
#'
#' @inheritParams sample_shadowbolt
#'
#' @export
#'
#' @examples
#' sample_hit()
#' sample_hit(5)
sample_hit <- function(n = 1) {
  sample(10000, n) / 100
}
