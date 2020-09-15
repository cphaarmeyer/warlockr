#' Execute a Stat Function Call
#'
#' This is a wrapper around `do.call` for stat input taking care of cleaning and
#' formatting.
#'
#' @inheritParams base::do.call
#'
do_call_stats <- function(args, what) {
  as.list(do.call(
    what = what,
    args = lapply(args, function(x) unlist(clean_stats(x)))
  ))
}
