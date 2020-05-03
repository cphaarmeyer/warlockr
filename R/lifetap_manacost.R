#' Life Tap Mana Cost
#'
#' @inheritParams lifetap
#'
#' @export
#'
#' @examples
#' lifetap_manacost(0)
lifetap_manacost <- function(sp, imp_lifetap = 2) {
  (440 + 0.8 * sp) * (1 + 0.05 * imp_lifetap)
}
