#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
#' @useDynLib warlockr, .registration = TRUE
#' @importFrom Rcpp sourceCpp
## usethis namespace: end
.onUnload <- function(libpath) {
  library.dynam.unload("warlockr", libpath)
}
