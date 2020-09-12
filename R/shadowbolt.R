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
#' @param talents list of talents
#'
#' @return a numeric vector with values for dmg, mana, casttime and
#'  improved_sb_proc
#' @export
#'
#' @examples
#' shadowbolt(2, 1, 277, 346)
shadowbolt <- function(crit, hit, int, sp,
                       talents = warlock_talents(),
                       improved_sb_proc = 0) {
  arguments <- sim_setup(0, crit, hit, int, sp, talents = talents)
  out <- shadowbolt_impl(
    arguments$sb_dmg, arguments$sb_miss, arguments$sb_crit,
    arguments$sb_mana, 3 - (0.1 * talents[["bane"]]), improved_sb_proc
  )
  out[1] <- shadowbolt_dmg(
    arguments$sb_dmg, sp, arguments$sb_miss, arguments$sb_crit,
    talents = talents, improved_sb_proc = improved_sb_proc
  )
  out
}
