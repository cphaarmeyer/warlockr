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
  stopifnot(consumables %in% names(available_consumables))
  sum_stats(c(list(stats), available_consumables[consumables]))
}

available_consumables <- list(
  ai = list(int = 31),
  motw = list(int = 16),
  gae = list(sp = 35),
  eosp = list(sp = 40),
  bwo = list(sp = 30, crit = 1),
  fosp = list(sp = 150)
)
