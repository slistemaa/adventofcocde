#!/usr/bin/perl -w
use strict;

open(INFILE,"<$ARGV[0]") || die;
while(<INFILE>) {
  chomp;
  my @elements = split(/\,/,$_);
  my @origelements = @elements;
  for(my $noun=0;$noun<=99;++$noun) {
    for(my $verb=0;$verb<=99;++$verb) {
      @elements = @origelements;
      $elements[1] = $noun;
      $elements[2] = $verb;
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
      if ( $elements[0] == "19690720" ) {
        my $res = 100 * $noun + $verb;
        print("RESULT: $res\n");
      }
    }
  }
}
close(INFILE);
exit;
