#' Setup Simulation
#'
#' @param times vector with \code{time} for every iteration
#' @inheritParams shadowbolt
#' @inheritParams sim_dps
#' @param suppression number of talent points in suppression
#'
#' @return a list of arguments
#' @export
#'
#' @examples
#' sim_setup(30, 2, 1, 277, 346)
sim_setup <- function(times, crit, hit, int, sp,
                      iter = 1, devastation = 5, cataclysm = 2, suppression = 2,
                      trinkets = NULL) {
  stopifnot(length(times) == iter)
  n <- max(times) %/% 2.5 + 1
  to_matrix <- function(x) {
    if (iter > 1) matrix(x, ncol = iter) else x
  }
  s <- sample_all(n * iter)
  sb_miss <- compute_miss(s$hit, hit)
  sb_crit <- s$crit >= (100 - compute_critchance(crit, int, devastation))
  curse_miss <- compute_miss(s$curse, hit + 2 * suppression)
  sp_bonus <- if ("toep" %in% trinkets) {
    potential_time <- times - 10
    nsb_full <- (15 %/% 2.5) * (potential_time %/% 90)
    nsb_rest <- pmin(15, potential_time %% 90) %/% 2.5
    nsb <- nsb_full + nsb_rest
    lapply(nsb, function(x) {
      list(toep = rep.int(175, x))
    })
  }
  list(
    mana = compute_mana(int),
    sb_dmg = to_matrix(s$sb),
    sb_miss = to_matrix(sb_miss),
    sb_crit = to_matrix(sb_crit),
    sb_manacost = -compute_manacost(cataclysm = cataclysm),
    lt_manacost = compute_manacost("lifetap", sp = sp),
    curse_miss = to_matrix(curse_miss),
    sp_bonus = sp_bonus
  )
}
