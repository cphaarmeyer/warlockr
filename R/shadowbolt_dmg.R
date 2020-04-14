#' Compute Shadow Bolt Damage
#'
#' @param sample_dmg base damage returned by \code{sample_shadowbolt}
#' @inheritParams sim_boss_impl
#' @inheritParams shadowbolt
#'
#' @export
shadowbolt_dmg <- function(sample_dmg, sp, sb_miss, sb_crit,
                           ruin = 1, improved_sb = 5, shadow_mastery = 0,
                           demonic_sacrifice = 1, curse_of_shadows = 1,
                           improved_sb_proc = 0) {
  (sample_dmg + 0.8571 * sp) * (1 + 0.02 * shadow_mastery) *
    (1 + 0.15 * demonic_sacrifice) * (1 + 0.1 * curse_of_shadows) *
    as.double(!sb_miss) * (1 + as.double(sb_crit) * 0.5 * (1 + ruin)) *
    (1 + 0.04 * improved_sb * as.double(improved_sb_proc > 0))
}
