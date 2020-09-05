#' Compute Stat Weights
#'
#' Simulates current dps and dps with increased stats to compute weights for
#' these stats.
#' The result is scaled such that spell power has weight 1.
#'
#' @inheritParams sim_dps
#'
#' @return a data frame with weights
#' @export
#'
#' @examples
#' compute_statweights(
#'   list(int = 277, sp = 346, crit = 2, hit = 2),
#'   iter = 1000
#' )
compute_statweights <- function(stats,
                                timeframe = c(60, 300),
                                iter = 50000,
                                seed = NULL,
                                trinkets = NULL) {
  iter_total <- iter * length(statnames)
  if (!is.null(seed)) set.seed(seed)
  df <- sample_sim_df(stats, iter_total, timeframe)
  df[["dps"]] <- vapply(
    X = seq_len(nrow(df)),
    FUN = function(i) sim_boss_df(df[i, ], trinkets)[4],
    FUN.VALUE = double(1)
  )
  mod <- stats::lm(dps ~ ., data = df)
  coefs <- stats::coef(mod)[statnames]
  weights <- coefs / coefs[["sp"]]
  data.frame(weight = weights, dps = coefs)
}

statbudget <- list(
  int = 1,
  sp = 6 / 7,
  crit = 14,
  hit = 8,
  mp5 = 2.5
)

mlapply <- function(...) mapply(..., SIMPLIFY = FALSE)

expand_stats <- function(stats) {
  max_change <- do_call_stats(
    list(statbudget), function(x) floor(2 * max(x) / x)
  )
  mlapply(function(x, d) max(0, x - d):(x + d), clean_stats(stats), max_change)
}

sample_stats <- function(stats, n) {
  lapply(expand_stats(stats), sample, size = n, replace = TRUE)
}

sample_time <- function(timeframe, n) {
  stats::runif(n, timeframe[1], timeframe[2])
}

sample_sim_df <- function(stats, n, timeframe) {
  data.frame(sample_stats(stats, n), time = sample_time(timeframe, n))
}

sim_boss_df <- function(df, trinkets) {
  sim_boss(as.list(df[, statnames]),
    time = df[["time"]], trinkets = trinkets
  )
}
