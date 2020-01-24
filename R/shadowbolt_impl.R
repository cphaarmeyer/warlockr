#' Base Implementation of Shadow Bolt
#'
#' @inheritParams shadowbolt
#' @param dmg damage ignoring possible miss or crit
#' @param miss_test whether hits
#' @param crit_test whether crits
#' @param manacost mana cost
#' @param casttime cast time
#'
#' @export
#'
#' @examples
#' shadowbolt_impl(575, FALSE, TRUE, 363, 2.5, 1, 5, 0)
shadowbolt_impl <- function(dmg, miss_test, crit_test, manacost, casttime, ruin, improved_sb, improved_sb_proc) {
  improved_sb_test <- improved_sb_proc > 0
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
