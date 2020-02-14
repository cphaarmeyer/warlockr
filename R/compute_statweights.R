#' Compute Stat Weights
#'
#' Simulates current dps and dps with inceased stats to compute weights for these stats.
#' The result is scaled such that spell power has weight 1.
#'
#' @inheritParams sim_dps
#'
#' @return a named vector with weights
#' @export
#'
#' @examples
#' compute_statweights(list(int = 277, sp = 346, crit = 2, hit = 2), iter = 1000)
compute_statweights <- function(stats, timeframe = c(45, 150), iter = 50000) {
  stats <- clean_stats(stats)
  seed <- sample(1:1000, 1)
  simulations <- c(
    list(current = sim_dps(stats, timeframe, iter, seed)),
    lapply(
      stats::setNames(nm = names(stats)),
      function(x) {
        stats[[x]] <- stats[[x]] + 1
        sim_dps(stats, timeframe, iter, seed)
      }
    )
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]), FUN.VALUE = 0)
  weights <- (dps - dps[[1]])[-1]
  weights / weights[["sp"]]
}
