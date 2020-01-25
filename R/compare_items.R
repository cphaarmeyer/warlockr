#' Compare Two Items
#'
#' Simulates dps with current stats and with new stats to compare them.
#'
#' @inheritParams sim_dps
#' @param items list where each element indicates the stat changes by an item
#'
#' @return a data frame with current dps, new dps and difference
#' @export
#'
#' @examples
#' compare_items(2, 1, 277, 346, 0,
#'   items = list(
#'     new_item1 = list(crit = -1, hit = 1),
#'     new_item2 = list(int = 5, sp = 3)
#'   ),
#'   iter = 1000
#' )
compare_items <- function(crit, hit, int, sp, mp5, items, timeframe = c(45, 150), iter = 50000) {
  seed <- sample(1:1000, 1)
  to_0 <- function(x) if (is.null(x)) 0 else x
  current <- sim_dps(crit, hit, int, sp, mp5, NULL, timeframe, iter, seed)
  simulations <- lapply(items, function(x) {
    sim_dps(
      crit + to_0(x$crit), hit + to_0(x$hit), int + to_0(x$int), sp + to_0(x$sp), mp5 + to_0(x$mp5),
      NULL, timeframe, iter, seed
    )
  })
  dps <- mean(current[, 4])
  new_dps <- vapply(c(list(current = current), simulations), function(x) mean(x[, 4]), FUN.VALUE = 0)
  data.frame(dps = new_dps, diff = new_dps - dps)
}
