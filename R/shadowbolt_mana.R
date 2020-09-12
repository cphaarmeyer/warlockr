#' Shadow Bolt Mana
#'
#' @inheritParams shadowbolt
#'
shadowbolt_mana <- function(talents = warlock_talents()) {
  -370 * (1 - 0.01 * talents[["cataclysm"]])
}
