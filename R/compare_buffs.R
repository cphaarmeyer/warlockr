#' Compare Buffs
#'
#' @inherit compare_items
#' @inheritParams with_buffs
#'
#' @export
#'
#' @examples
#' compare_buffs(with_buffs(
#'   list(int = 275, sp = 581, crit = 5, hit = 9),
#'   buffs = c("ai", "motw")
#' ),
#' consumables = c("gae", "eosp", "bwo"), iter = 1000
#' )
compare_buffs <- function(stats,
                          consumables = character(),
                          worldbuffs = character(),
                          timeframe = c(60, 300),
                          iter = 50000) {
  stats_list <- c(
    list(current = stats),
    lapply(
      char_set_names(consumables),
      function(nm) with_buffs(stats, consumables = nm)
    ),
    lapply(
      char_set_names(worldbuffs),
      function(nm) with_buffs(stats, worldbuffs = nm)
    )
  )
  compare_dps(stats_list, timeframe = timeframe, iter = iter)
}
