#' Is Stats
#'
#' Checks if an object can be interpreted as stats.
#'
#' @inheritParams clean_stats
#'
#' @export
is_stats <- function(stats) {
  all_numeric <- do.call(what = all, args = lapply(stats, is.numeric))
  is_unique(names(stats)) & all(names(stats) %in% statnames) & all_numeric
}
