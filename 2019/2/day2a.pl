#!/usr/bin/perl -w
use strict;

open(INFILE,"<$ARGV[0]") || die;
while(<INFILE>) {
  chomp;
  my @elements = split(/\,/,$_);
  $elements[1] = 12;
  $elements[2] = 2;
  for(my $i=0;$i<=$#elements;$i+=4) {
    my $pos1 = $elements[$i+1];
    my $pos2 = $elements[$i+2];
    my $finalpos = $elements[$i+3];
    if ( $elements[$i] == 1 ) {
      $elements[$finalpos] = $elements[$pos1] + $elements[$pos2];
    }
    elsif ( $elements[$i] == 2 ) {
      $elements[$finalpos] = $elements[$pos1] * $elements[$pos2];
    }
  }
  print("$elements[0]\n");
}
close(INFILE);
exit;
