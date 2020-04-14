#' Shadow Bolt
#'
#' Simulates a shadow bolt.
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
#' @param improved_sb_proc number of active procs of improved shadow bolt on
#'  target
#' @param curse_of_shadows whether curse of shadows is on target
#'
#' @return a numeric vector with values for dmg, manacost, casttime and
#'  improved_sb_proc
#' @export
#'
#' @examples
#' shadowbolt(2, 1, 277, 346)
shadowbolt <- function(crit, hit, int, sp,
                       devastation = 5,
                       ruin = 1,
                       improved_sb = 5,
                       cataclysm = 2,
                       bane = 5,
                       shadow_mastery = 0,
                       demonic_sacrifice = 1,
                       improved_sb_proc = 0,
                       curse_of_shadows = 1) {
  arguments <- sim_setup(0, crit, hit, int, sp,
    devastation = devastation, ruin = ruin, cataclysm = cataclysm,
    shadow_mastery = shadow_mastery, demonic_sacrifice = demonic_sacrifice,
    curse_of_shadows = curse_of_shadows
  )
  dmg <- arguments$sb_dmg
  miss_test <- arguments$sb_miss
  crit_test <- arguments$sb_crit
  manacost <- arguments$sb_manacost
  casttime <- 3 - (0.1 * bane)
  shadowbolt_impl(
    dmg, miss_test, crit_test, manacost, casttime, improved_sb, improved_sb_proc
  )
}
