#include <Rcpp.h>
using namespace Rcpp;

//' Simulate the Loop for a Boss Fight
//'
//' @inheritParams sim_boss_impl
// [[Rcpp::export]]
NumericMatrix sim_boss_loop(double mana, double mp5, NumericVector sb_dmg,
                            LogicalVector sb_miss, LogicalVector sb_crit,
                            LogicalVector curse_miss, double sb_manacost,
                            double lt_manacost, double time) {
  std::vector<double> time_vec(0);
  double time_total = 0.0;
  std::vector<double> mana_vec(0);
  double mana_total = mana + mp5;
  std::vector<double> dmg_vec(0);
  std::vector<int> proc_vec(0);
  int proc = 0;
  double mp5_time = 0;
  int row = 0;
  int sb = 0;

  do {
    time_vec.push_back(1.5);
    time_total += time_vec[row];
    mana_vec.push_back(-200.0);
    mana_total += mana_vec[row];
    dmg_vec.push_back(0.0);
    proc_vec.push_back(0);
    row++;
  } while(curse_miss[row - 1] == TRUE);

  while(time_total < time) {
    if(time_total - mp5_time >= 5.0) {
      mana_total += mp5;
      mp5_time += 5.0;
    }
    if(mana_total < -sb_manacost) {
      time_vec.push_back(1.5);
      time_total += time_vec[row];
      mana_vec.push_back(lt_manacost);
      mana_total += mana_vec[row];
      dmg_vec.push_back(0.0);
      proc_vec.push_back(proc_vec[row - 1]);
    } else {
      time_vec.push_back(2.5);
      time_total += time_vec[row];
      mana_vec.push_back(sb_manacost);
      mana_total += mana_vec[row];
      dmg_vec.push_back(sb_dmg[sb]);
      if(!sb_miss[sb] & (proc_vec[row - 1] > 0)) {
        proc = proc_vec[row - 1] - 1;
      }
      if(!sb_miss[sb] & sb_crit[sb]) {
        proc = 4;
      }
      proc_vec.push_back(proc);
      sb++;
    }
    row++;
  }

  NumericMatrix out(row, 4);
  for(int i = 0; i < row; i++) {
    out(i, 0) = dmg_vec[i];
    out(i, 1) = mana_vec[i];
    out(i, 2) = time_vec[i];
    out(i, 3) = proc_vec[i];
  }
  return out;
}
