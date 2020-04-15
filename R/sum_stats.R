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
#'   list(crit = 3, hit = 4)
#' ))
sum_stats <- function(stats_list) {
  is_special <- vapply(stats_list, is.character, FUN.VALUE = logical(1))
  special <- stats_list[is_special]
  stats_list[is_special] <- NULL
  stats_list <- lapply(stats_list, clean_stats)
  structure(
    as.list(rowSums(vapply(stats_list, unlist, FUN.VALUE = double(5)))),
    trinkets = unlist(special)
  )
}
