#' Simultate DPS
#'
#' Repeatedly simulates bosses to calculate dps.
#' The timeframe sets a minimum an maximum time for a boss fight.
#' Each boss simulation has a random length in between.
#'
#' @inherit sim_boss
#' @param timeframe vector of minimal and maximal duration of a fight in seconds
#' @param iter number of iterations
#' @param seed optional seed
#'
#' @return a matrix where every row is a vector returned by \code{sim_boss}
#' @export
#'
#' @examples
#' mat <- sim_dps(list(int = 277, sp = 346, crit = 2, hit = 2), iter = 1000)
#' mean(mat[, 4])
sim_dps <- function(stats, timeframe = c(60, 300), iter = 50000, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  time <- stats::runif(iter, timeframe[1], timeframe[2])
  stats <- clean_stats(stats)
  arguments <- sim_setup(
    max(time), stats$crit, stats$hit, stats$int, stats$sp,
    iter = iter
  )
  get_arg <- function(i) {
    lapply(arguments, function(x) {
      if (is.matrix(x)) x[, i] else x
    })
  }
  t(vapply(seq_len(iter), function(i) {
    do.call(sim_boss_impl, c(get_arg(i), mp5 = stats$mp5, time = time[i]))
  },
  FUN.VALUE = double(4)
  ))
}
