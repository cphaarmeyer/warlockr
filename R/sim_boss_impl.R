#' Base Implementation Simulate Boss Fight
#'
#' @inheritParams sim_boss
#' @inheritParams shadowbolt
#' @param mana starting mana
#' @param mp5 mp5 on gear
#' @param sb_dmg vector of base shadow bolt damage
#' @param sb_miss vector of whether shadow bolt hits
#' @param sb_crit vector of whether shadow bolt crits
#' @param curse_miss vector of whether curse hits
#' @param sb_manacost mana cost of shadow bolt
#' @param lt_manacost mana cost of life tap
#' @param sp_bonus list ofsp bonus vectors applied to shadow bolts
#'
#' @export
sim_boss_impl <- function(mana, mp5, sp, sb_dmg, sb_miss, sb_crit, curse_miss,
                          sb_manacost, lt_manacost, time, sp_bonus = NULL) {
  n_curse <- min(which(!curse_miss))
  stats_total <- c(0, mana - n_curse * 200, 1.5 * n_curse, 0)
  sim_data <- stats_total
  sim_row <- double(4)
  i <- 0
  j <- 1
  t_mp5 <- seq(0, time + 5, by = 5)
  while (stats_total[3] < time) {
    if (stats_total[3] >= t_mp5[j]) {
      j <- j + 1
      stats_total[2] <- stats_total[2] + mp5
    }
    if (stats_total[2] < -sb_manacost) {
      sim_row <- lifetap_impl(lt_manacost, sim_row[4])
    } else {
      i <- i + 1
      sim_row <- shadowbolt_impl(
        sb_dmg[i], sb_miss[i], sb_crit[i], sb_manacost, 2.5, sim_row[4]
      )
    }
    stats_total <- stats_total + sim_row
    sim_data <- rbind(sim_data, sim_row)
  }
  sb <- sim_data[sim_data[, 2] < 0, ]
  nsb <- nrow(sb)
  if (!is.null(sp_bonus)) {
    rows <- lapply(lengths(sp_bonus), sample.int, n = nsb)
    lst <- lapply(names(sp_bonus), function(x) {
      out <- double(nsb)
      out[rows[[x]]] <- sp_bonus[[x]]
      out
    })
    sp <- sp + do.call(`+`, lst)
  }
  dmg <- shadowbolt_dmg(
    sb[, 1], sp, sb_miss[seq_len(nsb)], sb_crit[seq_len(nsb)],
    improved_sb_proc = c(0, sb[, 4][-nsb])
  )
  stats_total[1] <- sum(dmg)
  stats_total[4] <- stats_total[1] / stats_total[3]
  stats_total
}
