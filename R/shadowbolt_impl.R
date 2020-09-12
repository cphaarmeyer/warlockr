#' Base Implementation of Shadow Bolt
#'
#' @inheritParams shadowbolt
#' @inheritParams sim_boss_impl
#' @param mana mana difference
#' @param casttime cast time
shadowbolt_impl <- function(sb_dmg,
                            sb_miss,
                            sb_crit,
                            mana,
                            casttime,
                            improved_sb_proc) {
  if (!sb_miss && improved_sb_proc > 0) {
    improved_sb_proc <- improved_sb_proc - 1
  }
  if (!sb_miss && sb_crit) {
    improved_sb_proc <- 4
  }
  c(sb_dmg, mana, casttime, improved_sb_proc)
}
