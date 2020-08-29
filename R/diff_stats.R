#' Diff Stats
#'
#' @param x,y stats to take the difference `x - y`
#'
#' @export
#'
#' @examples
#' diff_stats(list(int = 5, sp = 2, crit = 1), list(int = 2, sp = 3, hit = 1))
diff_stats <- function(x, y) {
  do_call_stats(list(x, y), `-`)
}
