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

  while(time_total < time) {
    if(mana_total < -sb_manacost) {
      time_vec.push_back(1.5);
      time_total += time_vec[row];
      mana_vec.push_back(lt_manacost);
      mana_total += mana_vec[row];
    } else {
      time_vec.push_back(2.5);
      time_total += time_vec[row];
      mana_vec.push_back(sb_manacost);
      mana_total += mana_vec[row];
    }
    row++;
  }

  int n = time_vec.size();
  NumericMatrix mat(n, 4);
  for(int i = 0; i < n; i++) {
    mat(i, 2) = time_vec[i];
    mat(i, 1) = mana_vec[i];
  }
  return mat;
}
