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
  if (!is.null(seed)) set.seed(seed)
  time <- stats::runif(iter, timeframe[1], timeframe[2])
  n_max <- max(time) %/% 2.5 + 1
  arguments <- sim_setup(n_max, crit, hit, int, sp, mana, iter = iter)
  get_arg <- function(i) {
    lapply(arguments, function(x) {
      if (is.matrix(x)) x[, i] else x
    })
  }
  t(vapply(1:iter, function(i) {
    do.call(sim_boss_impl, c(get_arg(i), mp5 = mp5, time = time[i]))
  },
  FUN.VALUE = rep(0, 4)
  ))
}
