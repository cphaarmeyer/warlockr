#' Clean Stats
#'
#' Replaces missing stats with zero.
#'
#' @inheritParams sim_boss
#'
clean_stats <- function(stats) {
  stopifnot(is_stats(stats))
  lapply(statnames, function(nm) null_to_0(stats[[nm]]))
}

null_to_0 <- function(x) {
  if (is.null(x)) 0 else x
}

char_set_names <- function(x) stats::setNames(nm = x)

statnames <- char_set_names(c("int", "sp", "crit", "hit", "mp5"))
