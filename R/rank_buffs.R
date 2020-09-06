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
  buffs <- c(consumables, worldbuffs)
  while (length(buffs) > 0) {
    best_buff_row <- select_best_buff(
      stats, intersect(consumables, buffs), intersect(worldbuffs, buffs),
      timeframe, iter, seed
    )
    best_buff <- row.names(best_buff_row)
    out <- rbind(out, best_buff_row)
    stats <- add_buff(stats, best_buff)
    buffs <- setdiff(buffs, best_buff)
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
