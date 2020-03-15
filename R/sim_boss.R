#' Simulate Boss Fight
#'
#' Simulates one boss fight with default values.
#'
#' @param stats a named list with the stats of the character including int, sp,
#'  crit, hit and mp5
#' @param time length of fight in seconds
#'
#' @return a numeric vector with values for total dmg, mana, total casttime and
#'  dps
#' @export
#'
#' @examples
#' sim_boss(list(int = 277, sp = 346, crit = 2, hit = 2))
sim_boss <- function(stats, time = 150) {
  n_max <- time %/% 2.5 + 1
  stats <- clean_stats(stats)
  arguments <- sim_setup(n_max, stats$crit, stats$hit, stats$int, stats$sp)
  do.call(sim_boss_impl, c(arguments, mp5 = stats$mp5, time = time))
}
