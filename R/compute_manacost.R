#' Compute Mana Cost
#'
#' Computes the mana cost of a shadow bolt based on numer of points in cataclysm.
#'
#' @inheritParams shadowbolt
#'
#' @export
#'
#' @examples
#' compute_manacost()
compute_manacost <- function(cataclysm = 2) {
  370 * (1 - 0.01 * cataclysm)
}
