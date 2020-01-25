#' Simulate Boss Fight
#'
#' Simulates one boss fight with default values. Based on:
#' https://www.reddit.com/r/classicwow/comments/dh5r6g/so_i_made_a_warlock_shadowbolt_simulator/
#'
#' @inheritParams shadowbolt
#' @param mana starting mana (by default computed from int)
#' @param time length of fight in seconds
#'
#' @return a numeric vector with values for total dmg, mana, total casttime and dps
#' @export
#'
#' @examples
#' sim_boss(2, 1, 277, 346)
sim_boss <- function(crit, hit, int, sp, mana = NULL, time = 150) {
  if (is.null(mana)) mana <- compute_mana(int)
  n_max <- time %/% 2.5 + 1
  sb_dmg <- (sample_shadowbolt(n_max) + 0.8571 * sp) * 1.265
  sample_h <- sample_hit(n_max)
  sb_miss <- (sample_h <= 1 | sample_h <= (17 - hit))
  sb_crit <- sample_h >= (100 - compute_critchance(crit, int))
  sb_manacost <- compute_manacost()
  lt_mancost <- compute_manacost("lifetap", sp = sp)
  sim_boss_impl(mana, sb_dmg, sb_miss, sb_crit, sb_manacost, lt_mancost, time)
}
