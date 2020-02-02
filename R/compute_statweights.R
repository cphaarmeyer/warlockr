#' Compute Stat Weights
#'
#' Simulates current dps and dps with inceased stats to compute weights for these stats.
#'
#' @inheritParams sim_dps
#'
#' @return a named vector with weights
#' @export
#'
#' @examples
#' compute_statweights(2, 1, 277, 346, 0, iter = 1000)
compute_statweights <- function(crit, hit, int, sp, mp5, timeframe = c(45, 150), iter = 50000) {
  seed <- sample(1:1000, 1)
  simulations <- list(
    current = sim_dps(crit, hit, int, sp, mp5, timeframe, iter, seed),
    crit = sim_dps(crit + 1, hit, int, sp, mp5, timeframe, iter, seed),
    hit = sim_dps(crit, hit + 1, int, sp, mp5, timeframe, iter, seed),
    int = sim_dps(crit, hit, int + 1, sp, mp5, timeframe, iter, seed),
    sp = sim_dps(crit, hit, int, sp + 1, mp5, timeframe, iter, seed),
    mp5 = sim_dps(crit, hit, int, sp, mp5 + 1, timeframe, iter, seed)
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]), FUN.VALUE = 0)
  (dps - dps[1])[-1]
}
