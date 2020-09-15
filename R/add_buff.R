#' Add Buff
#'
#' Adds a buff, consumable or worldbuff to stats.
#' Seed \code{with_buffs} for details.
#'
#' @inheritParams with_buffs
#' @param buff shortcut of the buff to add
#'
#' @export
#'
#' @examples
#' stats <- list(int = 275, sp = 581, crit = 5, hit = 9)
#' add_buff(stats, "ony")
#' add_buff(stats, "eosp")
add_buff <- function(stats, buff) {
  stopifnot(length(buff) == 1)
  if (is_buff(buff)) {
    return(with_buffs(stats, buffs = buff))
  }
  if (is_consumable(buff)) {
    return(with_buffs(stats, buffs = character(), consumables = buff))
  }
  if (is_worldbuff(buff)) {
    return(with_buffs(stats, buffs = character(), worldbuffs = buff))
  }
  stop("buff not found")
}
