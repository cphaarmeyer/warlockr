#' Compute Crit Chance
#'
#' Computes crit chance based on crit on gear, intelligence and talent points in
#' devastation.
#'
#' @inheritParams shadowbolt
#'
#' @export
#'
#' @examples
#' compute_critchance(3, 267)
compute_critchance <- function(crit, int, talents = warlock_talents()) {
  1.71 + int / 60.6 + talents[["devastation"]] + crit
}
