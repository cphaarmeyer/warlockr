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
                      trinkets = NULL,
                      iter = 1,
                      devastation = 5,
                      cataclysm = 2,
                      suppression = 2) {
  stopifnot(length(times) == iter)
  n <- max(times) %/% 2.5 + 1
  to_matrix <- function(x) {
    if (iter > 1) matrix(x, ncol = iter) else x
  }
  s <- sample_all(n * iter)
  sb_miss <- compute_miss(s$hit, hit)
  sb_crit <- s$crit >= (100 - compute_critchance(crit, int, devastation))
  curse_miss <- compute_miss(s$curse, hit + 2 * suppression)
  list(
    mana = compute_mana(int),
    sb_dmg = to_matrix(s$sb),
    sb_miss = to_matrix(sb_miss),
    sb_crit = to_matrix(sb_crit),
    sb_manacost = -shadowbolt_manacost(cataclysm = cataclysm),
    lt_manacost = lifetap_manacost(sp = sp),
    curse_miss = to_matrix(curse_miss),
    sp_bonus = if (!is.null(trinkets)) trinket_sp(trinkets, times)
  )
}
