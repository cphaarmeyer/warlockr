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
                      iter = 1,
                      devastation = 5,
                      ruin = 1,
                      cataclysm = 2,
                      shadow_mastery = 0,
                      demonic_sacrifice = 1,
                      curse_of_shadows = 1,
                      suppression = 2) {
  stopifnot(length(times) == iter)
  n <- max(times) %/% 2.5 + 1
  to_matrix <- function(x) {
    if (iter > 1) matrix(x, ncol = iter) else x
  }
  sample_h <- sample_hit(n * iter)
  sample_c <- sample_hit(n * iter)
  sample_curse <- sample_hit(n * iter)
  sb_miss <- compute_miss(sample_h, hit)
  sb_crit <- sample_c >= (100 - compute_critchance(crit, int, devastation))
  sb_dmg <- shadowbolt_dmg(sample_shadowbolt(n * iter), sp, sb_miss, sb_crit,
    devastation = devastation, ruin = ruin, shadow_mastery = shadow_mastery,
    demonic_sacrifice = demonic_sacrifice, curse_of_shadows = curse_of_shadows
  )
  curse_miss <- compute_miss(sample_curse, hit + 2 * suppression)
  list(
    mana = compute_mana(int),
    sb_dmg = to_matrix(sb_dmg),
    sb_miss = to_matrix(sb_miss),
    sb_crit = to_matrix(sb_crit),
    sb_manacost = -compute_manacost(cataclysm = cataclysm),
    lt_manacost = compute_manacost("lifetap", sp = sp),
    curse_miss = to_matrix(curse_miss)
  )
}
