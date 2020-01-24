#' Simulate Boss Fight
#'
#' Simulates one boss fight with default values. Based on:
#' https://www.reddit.com/r/classicwow/comments/dh5r6g/so_i_made_a_warlock_shadowbolt_simulator/
#'
#' @inheritParams shadowbolt
#' @param mana starting mana (by default computed from int)
#' @param time length of fight in seconds
#'
#' @return a numeric vector with values for total dmg, mana, total casttime and dps
#' @export
#'
#' @examples
#' sim_boss(2, 1, 277, 346)
sim_boss <- function(crit, hit, int, sp, mana = NULL, time = 150) {
  if (is.null(mana)) mana <- compute_mana(int)
  stats_total <- c(0, mana, 0, 0)
  sim_row <- c(0, 0, 0, 0)
  n_max <- time %/% 2.5 + 1
  sb_dmg <- (sample_shadowbolt(n_max) + 0.8571 * sp) * 1.265
  sample_h <- sample_hit(n_max)
  sb_miss <- (sample_h <= 1 | sample_h <= (17 - hit))
  sb_crit <- sample_h >= (100 - compute_critchance(crit, int))
  sb_manacost <- compute_manacost()

  i <- 0
  while (stats_total[3] < time) {
    if (stats_total[2] < sb_manacost) {
      sim_row <- lifetap(346, improved_sb_proc = sim_row[4])
    } else {
      i <- i + 1
      sim_row <- shadowbolt_impl(sb_dmg[i], sb_miss[i], sb_crit[i], -sb_manacost, 2.5, 1, 5, sim_row[4])
    }
    stats_total <- stats_total + sim_row
  }

  stats_total[4] <- stats_total[1] / stats_total[3]
  return(as.numeric(stats_total))
}
