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
  stats_list <- lapply(stats_list, clean_stats)
  as.list(rowSums(vapply(stats_list, unlist, FUN.VALUE = double(5))))
}
