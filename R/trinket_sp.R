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
  uptime <- Map(c, full_uptime, rest_uptime)
  lapply(uptime, function(x) x[x > 0])
}

n_shadowbolts <- function(times, duration, cooldown) {
  duration <- account_for_lag(duration)
  full <- (duration %/% 2.5) * (times %/% cooldown)
  rest <- pmin(duration, times %% cooldown) %/% 2.5
  full + rest
}

account_for_lag <- function(duration) duration - 1

sp_toep <- function(n) rep.int(175, n)

sp_zhc <- function(n) {
  sp_seq <- seq.int(from = 204, by = -17, length.out = 8)
  rep(sp_seq, (n %/% 8) + 1)[seq_len(n)]
}

gather_sp_bonus <- function(times, duration, cooldown, sp_fun, exists) {
  if (exists) {
    lapply(n_shadowbolts(times, duration, cooldown), sp_fun)
  } else {
    rep.int(list(NULL), length(times))
  }
}
