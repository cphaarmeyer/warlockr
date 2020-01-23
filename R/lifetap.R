#' Lifetap
#'
#' Simulates a life tap. Based on:
#' https://www.reddit.com/r/classicwow/comments/dh5r6g/so_i_made_a_warlock_shadowbolt_simulator/
#'
#' @inherit shadowbolt
#' @param imp_lifetap number of talent points in improved life tap
#'
#' @export
#'
#' @examples
#' lifetap(346)
lifetap <- function(sp, imp_lifetap = 2, improved_sb_proc = 0) {
  dmg <- 0
  manacost <- (440 + 0.8 * sp) * (1 + 0.05 * imp_lifetap)
  casttime <- 1.5
  stats <- c(dmg, manacost, casttime, improved_sb_proc)
  return(stats)
}
