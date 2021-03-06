#' Compare Equip
#'
#' Similar to \code{compare_items} but different interface.
#' See \code{is_equip} for more details.
#'
#' @inheritParams compare_items
#' @inheritParams is_equip
#' @param changes named list with the item changes
#'
#' @return a data frame
#' @export
#'
#' @examples
#' my_stats <- list(
#'   int = 213 + 31 + 12,
#'   sp = 360 + 119 + 40,
#'   crit = 4,
#'   hit = 1
#' )
#' my_equip <- list(
#'   head = list(int = 16, sp = 32),
#'   neck = list(int = 9, hit = 1),
#'   shoulders = list(sp = 26),
#'   back = list(sp = 18),
#'   chest = list(sp = 46),
#'   wrist = list(int = 11, sp = 13),
#'   hands = list(sp = 33),
#'   waist = list(int = 8, sp = 25, crit = 1),
#'   legs = list(int = 16, sp = 39),
#'   feet = list(int = 9, sp = 27),
#'   finger1 = list(int = 7, sp = 18),
#'   finger2 = list(int = 6, sp = 33),
#'   trinket1 = list(crit = 2),
#'   trinket2 = list(sp = 29),
#'   weapon = list(int = 12, sp = 60, crit = 1),
#'   wand = list(int = 4, sp = 11)
#' )
#' my_changes <- list(
#'   "New Weapon" = list(weapon = list(int = 29, sp = 84, crit = 2)),
#'   "New Rings" = list(
#'     finger1 = list(int = 10, sp = 11, hit = 1),
#'     finger2 = list(int = 13, sp = 6, hit = 2, mp5 = 4)
#'   ),
#'   "New Trinket" = list(trinket1 = "zhc")
#' )
#' compare_equip(my_stats, my_equip, my_changes, iter = 1000)
compare_equip <- function(stats, equip, changes,
                          timeframe = c(60, 300),
                          iter = 50000,
                          seed = NULL) {
  stopifnot(is_equip(equip))
  stats_base <- do_call_stats(list(stats, sum_stats(equip)), `-`)
  changes <- c(list(current = list()), changes)
  new_equip <- lapply(changes, function(x) replace_slot(equip, names(x), x))
  new_stats <- lapply(new_equip, function(...) {
    sum_stats(c(..., list(stats_base)))
  })
  df <- compare_dps(new_stats, timeframe = timeframe, iter = iter, seed = seed)
  add_slots(df, changes)
}

replace_slot <- function(equip, slot, replacement) {
  equip[slot] <- replacement
  equip
}

add_slots <- function(df, changes) {
  slots_list <- lapply(changes, names)
  df[["slot"]] <- vapply(slots_list, paste,
    collapse = "/", FUN.VALUE = character(1)
  )
  df
}
