#' Execute a Stat Function Call
#'
#' This is a wrapper around `do.call` for stat input taking care of cleaning and
#' formatting.
#'
#' @inheritParams base::do.call
#'
#' @export
#'
#' @examples
#' do_call_stats(
#'   args = list(
#'     list(int = 5, sp = 2, crit = 1),
#'     list(int = 2, sp = 3, hit = 1)
#'   ),
#'   what = `-`
#' )
do_call_stats <- function(args, what) {
  as.list(do.call(
    what = what,
    args = lapply(args, function(x) unlist(clean_stats(x)))
  ))
}
