#include <iostream>
#include <iomanip>
#include <vector>
#include <cmath>
#include "BillSplitter.h"
using namespace std;

BillSplitter::BillSplitter (double total, uint people) {
  this->total = this->round(total);
  this->people = people;
  this->person_index = 0;
}

void BillSplitter::calculate() {
  cout << "Dividing total of $" << fixed << setprecision(2) << this->total << " into " << this->people << " pieces:" << endl;

  double share = this->round(this->total / this->people);
  vector<double> share_list;

  for (uint i = 0; i < this->people; i++) {
    share_list.push_back(share);
  }

  double total = this->round(this->sum(share_list));

  while ( !(this->areEqual(total, this->total)) ) {
      if (this->total - total < 0) {
          this->sortUnevenTotal(share_list, -0.01);
      } else {
          this->sortUnevenTotal(share_list, 0.01);
      }
      total = this->round(this->sum(share_list));
  }

  for (uint num = 0; num < this->people; num++) {
    cout << "Person " << num + 1 << " will pay $" << fixed << setprecision(2) << this->round(share_list.at(num)) << endl;
  }
}

void BillSplitter::sortUnevenTotal(vector<double> &share_list, double incr) {
  share_list.at(person_index) += incr;
  this->person_index++;
  if (person_index >= share_list.size()) {
    this->person_index = 0;
  }
}

bool BillSplitter::areEqual(double var1, double var2) {
  if (abs(var1 - var2) < 0.009999) {
    return true;
  } else {
    return false;
  }
}

double BillSplitter::sum(vector<double> arr) {
  double total = 0.0;
  for (uint i = 0; i < arr.size(); i++) {
    total += arr.at(i);
  }
  return total;
}

double BillSplitter::round(double num) {
  double value = (int)(num * 100 + .5);
  return (double)value / 100;
}
