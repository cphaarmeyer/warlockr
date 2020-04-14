statbudget <- list(
  int = 1,
  sp = 6 / 7,
  crit = 14,
  hit = 8,
  mp5 = 2.5
)

#' Compute Stat Weights
#'
#' Simulates current dps and dps with inceased stats to compute weights for
#' these stats.
#' The result is scaled such that spell power has weight 1.
#'
#' @inheritParams sim_dps
#'
#' @return a named vector with weights
#' @export
#'
#' @examples
#' compute_statweights(
#'   list(int = 277, sp = 346, crit = 2, hit = 2),
#'   iter = 1000
#' )
compute_statweights <- function(stats, timeframe = c(60, 300), iter = 50000) {
  stats <- clean_stats(stats)
  statnames <- stats::setNames(nm = names(stats))
  iter_total <- iter * length(statnames)
  max_change <- as.list(floor(2 * max(unlist(statbudget)) / unlist(statbudget)))
  ranges <- lapply(statnames, function(x) {
    max(0, stats[[x]] - max_change[[x]]):(stats[[x]] + max_change[[x]])
  })
  stats_list <- lapply(ranges, sample, size = iter_total, replace = TRUE)
  time <- stats::runif(iter_total, timeframe[1], timeframe[2])
  sims <- vapply(1:iter_total, function(i) {
    sim_boss(lapply(stats_list, `[`, i), time[i])[4]
  }, FUN.VALUE = double(1))
  df <- data.frame(stats_list, dps = sims, time = time)
  mod <- stats::lm(dps ~ ., data = df)
  weights <- stats::coef(mod)[statnames]
  weights / weights[["sp"]]
}
