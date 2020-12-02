#!/usr/bin/perl -w
use strict;
use POSIX;
my $prefuel;
my $totalfuel;
my $part1fuel;
my $part2fuel;
open(INFILE,"<input.txt") || die;
while(<INFILE>) {
  chomp;
  $prefuel = &calc_fuel($_);
  $part1fuel += $prefuel;
  $totalfuel = 0;
  while ($prefuel > 0) {
    $totalfuel += $prefuel;
    $prefuel = &calc_fuel($prefuel);
  }
  $part2fuel += $totalfuel;
}
print "PART 1: $part1fuel\n";
print "PART 2: $part2fuel\n";
exit;

sub calc_fuel() {
  my $tmpinput = shift;
  return(int(floor($tmpinput/3.)) - 2);
}
