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
#' @param sb_mana mana difference of shadow bolt
#' @param lt_mana mana difference of life tap
#' @param sp_bonus list of sp bonus vectors applied to shadow bolts
sim_boss_impl <- function(mana, mp5, sp, sb_dmg, sb_miss, sb_crit, curse_miss,
                          sb_mana, lt_mana, time, sp_bonus = NULL) {
  sim_data <- sim_boss_spells(
    mana, mp5, sb_dmg, sb_miss, sb_crit,
    curse_miss, sb_mana, lt_mana, time
  )
  sb <- sim_data[sim_data[, 3] == 2.5, ]
  nsb <- nrow(sb)
  if (!is.null(sp_bonus)) {
    rows <- sample.int(nsb, length(sp_bonus))
    out <- double(nsb)
    out[rows] <- sp_bonus
    sp <- sp + out
  }
  dmg <- shadowbolt_dmg(
    sb[, 1], sp, sb_miss[seq_len(nsb)], sb_crit[seq_len(nsb)],
    improved_sb_proc = c(0, sb[, 4][-nsb])
  )
  stats_total <- c(dmg = sum(dmg), mana = 0, time = sum(sim_data[, 3]), dps = 0)
  stats_total[2] <- sum(sim_data[, 2]) + mana + mp5 +
    (stats_total[3] %/% 5) * mp5
  stats_total[4] <- stats_total[1] / stats_total[3]
  stats_total
}
