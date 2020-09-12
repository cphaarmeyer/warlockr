#' Sum Stats
#'
#' @param stats_list as list of \code{stats}
#'
#' @return \code{stats}
sum_stats <- function(stats_list) {
  is_special <- vapply(stats_list, is.character, FUN.VALUE = logical(1))
  special <- stats_list[is_special]
  stats_list[is_special] <- NULL
  structure(
    do_call_stats(stats_list, function(...) Map(sum, ...)),
    trinkets = unlist(special)
  )
}
