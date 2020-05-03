#' Life Tap
#'
#' Simulates a life tap.
#'
#' @inherit shadowbolt
#' @param imp_lifetap number of talent points in improved life tap
#'
#' @export
#'
#' @examples
#' lifetap(346)
lifetap <- function(sp, imp_lifetap = 2, improved_sb_proc = 0) {
  manacost <- lifetap_manacost(sp = sp, imp_lifetap = imp_lifetap)
  lifetap_impl(manacost, improved_sb_proc)
}
