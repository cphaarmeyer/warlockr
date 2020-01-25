#' Life Tap
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
  manacost <- compute_manacost("lifetap", sp = sp, imp_lifetap = imp_lifetap)
  lifetap_impl(manacost, improved_sb_proc)
}
