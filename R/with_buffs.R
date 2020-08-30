#' With Buffs
#'
#' Adds buffs to stats.
#'
#' @inheritParams add_consumables
#' @param buffs shortcuts of buffs
#' @inheritParams add_worldbuffs
#'
#' @export
#'
#' @examples
#' with_buffs(list(int = 275, sp = 581, crit = 5, hit = 9))
with_buffs <- function(stats,
                       buffs = c("ai", "motw"),
                       consumables = c("gae", "eosp", "bwo"),
                       worldbuffs = c("ony", "zg")) {
  stopifnot(
    buffs %in% names(available_buffs),
    consumables %in% names(available_consumables),
    worldbuffs %in% names(available_worldbuffs)
  )
  has_zg <- "zg" %in% worldbuffs
  if (has_zg) worldbuffs <- setdiff(worldbuffs, "zg")
  out <- sum_stats(c(
    list(stats),
    available_buffs[buffs],
    available_consumables[consumables],
    available_worldbuffs[worldbuffs]
  ))
  if (has_zg) out[["int"]] <- round(out[["int"]] * 1.1)
  out
}
