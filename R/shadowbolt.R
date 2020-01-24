#' Shadowbolt
#'
#' Simulates a shadow bolt. Based on:
#' https://www.reddit.com/r/classicwow/comments/dh5r6g/so_i_made_a_warlock_shadowbolt_simulator/
#'
#' @param crit crit percentage on gear
#' @param hit hit percentage on gear
#' @param int intellect of character
#' @param sp (shadow) spellpower on gear
#' @param devastation number of talent points in devastation
#' @param ruin number of talent points in ruin
#' @param improved_sb number of talent points in improved shadow bolt
#' @param cataclysm number of talent points in cataclysm
#' @param bane number of talent points in bane
#' @param shadow_mastery number of talent points in shadow mastery
#' @param demonic_sacrifice whether succubus was sacrificed
#' @param improved_sb_proc number of active procs of improved shadow bolt on target
#' @param curse_of_shadows whether curse of shadows is on target
#'
#' @return a numeric vector with values for dmg, manacost, casttime and improved_sb_proc
#' @export
#'
#' @examples
#' shadowbolt(2, 1, 277, 346)
shadowbolt <- function(crit, hit, int, sp, devastation = 5, ruin = 1, improved_sb = 5, cataclysm = 2,
                       bane = 5, shadow_mastery = 0, demonic_sacrifice = 1, improved_sb_proc = 0, curse_of_shadows = 1) {
  dmg <- (sample(455:507, 1) + 0.8571 * sp) * (1 + 0.02 * shadow_mastery) *
    (1 + 0.15 * demonic_sacrifice) * (1 + 0.1 * curse_of_shadows)
  hit_table <- sample(1:100, 1)
  miss_test <- (hit_table <= 1 | hit_table <= (17 - hit))
  crit_test <- hit_table >= (100 - compute_critchance(crit, int, devastation))
  improved_sb_test <- improved_sb_proc > 0
  manacost <- -1 * (370 - (370 * 0.01 * cataclysm))
  casttime <- 3 - (0.1 * bane)

  if (miss_test == TRUE) {
    dmg <- 0
    stats <- c(dmg, manacost, casttime, improved_sb_proc)
    return(stats)
  } else if (crit_test == TRUE) {
    dmg <- dmg * (1.5 + (0.5 * ruin))
    if (improved_sb_test == TRUE) {
      dmg <- dmg * (1 + 0.05 * improved_sb)
      improved_sb_proc <- improved_sb_proc - 1
      stats <- c(dmg, manacost, casttime, improved_sb_proc)
      return(stats)
    } else {
      improved_sb_proc <- 4
      stats <- c(dmg, manacost, casttime, improved_sb_proc)
      return(stats)
    }
  } else {
    if (improved_sb_test == TRUE) {
      dmg <- dmg * (1 + 0.05 * improved_sb)
      improved_sb_proc <- improved_sb_proc - 1
      stats <- c(dmg, manacost, casttime, improved_sb_proc)
      return(stats)
    } else {
      stats <- c(dmg, manacost, casttime, improved_sb_proc)
      return(stats)
    }
  }
}
