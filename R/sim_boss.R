#' Simulate Boss Fight
#'
#' Simulates one boss fight with default values.
#'
#' @param stats a named list with the stats of the character including int, sp,
#'  crit, hit and mp5
#' @param time length of fight in seconds
#' @param seed optional seed
#' @param trinkets which use trinkets are equipped, currently implemented:
#'  toep (Talisman of Ephemeral Power)
#'  zhc (Zandalarian Hero Charm)
#'
#' @return a numeric vector with values for total dmg, mana, total casttime and
#'  dps
#' @export
#'
#' @examples
#' sim_boss(list(int = 277, sp = 346, crit = 2, hit = 2))
sim_boss <- function(stats, trinkets = NULL, time = 150, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  stats <- clean_stats(stats)
  args <- sim_setup(time, stats$crit, stats$hit, stats$int, stats$sp,
    trinkets = trinkets
  )
  do.call(sim_boss_impl, c(flatten_sp_bonus(args),
    mp5 = stats$mp5, sp = stats$sp, time = time
  ))
}

flatten_sp_bonus <- function(x) {
  x[["sp_bonus"]] <- x[["sp_bonus"]][[1]]
  x
}
