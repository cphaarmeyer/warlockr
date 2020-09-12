#' Shadow Bolt Mana
#'
#' @inheritParams shadowbolt
#'
#' @export
#'
#' @examples
#' shadowbolt_mana()
shadowbolt_mana <- function(cataclysm = 2) {
  -370 * (1 - 0.01 * cataclysm)
}
