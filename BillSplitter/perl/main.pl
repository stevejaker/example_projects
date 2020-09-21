use BillSplitter;

use strict;
use warnings;

if ($#ARGV < 1) {
  die "Not enough arguments provided\n"
}

my $total  = $ARGV[0];
my $people = $ARGV[1];

my $splitter = BillSplitter->new({ total => $total, people => $people});
$splitter->calculate();
