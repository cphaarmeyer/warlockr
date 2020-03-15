#' Compute Mana Cost
#'
#' Computes the mana cost of a spell.
#'
#' @inheritParams shadowbolt
#' @inheritParams lifetap
#' @param spell which spell
#'
#' @export
#'
#' @examples
#' compute_manacost()
compute_manacost <- function(spell = c("shadowbolt", "lifetap"),
                             cataclysm = 2,
                             sp = NA,
                             imp_lifetap = 2) {
  spell <- match.arg(spell)
  switch(spell,
    "shadowbolt" = 370 * (1 - 0.01 * cataclysm),
    "lifetap" = (440 + 0.8 * sp) * (1 + 0.05 * imp_lifetap)
  )
}
