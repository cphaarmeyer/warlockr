#' Warlock Talents
#'
#' Creates a list with all the relevant warlock talents.
#' The default is the standard built.
#'
#' @param devastation number of talent points in devastation
#' @param ruin number of talent points in ruin
#' @param improved_sb number of talent points in improved shadow bolt
#' @param cataclysm number of talent points in cataclysm
#' @param bane number of talent points in bane
#' @param shadow_mastery number of talent points in shadow mastery
#' @param demonic_sacrifice whether succubus was sacrificed
#' @param imp_lifetap number of talent points in improved life tap
#' @param suppression number of talent points in suppression
#' @param curse_of_shadows whether curse of shadows is on target
#'
#' @export
#'
#' @examples
#' warlock_talents()
warlock_talents <- function(devastation = 5,
                            ruin = 1,
                            improved_sb = 5,
                            cataclysm = 2,
                            bane = 5,
                            shadow_mastery = 0,
                            demonic_sacrifice = 1,
                            imp_lifetap = 2,
                            suppression = 2,
                            curse_of_shadows = 1) {
  list(
    devastation = devastation,
    ruin = ruin,
    improved_sb = improved_sb,
    cataclysm = cataclysm,
    bane = bane,
    shadow_mastery = shadow_mastery,
    demonic_sacrifice = demonic_sacrifice,
    imp_lifetap = imp_lifetap,
    suppression = suppression,
    curse_of_shadows = curse_of_shadows
  )
}
