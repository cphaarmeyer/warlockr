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
  args <- sim_setup(0, crit, hit, int, sp, talents = talents)
  out <- shadowbolt_impl(
    args$sb_dmg, args$sb_miss, args$sb_crit, args$sb_mana,
    shadowbolt_casttime(talents), improved_sb_proc
  )
  out[1] <- shadowbolt_dmg(
    args$sb_dmg, sp, args$sb_miss, args$sb_crit,
    talents = talents, improved_sb_proc = improved_sb_proc
  )
  out
}

shadowbolt_casttime <- function(talents) {
  3 - (0.1 * talents[["bane"]])
}
