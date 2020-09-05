#' Sum Stats
#'
#' @param stats_list as list of \code{stats}
#'
#' @return \code{stats}
#' @export
#'
#' @examples
#' sum_stats(list(
#'   list(int = 1, sp = 2),
#'   list(sp = 2, crit = 1),
#'   list(crit = 3, hit = 4)
#' ))
sum_stats <- function(stats_list) {
  is_special <- vapply(stats_list, is.character, FUN.VALUE = logical(1))
  special <- stats_list[is_special]
  stats_list[is_special] <- NULL
  structure(
    do_call_stats(stats_list, function(...) mlapply(sum, ...)),
    trinkets = unlist(special)
  )
}
