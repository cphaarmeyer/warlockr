#' Compute Shadow Bolt Damage
#'
#' @param sample_dmg base damage returned by \code{sample_shadowbolt}
#' @inheritParams sim_boss_impl
#' @inheritParams shadowbolt
#'
#' @export
shadowbolt_dmg <- function(sample_dmg, sp, sb_miss, sb_crit,
                           devastation = 5,
                           ruin = 1,
                           shadow_mastery = 0,
                           demonic_sacrifice = 1,
                           curse_of_shadows = 1) {
  (sample_dmg + 0.8571 * sp) * (1 + 0.02 * shadow_mastery) *
    (1 + 0.15 * demonic_sacrifice) * (1 + 0.1 * curse_of_shadows) *
    as.double(!sb_miss) * (1 + sb_crit * 0.5 * (1 + ruin))
}
