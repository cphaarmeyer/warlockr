#' Rank Buffs
#'
#' Ranks buffs by choosing the best one iteratively.
#'
#' @inheritParams compare_buffs
#'
#' @export
#'
#' @examples
#' stats <- with_buffs(list(int = 275, sp = 581, crit = 5, hit = 9))
#' rank_buffs(stats, consumables = c("gae", "eosp", "bwo"), iter = 1000)
#' rank_buffs(stats, worldbuffs = c("ony", "zg", "ss", "dm"), iter = 1000)
rank_buffs <- function(stats,
                       consumables = character(),
                       worldbuffs = character(),
                       timeframe = c(60, 300),
                       iter = 50000,
                       seed = NULL) {
  if (is.null(seed)) seed <- sample_seed()
  out <- compare_buffs(stats, timeframe = timeframe, iter = iter, seed = seed)
  while (length(consumables) + length(worldbuffs) > 0) {
    best_buff_row <- select_best_buff(
      stats, consumables, worldbuffs, timeframe, iter, seed
    )
    best_buff <- row.names(best_buff_row)
    out <- rbind(out, best_buff_row)
    stats <- with_buffs(stats,
      buffs = character(),
      consumables = intersect(consumables, best_buff),
      worldbuffs = intersect(worldbuffs, best_buff)
    )
    consumables <- setdiff(consumables, best_buff)
    worldbuffs <- setdiff(worldbuffs, best_buff)
  }
  out
}

select_best_buff <- function(stats, consumables, worldbuffs,
                             timeframe, iter, seed) {
  df <- compare_buffs(stats,
    consumables = consumables, worldbuffs = worldbuffs,
    timeframe = timeframe, iter = iter, seed = seed
  )
  df[which.max(df$dps), ]
}
