#include <Rcpp.h>
using namespace Rcpp;

//' Simulate the Loop for a Boss Fight
//'
//' @inheritParams sim_boss_impl
//'
//' @export
// [[Rcpp::export]]
NumericMatrix sim_boss_loop(int mana, int mp5, NumericVector sb_dmg,
                            LogicalVector sb_miss, LogicalVector sb_crit,
                            LogicalVector curse_miss, double sb_manacost,
                            double lt_manacost, double time) {
  NumericMatrix mat(10, 4);
  return mat;
}
