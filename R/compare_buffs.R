#' Compare Buffs
#'
#' @inherit compare_items
#' @inheritParams with_buffs
#' @inheritParams compare_dps
#'
#' @export
#'
#' @examples
#' compare_buffs(with_buffs(list(int = 275, sp = 581, crit = 5, hit = 9)),
#'   consumables = c("gae", "eosp", "bwo"), iter = 1000
#' )
compare_buffs <- function(stats,
                          consumables = character(),
                          worldbuffs = character(),
                          timeframe = c(60, 300),
                          iter = 50000,
                          seed = NULL) {
  stats_list <- add_current(c(
    lapply(char_set_names(consumables), add_buff, stats = stats),
    lapply(char_set_names(worldbuffs), add_buff, stats = stats)
  ), stats)
  compare_dps(stats_list, timeframe = timeframe, iter = iter, seed = seed)
}
