#' Compare Buffs
#'
#' @inherit compare_items
#'
#' @export
#'
#' @examples
#' compare_buffs(with_buffs(
#'   list(int = 275, sp = 581, crit = 5, hit = 9),
#'   buffs = c("ai", "motw")
#' ),
#' iter = 1000
#' )
compare_buffs <- function(stats, timeframe = c(60, 300), iter = 50000) {
  worldbuffs <- stats::setNames(nm = names(available_worldbuffs))
  consumables <- stats::setNames(nm = names(available_consumables))
  stats_list <- c(
    list(current = stats),
    lapply(consumables, function(nm) with_buffs(stats, consumables = nm)),
    lapply(worldbuffs, function(nm) with_buffs(stats, worldbuffs = nm))
  )
  compare_dps(stats_list, timeframe = timeframe, iter = iter)
}
