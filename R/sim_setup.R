#' Setup Simulation
#'
#' @param n sample number
#' @inheritParams shadowbolt
#' @inheritParams sim_dps
#' @param suppression number of talent points in suppression
#'
#' @return a list of arguments
#' @export
#'
#' @examples
#' sim_setup(10, 2, 1, 277, 346, NULL)
sim_setup <- function(n, crit, hit, int, sp, mana, iter = 1,
                      devastation = 5, ruin = 1, cataclysm = 2, shadow_mastery = 0,
                      demonic_sacrifice = 1, curse_of_shadows = 1, suppression = 2) {
  if (is.null(mana)) mana <- compute_mana(int)
  to_matrix <- function(x) {
    if (iter > 1) matrix(x, ncol = iter) else x
  }
  sb_dmg <- (sample_shadowbolt(n * iter) + 0.8571 * sp) * (1 + 0.02 * shadow_mastery) *
    (1 + 0.15 * demonic_sacrifice) * (1 + 0.1 * curse_of_shadows)
  sample_h <- sample_hit(n * iter)
  sample_c <- sample_hit(n * iter)
  sample_curse <- sample_hit(n * iter)
  sb_miss <- sample_h <= 1 | sample_h <= (17 - hit)
  sb_crit <- sample_c >= (100 - compute_critchance(crit, int, devastation))
  sb_dmg <- (sb_dmg * !sb_miss) * (1 + sb_crit * 0.5 * (1 + ruin))
  curse_miss <- sample_curse <= 1 | sample_curse <= (17 - hit - 2 * suppression)
  list(
    mana = mana,
    sb_dmg = to_matrix(sb_dmg),
    sb_miss = to_matrix(sb_miss),
    sb_crit = to_matrix(sb_crit),
    sb_manacost = -compute_manacost(cataclysm = cataclysm),
    lt_mancost = compute_manacost("lifetap", sp = sp),
    curse_miss = to_matrix(curse_miss)
  )
}
