#' Sample Shadow Bolt Damage, Hit, Crit and Curse Hit
#'
#' @inheritParams sample_shadowbolt
#'
#' @return a list
#' @export
#'
#' @examples
#' sample_sim(10)
sample_sim <- function(n) {
  list(
    sb = sample_shadowbolt(n),
    hit = sample_roll(n),
    crit = sample_roll(n),
    curse = sample_roll(n)
  )
}
