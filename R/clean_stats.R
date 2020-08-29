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
  statnames <- stats::setNames(nm = c("int", "sp", "crit", "hit", "mp5"))
  stopifnot(names(stats) %in% statnames)
  lapply(statnames, function(nm) null_to_0(stats[[nm]]))
}

null_to_0 <- function(x) {
  if (is.null(x)) 0 else x
}
