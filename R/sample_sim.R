#' Sample Shadow Bolt Damage, Hit, Crit and Curse Hit
#'
#' @inheritParams sample_shadowbolt
#'
#' @return a list
sample_sim <- function(n) {
  list(
    sb = sample_shadowbolt(n),
    hit = sample_roll(n),
    crit = sample_roll(n),
    curse = sample_roll(n)
  )
}
