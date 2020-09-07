#' Shadow Bolt Mana Cost
#'
#' @inheritParams shadowbolt
#'
#' @export
#'
#' @examples
#' shadowbolt_manacost()
shadowbolt_manacost <- function(cataclysm = 2) {
  380 * (1 - 0.01 * cataclysm)
}
