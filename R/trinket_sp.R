#' Spell Power Bonus of Trinkets
#'
#' @inheritParams sim_setup
#'
#' @export
#'
#' @examples
#' trinket_sp("toep", 150)
trinket_sp <- function(trinkets, times) {
  stopifnot(all(trinkets %in% c("toep")))
  potential_time <- times - 10
  nsb_full <- (15 %/% 2.5) * (potential_time %/% 90)
  nsb_rest <- pmin(15, potential_time %% 90) %/% 2.5
  nsb <- nsb_full + nsb_rest
  lapply(nsb, function(x) {
    list(toep = rep.int(175, x))
  })
}
