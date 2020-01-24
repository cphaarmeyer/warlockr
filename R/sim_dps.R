#' Simultate DPS
#'
#' Repeatedly simulates bosses to calculate dps.
#'
#' @inherit sim_boss
#' @param iter number of iterations
#'
#' @return a matrix where every row is a vector returned by \code{sim_boss}
#' @export
#'
#' @examples
#' mat <- sim_dps(2, 1, 277, 346, iter = 1000)
#' mean(mat[, 4])
sim_dps <- function(crit, hit, int, sp, mana = NULL, time = 150, iter = 50000) {
  t(replicate(iter, sim_boss(crit, hit, int, sp, mana, time)))
}
