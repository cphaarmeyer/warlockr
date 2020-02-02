#' Clean Stats
#'
#' Replaces missing stats with zero.
#'
#' @inheritParams sim_boss
#'
#' @export
#'
#' @examples
#' clean_stats(list(crit = -1, hit = 1))
clean_stats <- function(stats) {
  lapply(
    stats::setNames(nm = c("int", "sp", "crit", "hit", "mp5")),
    function(x) {
      y <- stats[[x]]
      if (is.null(y)) 0 else y
    }
  )
}
