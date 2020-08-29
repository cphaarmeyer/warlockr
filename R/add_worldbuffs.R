#' Add Worldbuffs
#'
#' Adds worldbuffs to stats.
#' Available are:
#' Rallying Cry of the Dragonslayer (ony),
#' Spirit of Zandalar (zg),
#' Songflower Serenade (ss),
#' Slip'kik's Savvy (dm)
#'
#' @inheritParams add_consumables
#' @param worldbuffs shortcuts of worldbuffs
#'
#' @export
#'
#' @examples
#' add_worldbuffs(list(int = 275, sp = 581, crit = 5, hit = 9))
add_worldbuffs <- function(stats, worldbuffs = c("ony", "zg")) {
  stopifnot(worldbuffs %in% names(available_worldbuffs))
  has_zg <- "zg" %in% worldbuffs
  if (has_zg) worldbuffs <- setdiff(worldbuffs, "zg")
  out <- sum_stats(c(list(stats), available_worldbuffs[worldbuffs]))
  if (has_zg) out[["int"]] <- round(out[["int"]] * 1.1)
  out
}

available_worldbuffs <- list(
  ony = list(crit = 10),
  zg = "zg",
  ss = list(int = 15, crit = 5),
  dm = list(crit = 3)
)
