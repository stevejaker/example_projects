// bill_splitter.js

class BillSplitter {
  constructor(total, people) {
    this.people = people;
    this.total = total;
    this.person_index = 0;
  }

  _sortUnevenTotal(share_list, incr) {
    share_list[this.person_index] += incr;
    this.person_index++;
    if (this.person_index >= share_list.length) {
      this.person_index = 0;
    }
    return share_list;
  }
  round(number) {
    return Math.round(number * 100) / 100;
  }
  fixed(number) {
    return Number.parseFloat(number).toFixed(2);
  }
  sum(array) {
    var total = 0;
    for (var i = 0; i < array.length; i++) {
      total += array[i];
    }
    return total;
  }
  calculate() {
    console.log(`Dividing total of $${this.fixed(this.total)} into ${this.people} pieces:`)

    var share = this.round(this.total / this.people);
    var share_list = [];

    for (var i = 0; i < this.people; i++) {
      share_list.push(share);
    }

    var total = this.round(this.sum(share_list));

    while ( this.round(total) != this.round(this.total) ) {
        if (this.total - total < 0) {
            this._sortUnevenTotal(share_list, -0.01);
        } else {
            this._sortUnevenTotal(share_list, 0.01);
        }
        total = this.round(this.sum(share_list));
    }

    for (var num = 0; num < this.people; num++) {
      console.log(`Person ${num + 1} will pay $${this.fixed(share_list[num])}`)
    }
  }
}

module.exports = BillSplitter;
