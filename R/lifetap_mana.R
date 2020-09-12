#' Life Tap Mana
#'
#' @inheritParams lifetap
#'
#' @export
#'
#' @examples
#' lifetap_mana(0)
lifetap_mana <- function(sp, talents = warlock_talents()) {
  (440 + 0.8 * sp) * (1 + 0.05 * talents[["imp_lifetap"]])
}
