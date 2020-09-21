const BillSplitter = require("./BillSplitter.js");

if (process.argv.length < 4) {
  console.log("InvalidEntry: Not enough arguments provided");
  process.exit();
}

var total = process.argv[2];
var people = process.argv[3];

let splitter = new BillSplitter(total, people);
splitter.calculate();
