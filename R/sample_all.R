#' Sample Shadow Bolt Damage, Hit, Crit and Curse Hit
#'
#' @inheritParams sample_shadowbolt
#'
#' @return a list
#' @export
#'
#' @examples
#' sample_all(10)
sample_all <- function(n) {
  list(
    sb = sample_shadowbolt(n),
    hit = sample_hit(n),
    crit = sample_hit(n),
    curse = sample_hit(n)
  )
}
