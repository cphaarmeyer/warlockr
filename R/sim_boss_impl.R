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
sim_boss_impl <- function(mana, mp5, sp, sb_dmg, sb_miss, sb_crit, curse_miss,
                          sb_manacost, lt_manacost, time, sp_bonus = NULL) {
  sim_data <- sim_boss_loop(
    mana, mp5, sb_dmg, sb_miss, sb_crit,
    curse_miss, sb_manacost, lt_manacost, time
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
  stats_total <- c(sum(dmg), 0, sum(sim_data[, 3]), 0)
  stats_total[2] <- sum(sim_data[, 2]) + mana + mp5 +
    ((stats_total[3] - sim_data[, 3][nrow(sim_data)]) %/% 5) * mp5
  stats_total[4] <- stats_total[1] / stats_total[3]
  stats_total
}
