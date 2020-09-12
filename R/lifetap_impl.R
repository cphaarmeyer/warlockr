#' Base Implementation of Life Tap
#'
#' @inheritParams shadowbolt_impl
lifetap_impl <- function(mana, improved_sb_proc) {
  c(0, mana, 1.5, improved_sb_proc)
}
