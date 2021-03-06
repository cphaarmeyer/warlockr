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
compare_dps <- function(stats_list,
                        timeframe = c(60, 300),
                        iter = 50000,
                        seed = NULL) {
  if (is.null(seed)) seed <- sample_seed()
  simulations <- lapply(stats_list, sim_dps,
    timeframe = timeframe, iter = iter, seed = seed
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]), FUN.VALUE = double(1))
  add_diff_col(data.frame(dps = dps))
}

add_diff_col <- function(df) {
  if ("current" %in% row.names(df)) {
    current_dps <- df[["current", "dps"]]
    df[["diff"]] <- df[["dps"]] - current_dps
  }
  df
}

sample_seed <- function() sample(1:1000, 1)
