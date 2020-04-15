#' Compare the DPS of different Stats
#'
#' @inheritParams sum_stats
#' @inheritParams sim_dps
#'
#' @return a data frame
#' @export
#'
#' @examples
#' compare_dps(list(
#'   stats1 = list(int = 277, sp = 346, crit = 2, hit = 2),
#'   stats2 = list(int = 277, sp = 346, mp5 = 100)
#' ),
#' iter = 1000
#' )
compare_dps <- function(stats_list, timeframe = c(60, 300), iter = 50000) {
  seed <- sample(1:1000, 1)
  simulations <- lapply(stats_list, sim_dps,
    timeframe = timeframe, iter = iter, seed = seed
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]),
    FUN.VALUE = double(1)
  )
  data.frame(dps = dps)
}
