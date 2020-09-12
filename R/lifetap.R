#' Life Tap
#'
#' Simulates a life tap.
#'
#' @inherit shadowbolt
#' @inheritParams warlock_talents
#'
#' @export
#'
#' @examples
#' lifetap(346)
lifetap <- function(sp, imp_lifetap = 2, improved_sb_proc = 0) {
  mana <- lifetap_mana(sp = sp, imp_lifetap = imp_lifetap)
  lifetap_impl(mana, improved_sb_proc)
}
