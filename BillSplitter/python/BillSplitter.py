#!/usr/bin/env python3
# bill_splitter.py

class BillSplitter(object):
    """
    Divides total into
    """
    def __init__(self, total, people):
        self.total = round(self._toFloat(total), 2)
        self.people = self._toInt(people)

    def _toFloat(self, num):
        """
        Returns floating point number value
        """
        num = self._stripChars(num)
        return float(num)

    def _toInt(self, num):
        """
        Returns integer value
        """
        num = self._stripChars(num)
        return int(num)

    def _stripChars(self, num):
        """
        Returns only digits and decimal points
        This gets rid of dollar signs, commas, etc.

        in  --> $1,234.56
        out --> 1234.56
        """
        valid_chars = "0123456789."
        return "".join([n for n in num if n in valid_chars])

    def _sortUnevenTotal(self, share_list, person_index, incr=0.01):
        share_list[person_index] += incr
        person_index += 1
        if person_index < len(share_list):
            return share_list, person_index
        else:
            return share_list, 0

    def calculate(self):
        print(f"Dividing total of ${self.total:,.2f} into {self.people} pieces:")
        share = round(self.total / self.people, 2)
        share_list = [share for _ in range(self.people)]
        total = round(sum(share_list), 2)
        person_index = 0
        while total != self.total:
            if self.total - total < 0:
                share_list, person_index = self._sortUnevenTotal(share_list, person_index, incr=-0.01)
            else:
                share_list, person_index = self._sortUnevenTotal(share_list, person_index)
            total = round(sum(share_list), 2)
        for num in range(self.people):
            print(f"Person {num+1} will pay ${share_list[num]:,.2f}")
