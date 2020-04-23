#' Base Implementation Simulate Boss Fight with Rcpp
#'
#' @inheritParams sim_boss_impl
#'
#' @export
sim_boss_cpp <- function(mana, mp5, sp, sb_dmg, sb_miss, sb_crit, curse_miss,
                         sb_manacost, lt_manacost, time, sp_bonus = NULL) {
  sim_data <- sim_boss_loop(
    mana, mp5, sb_dmg, sb_miss, sb_crit,
    curse_miss, sb_manacost, lt_manacost, time
  )
  sb <- sim_data[sim_data[, 3] == 2.5, ]
  nsb <- nrow(sb)
  if (!is.null(sp_bonus)) {
    rows <- lapply(lengths(sp_bonus), sample.int, n = nsb)
    lst <- lapply(names(sp_bonus), function(x) {
      out <- double(nsb)
      out[rows[[x]]] <- sp_bonus[[x]]
      out
    })
    sp <- sp + do.call(`+`, lst)
  }
  dmg <- shadowbolt_dmg(
    sb[, 1], sp, sb_miss[seq_len(nsb)], sb_crit[seq_len(nsb)],
    improved_sb_proc = c(0, sb[, 4][-nsb])
  )
  stats_total <- c(sum(dmg), sum(sim_data[, 2], mana), sum(sim_data[, 3]), 0)
  stats_total[4] <- stats_total[1] / stats_total[3]
  stats_total
}
