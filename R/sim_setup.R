#' Setup Simulation
#'
#' @param times vector with \code{time} for every iteration
#' @inheritParams shadowbolt
#' @inheritParams sim_dps
#' @inheritParams warlock_talents
#'
#' @return a list of arguments
sim_setup <- function(times, crit, hit, int, sp,
                      trinkets = NULL,
                      iter = 1,
                      talents = warlock_talents()) {
  stopifnot(length(times) == iter)
  max_n_shadowbolts <- max(times) %/% 2.5 + 1
  s <- lapply(sample_sim(max_n_shadowbolts * iter), to_matrix, ncol = iter)
  list(
    mana = compute_mana(int),
    sb_dmg = s$sb,
    sb_miss = is_miss(s$hit, hit),
    sb_crit = is_crit(s$crit, crit, int, talents),
    sb_mana = shadowbolt_mana(talents),
    lt_mana = lifetap_mana(sp = sp),
    curse_miss = is_miss(s$curse, hit + 2 * talents[["suppression"]]),
    sp_bonus = if (!is.null(trinkets)) trinket_sp(trinkets, times)
  )
}

to_matrix <- function(x, ncol) if (ncol > 1) matrix(x, ncol = ncol) else x

is_miss <- function(s, hit) s <= 1 | s <= (17 - hit)

is_crit <- function(s, crit, int, talents) {
  s >= (100 - compute_critchance(crit, int, talents))
}
