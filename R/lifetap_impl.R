#' Base Implementation of Life Tap
#'
#' @inheritParams shadowbolt_impl
lifetap_impl <- function(manacost, improved_sb_proc) {
  c(0, manacost, 1.5, improved_sb_proc)
}
