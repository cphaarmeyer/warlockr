#' Simulate Boss Fight
#'
#' Simulates one boss fight with default values.
#'
#' @inheritParams shadowbolt
#' @param mp5 mp5 on gear
#' @param mana starting mana (by default computed from int)
#' @param time length of fight in seconds
#'
#' @return a numeric vector with values for total dmg, mana, total casttime and dps
#' @export
#'
#' @examples
#' sim_boss(2, 1, 277, 346, 0)
sim_boss <- function(crit, hit, int, sp, mp5, mana = NULL, time = 150) {
  n_max <- time %/% 2.5 + 1
  arguments <- sim_setup(n_max, crit, hit, int, sp, mana)
  do.call(sim_boss_impl, c(arguments, mp5 = mp5, time = time))
}
