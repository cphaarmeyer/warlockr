#' Compare Items
#'
#' Simulates dps with current stats and with new stats to compare them.
#'
#' @inheritParams sim_dps
#' @param items list where each element indicates the stat changes by an item
#'
#' @return a data frame
#' @export
#'
#' @examples
#' compare_items(
#'   list(int = 277, sp = 346, crit = 2, hit = 2),
#'   items = list(
#'     new_item1 = list(crit = -1, hit = 1),
#'     new_item2 = list(int = 5, sp = 3)
#'   ),
#'   iter = 1000
#' )
compare_items <- function(stats, items,
                          timeframe = c(60, 300),
                          iter = 50000,
                          seed = NULL) {
  new_stats <- lapply(items, function(x) sum_stats(list(stats, x)))
  stats_list <- add_current(new_stats, stats)
  compare_dps(stats_list, timeframe = timeframe, iter = iter, seed = seed)
}

add_current <- function(lst, stats) c(list(current = stats), lst)
