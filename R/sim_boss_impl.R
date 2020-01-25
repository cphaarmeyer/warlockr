#' Base Implementation Simulate Boss Fight
#'
#' @inheritParams sim_boss
#' @param sb_dmg vector of shadow bolt damage ignoring possible miss or crit
#' @param sb_miss vector of whether shadow bolt hits
#' @param sb_crit vector of whether shadow bolt crits
#' @param sb_manacost mana cost of shadow bolt
#' @param lt_mancost mana cost of life tap
#'
#' @export
sim_boss_impl <- function(mana, mp5, sb_dmg, sb_miss, sb_crit, sb_manacost, lt_mancost, time) {
  stats_total <- c(0, mana, 0, 0)
  sim_row <- c(0, 0, 0, 0)
  i <- 0
  j <- 1
  t_mp5 <- seq(2.5, time + 5, by = 5)
  while (stats_total[3] < time) {
    if (stats_total[3] > t_mp5[j]) {
      j <- j + 1
      stats_total[2] <- stats_total[2] + mp5
    }
    if (stats_total[2] < sb_manacost) {
      sim_row <- lifetap_impl(lt_mancost, sim_row[4])
    } else {
      i <- i + 1
      sim_row <- shadowbolt_impl(sb_dmg[i], sb_miss[i], sb_crit[i], -sb_manacost, 2.5, 5, sim_row[4])
    }
    stats_total <- stats_total + sim_row
  }
  stats_total[4] <- stats_total[1] / stats_total[3]
  stats_total
}
