#' Spell Power Bonus of Trinkets
#'
#' @inheritParams sim_setup
#'
trinket_sp <- function(trinkets, times) {
  stopifnot(trinkets %in% c("toep", "zhc"))
  toep <- gather_sp_bonus(times, 15, 90, sp_toep, "toep" %in% trinkets)
  zhc <- gather_sp_bonus(times, 20, 120, sp_zhc, "zhc" %in% trinkets)
  Map(c, toep, zhc)
}

trinket_uptime <- function(times, duration, cooldown) {
  full_uptime <- lapply(times %/% cooldown, rep.int, x = duration)
  rest_uptime <- pmin(duration, times %% cooldown)
  Map(c, full_uptime, rest_uptime)
}

keep_positive <- function(x) x[x > 0]

n_shadowbolts <- function(uptime) {
  uptime_with_lag <- lapply(uptime, account_for_lag)
  lapply(lapply(uptime_with_lag, `%/%`, 2.5), keep_positive)
}

account_for_lag <- function(duration) duration - 1

sp_toep <- function(n) rep.int(175, n)

sp_zhc <- function(n) seq.int(from = 204, by = -17, length.out = n)

gather_sp_bonus <- function(times, duration, cooldown, sp_fun, exists) {
  if (exists) {
    uptime <- trinket_uptime(times, duration, cooldown)
    lapply(n_shadowbolts(uptime), function(x) unlist(lapply(x, sp_fun)))
  } else {
    rep.int(list(NULL), length(times))
  }
}
