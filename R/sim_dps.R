#' Simulate DPS
#'
#' Repeatedly simulates bosses to calculate dps.
#' The timeframe sets a minimum an maximum time for a boss fight.
#' Each boss simulation has a random length in between.
#'
#' @inherit sim_boss
#' @param timeframe vector of minimal and maximal duration of a fight in seconds
#' @param iter number of iterations
#'
#' @return a matrix where every row is a vector returned by \code{sim_boss}
#' @export
#'
#' @examples
#' mat <- sim_dps(list(int = 277, sp = 346, crit = 2, hit = 2), iter = 1000)
#' mean(mat[, 4])
sim_dps <- function(stats,
                    trinkets = NULL,
                    timeframe = c(60, 300),
                    iter = 50000,
                    seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  times <- sample_time(timeframe, iter)
  trinkets <- c(trinkets, attr(stats, "trinkets"))
  stats <- clean_stats(stats)
  args <- sim_setup(
    times, stats$crit, stats$hit, stats$int, stats$sp,
    iter = iter, trinkets = trinkets
  )
  sim_boss_arg <- function(i) {
    do.call(sim_boss_impl, c(slice_args(args, i),
      mp5 = stats$mp5, sp = stats$sp, time = times[i]
    ))
  }
  t(vapply(seq_len(iter), sim_boss_arg, FUN.VALUE = double(4)))
}

slice_arg <- function(x, i) {
  if (is.matrix(x)) x[, i] else if (is.list(x)) x[[i]] else x
}

slice_args <- function(x, i) lapply(x, slice_arg, i = i)
