
#include <sstream>
#include <vector>
#include "BillSplitter.h"
using namespace std;

int main(int argc, char *argv[]) {
	if (argc < 3) {
		cout << "InvalidEntry: Not enough arguments provided" << endl;
		return 1;
	}

	double total;
	int people;

	istringstream arg1(argv[1]);
	if (!(arg1 >> total)) {
	  cerr << "Invalid number: " << argv[1] << endl;
	}

	istringstream arg2(argv[2]);
	if (!(arg2 >> people)) {
	  cerr << "Invalid number: " << argv[2] << endl;
	}

	BillSplitter splitter(total, people);
	splitter.calculate();

	return 0;
}
