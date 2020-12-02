#!/usr/bin/perl -w
use strict;
use POSIX;
my $totfuel;
open(INFILE,"<input.txt") || die;
while(<INFILE>) {
  chomp;
  $totfuel += int(floor($_/3.)) - 2;
}
print "$totfuel\n";
exit;
