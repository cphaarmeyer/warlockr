#' Shadow Bolt
#'
#' Simulates a shadow bolt.
#'
#' @param crit crit percentage on gear
#' @param hit hit percentage on gear
#' @param int intellect of character
#' @param sp (shadow) spellpower of character
#' @param improved_sb_proc number of active procs of improved shadow bolt on
#'  target
#' @inheritParams warlock_talents
#'
#' @return a numeric vector with values for dmg, mana, casttime and
#'  improved_sb_proc
#' @export
#'
#' @examples
#' shadowbolt(2, 1, 277, 346)
shadowbolt <- function(crit, hit, int, sp,
                       devastation = 5, ruin = 1, improved_sb = 5,
                       cataclysm = 2, bane = 5, shadow_mastery = 0,
                       demonic_sacrifice = 1, improved_sb_proc = 0,
                       curse_of_shadows = 1) {
  arguments <- sim_setup(0, crit, hit, int, sp,
    devastation = devastation, cataclysm = cataclysm
  )
  out <- shadowbolt_impl(
    arguments$sb_dmg, arguments$sb_miss, arguments$sb_crit,
    arguments$sb_mana, 3 - (0.1 * bane), improved_sb_proc
  )
  out[1] <- shadowbolt_dmg(
    arguments$sb_dmg, sp, arguments$sb_miss, arguments$sb_crit,
    ruin = ruin, improved_sb = improved_sb, shadow_mastery = shadow_mastery,
    demonic_sacrifice = demonic_sacrifice, curse_of_shadows = curse_of_shadows,
    improved_sb_proc = improved_sb_proc
  )
  out
}
