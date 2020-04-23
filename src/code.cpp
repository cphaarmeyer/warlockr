#include <Rcpp.h>
using namespace Rcpp;

//' Simulate the Loop for a Boss Fight
//'
//' @inheritParams sim_boss_impl
//'
//' @export
// [[Rcpp::export]]
NumericMatrix sim_boss_loop(double mana, double mp5, NumericVector sb_dmg,
                            LogicalVector sb_miss, LogicalVector sb_crit,
                            LogicalVector curse_miss, double sb_manacost,
                            double lt_manacost, double time) {
  std::vector<double> time_vec(0);
  double time_total = 0.0;
  std::vector<double> mana_vec(0);
  double mana_total = mana;
  int row = 0;

  do {
    time_vec.push_back(1.5);
    time_total += time_vec[row];
    mana_vec.push_back(-200);
    mana_total += mana_vec[row];
    row++;
  } while(curse_miss[row - 1]);

  NumericMatrix mat(10, 4);
  int n = time_vec.size();
  for(int i = 0; i < n; i++) {
    mat(i, 2) = time_vec[i];
    mat(i, 1) = mana_vec[i];
  }
  return mat;
}
