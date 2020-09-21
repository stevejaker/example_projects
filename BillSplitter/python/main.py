#!/usr/bin/env python3

import sys
from BillSplitter import BillSplitter
from errors import InvalidEntry

if __name__ == '__main__':
    if len(sys.argv) < 3:
        raise InvalidEntry("Not enough arguments provided")
    splitter = BillSplitter(sys.argv[1], sys.argv[2])
    splitter.calculate()
