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
#' compute_statweights(2, 1, 277, 346, iter = 1000)
compute_statweights <- function(crit, hit, int, sp, timeframe = c(45, 150), iter = 50000) {
  simulations <- list(
    current = sim_dps(crit, hit, int, sp, NULL, timeframe, iter),
    crit = sim_dps(crit + 1, hit, int, sp, NULL, timeframe, iter),
    hit = sim_dps(crit, hit + 1, int, sp, NULL, timeframe, iter),
    int = sim_dps(crit, hit, int + 1, sp, NULL, timeframe, iter),
    sp = sim_dps(crit, hit, int, sp + 1, NULL, timeframe, iter)
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]), FUN.VALUE = 0)
  (dps - dps[1])[-1]
}
