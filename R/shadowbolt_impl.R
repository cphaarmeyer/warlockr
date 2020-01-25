#' Base Implementation of Shadow Bolt
#'
#' @inheritParams shadowbolt
#' @param dmg damage ignoring improved shadow bolt proc
#' @param miss_test whether hits
#' @param crit_test whether crits
#' @param manacost mana cost
#' @param casttime cast time
#'
#' @export
#'
#' @examples
#' shadowbolt_impl(575, FALSE, TRUE, 363, 2.5, 5, 0)
shadowbolt_impl <- function(dmg, miss_test, crit_test, manacost, casttime, improved_sb, improved_sb_proc) {
  if (!miss_test & improved_sb_proc > 0) {
    dmg <- dmg * (1 + 0.05 * improved_sb)
    improved_sb_proc <- improved_sb_proc - 1
  }
  if (crit_test) {
    improved_sb_proc <- 4
  }
  c(dmg, manacost, casttime, improved_sb_proc)
}
