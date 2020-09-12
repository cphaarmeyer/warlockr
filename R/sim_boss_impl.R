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
  spells <- sim_boss_spells(
    mana, mp5, sb_dmg, sb_miss, sb_crit,
    curse_miss, sb_mana, lt_mana, time
  )
  sb <- select_shadowbolts(spells)
  dmg <- adjust_dmg(sb, sp, sp_bonus, sb_miss, sb_crit)
  total <- c(dmg = sum(dmg), mana = 0, time = sum(spells[, 3]), dps = 0)
  total[["mana"]] <- sum_mana(mana, mp5, spells[, 2], total[["time"]])
  total[["dps"]] <- total[["dmg"]] / total[["time"]]
  total
}

select_shadowbolts <- function(spells) {
  spells[spells[, 3] == 2.5, ]
}

adjust_dmg <- function(sb, sp, sp_bonus, sb_miss, sb_crit) {
  n <- nrow(sb)
  sp <- add_sp_bonus(sp, sp_bonus, n)
  shadowbolt_dmg(
    sb[, 1], sp, sb_miss[seq_len(n)], sb_crit[seq_len(n)],
    improved_sb_proc = shift_down(sb[, 4])
  )
}

add_sp_bonus <- function(sp, bonus, n) {
  out <- rep.int(sp, n)
  if (!is.null(bonus)) {
    rows <- sample.int(n, length(bonus))
    out[rows] <- out[rows] + bonus
  }
  out
}

shift_down <- function(x) {
  c(0, x[-length(x)])
}

sum_mana <- function(mana, mp5, spells_mana, time) {
  sum(spells_mana) + mana + mp5 + (time %/% 5) * mp5
}
