#' Spell Power Bonus of Trinkets
#'
#' @inheritParams sim_setup
#'
#' @export
#'
#' @examples
#' trinket_sp("toep", 150:154)
#' trinket_sp(c("toep", "zhc"), 150)
trinket_sp <- function(trinkets, times) {
  stopifnot(all(trinkets %in% c("toep", "zhc")))
  potential_time <- times - 10
  get_nsb <- function(dur, cd) {
    nsb_full <- (dur %/% 2.5) * (potential_time %/% cd)
    nsb_rest <- pmin(dur, potential_time %% cd) %/% 2.5
    nsb_full + nsb_rest
  }
  toep <- if ("toep" %in% trinkets) {
    lapply(get_nsb(15, 90), function(x) {
      list(toep = rep.int(175, x))
    })
  }
  zhc <- if ("zhc" %in% trinkets) {
    lapply(get_nsb(20, 120), function(x) {
      sp_seq <- seq.int(from = 204, by = -17, length.out = 8)
      list(zhc = rep(sp_seq, (x %/% 8) + 1)[seq_len(x)])
    })
  }
  lapply(seq_along(times), function(x) {
    c(toep[[x]], zhc[[x]])
  })
}
