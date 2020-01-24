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
  sample_sb <- sample_shadowbolt(n_max)
  sample_h <- sample_hit(n_max)
  m_test <- (sample_h <= 1 | sample_h <= (17 - hit))
  c_test <- sample_h >= (100 - compute_critchance(crit, int))
  manacost <- compute_manacost()

  i <- 0
  while (stats_total[3] < time) {
    if (stats_total[2] < manacost) {
      sim_row <- lifetap(346, improved_sb_proc = sim_row[4])
    } else {
      i <- i + 1
      sim_row <- shadowbolt(crit, hit, int, sp,
        improved_sb_proc = sim_row[4],
        sample_shadowbolt = sample_sb[i],
        miss_test = m_test[i],
        crit_test = c_test[i]
      )
    }
    stats_total <- stats_total + sim_row
  }

  stats_total[4] <- stats_total[1] / stats_total[3]
  return(as.numeric(stats_total))
}
