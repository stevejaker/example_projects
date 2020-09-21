#include <iostream>
#include <string>
#include <vector>
using namespace std;

#ifndef BILLSPLITTER_H
#define BILLSPLITTER_H

class BillSplitter {
  public:
    BillSplitter (double total, uint people);
    void calculate();

  private:
    void sortUnevenTotal(vector<double> &share_list, double incr);
    double round(double num);
    double sum(vector<double> arr);
    bool areEqual(double var1, double var2);
    uint people;
    uint person_index;
    double total;
};

#endif
