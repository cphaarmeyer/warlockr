#' Compare Buffs
#'
#' @inherit compare_items
#' @inheritParams with_buffs
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
                          iter = 50000) {
  with_buffs_trimmed <- function(...) with_buffs(..., buffs = character())
  with_consumables <- function(nm) with_buffs_trimmed(stats, consumables = nm)
  with_worlbuffs <- function(nm) with_buffs_trimmed(stats, worldbuffs = nm)
  stats_list <- c(
    list(current = stats),
    lapply(char_set_names(consumables), with_consumables),
    lapply(char_set_names(worldbuffs), with_worlbuffs)
  )
  compare_dps(stats_list, timeframe = timeframe, iter = iter)
}
