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
                       iter = 50000) {
  seed <- sample_seed()
  out <- compare_buffs(stats, timeframe = timeframe, iter = iter, seed = seed)
  get_best_buff <- function(stats, consumables, worldbuffs) {
    df <- compare_buffs(stats,
      consumables = consumables, worldbuffs = worldbuffs,
      timeframe = timeframe, iter = iter, seed = seed
    )
    row <- which.max(df$dps)
    df[row, ]
  }
  while (length(consumables) + length(worldbuffs) > 0) {
    best_buff_df <- get_best_buff(stats, consumables, worldbuffs)
    best_buff <- row.names(best_buff_df)
    out <- rbind(out, best_buff_df)
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
