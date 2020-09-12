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
lifetap <- function(sp, talents = warlock_talents(), improved_sb_proc = 0) {
  mana <- lifetap_mana(sp = sp, talents = talents)
  lifetap_impl(mana, improved_sb_proc)
}
