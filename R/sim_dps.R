#' Simultate DPS
#'
#' Repeatedly simulates bosses to calculate dps.
#'
#' @inherit sim_boss
#' @param timeframe vector of minimal and maximal duration of a fight in seconds
#' @param iter number of iterations
#' @param seed optional seed
#'
#' @return a matrix where every row is a vector returned by \code{sim_boss}
#' @export
#'
#' @examples
#' mat <- sim_dps(2, 1, 277, 346, 0, iter = 1000)
#' mean(mat[, 4])
sim_dps <- function(crit, hit, int, sp, mp5, mana = NULL, timeframe = c(45, 150), iter = 50000, seed = NULL) {
  if (is.null(mana)) mana <- compute_mana(int)
  if (!is.null(seed)) set.seed(seed)
  time <- stats::runif(iter, timeframe[1], timeframe[2])
  n_max <- max(time) %/% 2.5 + 1
  sb_dmg <- matrix((sample_shadowbolt(n_max * iter) + 0.8571 * sp) * 1.265, ncol = iter)
  sample_h <- matrix(sample_hit(n_max * iter), ncol = iter)
  sb_miss <- (sample_h <= 1 | sample_h <= (17 - hit))
  sb_crit <- sample_h >= (100 - compute_critchance(crit, int))
  sb_dmg <- (sb_dmg * !sb_miss) * (1 + sb_crit)
  sb_manacost <- compute_manacost()
  lt_mancost <- compute_manacost("lifetap", sp = sp)
  t(vapply(1:iter, function(i) {
    sim_boss_impl(mana, mp5, sb_dmg[, i], sb_miss[, i], sb_crit[, i], sb_manacost, lt_mancost, time[i])
  },
  FUN.VALUE = rep(0, 4)
  ))
}
