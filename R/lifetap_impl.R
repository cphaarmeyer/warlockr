#' Base Implementation of Life Tap
#'
#' @inheritParams shadowbolt_impl
lifetap_impl <- function(mana, improved_sb_proc) {
  c(dmg = 0, mana = mana, time = 1.5, proc = improved_sb_proc)
}
