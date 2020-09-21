package BillSplitter;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $self = bless { total => $args->{total}, people => $args->{people}, person_index => 0, }, $class;
}

sub round {
  my ($self, $num) = @_;
  return sprintf "%.2f" , $num;
}

sub sum {
  my ($self, @arr) = @_;
  my $total = 0;
  foreach (@arr){
    $total += $_;
  }
  return $total;
}


sub sortUnevenTotal {
  my ($self, $mod, @share_list) = @_;
      my $incr = $mod * 0.01;
      $share_list[$self->{person_index}] += $incr;
      $self->{person_index} += 1;
      if ($self->{person_index} >= $self->{people}) {
        $self->{person_index} = 0;
      }
      return @share_list;
}

sub calculate {
    my $self = shift;
    printf "Dividing total %.02f into %d pieces:\n", $self->{total}, $self->{people};
    my $share = $self->round($self->{total} / $self->{people});
    my @share_list;

    for (my $i = 0; $i < $self->{people}; $i++) {
        push @share_list, $share;
    }

    my $total = $self->round($self->sum(@share_list));

    while ($total != $self->{total}) {
        my $diff = $self->{total} - $total;
        if ($self->{total} - $total < 0) {
            @share_list = $self->sortUnevenTotal(-1, @share_list);
          } else {
            @share_list = $self->sortUnevenTotal(1, @share_list);
          }
        $total = $self->round($self->sum(@share_list));
    }

    for (my $num = 0; $num < $self->{people}; $num++) {
      printf "Person %i will pay \$%.2f\n", $num + 1, $share_list[$num];
    }
}

1;
