#' Compute Shadow Bolt Damage
#'
#' @inheritParams sim_boss_impl
#' @inheritParams shadowbolt
#'
#' @export
shadowbolt_dmg <- function(sb_dmg, sp, sb_miss, sb_crit,
                           talents = warlock_talents(),
                           improved_sb_proc = 0) {
  (sb_dmg + 6 / 7 * sp) * (1 + 0.02 * talents[["shadow_mastery"]]) *
    (1 + 0.15 * talents[["demonic_sacrifice"]]) *
    (1 + 0.1 * talents[["curse_of_shadows"]]) * as.double(!sb_miss) *
    (1 + as.double(sb_crit) * 0.5 * (1 + talents[["ruin"]])) *
    (1 + 0.04 * talents[["improved_sb"]] * as.double(improved_sb_proc > 0))
}
