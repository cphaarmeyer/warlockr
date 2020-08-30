#' Add Consumables
#'
#' Adds consumables and buffs to stats.
#' Available are:
#' Arcane Intellect (ai),
#' Mark of the Wild (motw),
#' Greater Arcane Elixir (gae),
#' Elixir of Shadow Power (eosp),
#' Brilliant Wizard Oil (bwo),
#' Flask of Supreme Power (fosp)
#'
#' @inheritParams compare_equip
#' @param consumables shortcuts of consumables
#'
#' @export
#'
#' @examples
#' add_consumables(list(int = 275, sp = 581, crit = 5, hit = 9))
add_consumables <- function(stats, consumables = c(
                              "ai", "motw", "gae", "eosp", "bwo"
                            )) {
  available <- c(available_buffs, available_consumables)
  stopifnot(consumables %in% names(available))
  sum_stats(c(list(stats), available[consumables]))
}

available_buffs <- list(
  ai = list(int = 31),
  motw = list(int = 16)
)

available_consumables <- list(
  gae = list(sp = 35),
  eosp = list(sp = 40),
  bwo = list(sp = 30, crit = 1),
  fosp = list(sp = 150)
)
