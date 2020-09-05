#' With Buffs
#'
#' Adds buffs to stats.
#'
#' Available buffs:
#' Arcane Intellect (ai),
#' Mark of the Wild (motw)
#'
#' Available consumables:
#' Greater Arcane Elixir (gae),
#' Elixir of Shadow Power (eosp),
#' Brilliant Wizard Oil (bwo),
#' Flask of Supreme Power (fosp)
#'
#' Available worldbuffs:
#' Rallying Cry of the Dragonslayer (ony),
#' Spirit of Zandalar (zg),
#' Songflower Serenade (ss),
#' Slip'kik's Savvy (dm)
#'
#' @inheritParams compare_equip
#' @param buffs shortcuts of buffs
#' @param consumables shortcuts of consumables
#' @param worldbuffs shortcuts of worldbuffs
#'
#' @export
#'
#' @examples
#' with_buffs(list(int = 275, sp = 581, crit = 5, hit = 9),
#'   worldbuffs = c("ony", "zg")
#' )
with_buffs <- function(stats,
                       buffs = c("ai", "motw"),
                       consumables = character(),
                       worldbuffs = character()) {
  stopifnot(
    is_valid_buff(buffs, available_buffs),
    is_valid_buff(consumables, available_consumables),
    is_valid_buff(worldbuffs, available_worldbuffs)
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

available_buffs <- list(
  ai = list(int = 31),
  motw = list(int = 16)
)

available_consumables <- list(
  gae = list(sp = 35),
  eosp = list(sp = 40),
  bwo = list(sp = 30, crit = 1),
  fosp = list(sp = 150)
)

available_worldbuffs <- list(
  ony = list(crit = 10),
  zg = "zg",
  ss = list(int = 15, crit = 5),
  dm = list(crit = 3)
)

is_valid_buff <- function(b, available) {
  is_unique(b) & all(b %in% names(available))
}
