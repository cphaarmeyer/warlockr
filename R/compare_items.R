#' Compare Two Items
#'
#' Simulates dps with current stats and with new stats to compare them.
#'
#' @inheritParams sim_dps
#' @param d_crit difference in crit
#' @param d_hit difference in hit
#' @param d_int difference in intelligence
#' @param d_sp difference in spellpower
#' @param d_mp5 difference in mp5
#'
#' @return a vector with current dps, new dps and difference
#' @export
#'
#' @examples
#' compare_items(2, 1, 277, 346, 0, -1, 1, 5, 3, 0, iter = 1000)
compare_items <- function(crit, hit, int, sp, mp5, d_crit = 0, d_hit = 0, d_int = 0, d_sp = 0, d_mp5 = 0, timeframe = c(45, 150), iter = 50000) {
  seed <- sample(1:1000, 1)
  simulations <- list(
    current = sim_dps(crit, hit, int, sp, mp5, NULL, timeframe, iter, seed),
    new = sim_dps(crit + d_crit, hit + d_hit, int + d_int, sp + d_sp, mp5 + d_mp5, NULL, timeframe, iter, seed)
  )
  dps <- vapply(simulations, function(x) mean(x[, 4]), FUN.VALUE = 0)
  c(dps, c(diff = dps[[2]] - dps[[1]]))
}
