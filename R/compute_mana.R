#' Compute Mana
#'
#' Computes the maximum mana based on intellect and base mana.
#'
#' @inheritParams shadowbolt
#' @param base base mana
#'
#' @export
#'
#' @examples
#' compute_mana(267)
compute_mana <- function(int, base = 1093) {
  base + int * 15
}
