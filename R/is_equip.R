#' Is Equip
#'
#' Check if an equipment list has all slots filled.
#' These are head, neck, shoulders, back, chest, wrist, hands, waist, legs,
#' feet, finger1, finger2, trinket1, trinket2 and weapon.
#' Every slot should be filled with a list of the item base stats.
#'
#' @param equip equipment list
#'
#' @return \code{TRUE} or \code{FALSE}
#' @export
is_equip <- function(equip) {
  slots <- c(
    "head", "neck", "shoulders", "back", "chest", "wrist",
    "hands", "waist", "legs", "feet", "finger1", "finger2",
    "trinket1", "trinket2", "weapon", "wand"
  )
  is_unique(names(equip)) & setequal(names(equip), slots)
}

is_unique <- function(x) {
  anyDuplicated(x) == 0
}
