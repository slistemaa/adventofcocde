#!/usr/bin/perl
open(INFILE,"<$ARGV[0]") || die;
my($wirecount) = 0;
my($allcount) = 0;
while(<INFILE>) {
  my(@grid) = ();
  chomp;
  @elements = split(/\,/);
  $x = 0;
  $y = 0;
  for($i=0;$i<=$#elements;++$i) {
    $mydir = substr($elements[$i],0,1);
    $mycount = substr($elements[$i],1,);
    if ( $mydir eq "R" ) {
      for($j=$x;$j<$x+$mycount;++$j) {
        push(@grid,"$j,$y");
      }
      $x = $j;
    }
    elsif ( $mydir eq "L" ) {
      for($j=$x;$j>$x-$mycount;--$j) {
        push(@grid,"$j,$y");
      }
      $x = $j;
    }
    elsif ( $mydir eq "U" ) {
      for($j=$y;$j<$y+$mycount;++$j) {
        push(@grid,"$x,$j");
      }
      $y = $j;
    }
    elsif ( $mydir eq "D" ) {
      for($j=$y;$j>$y-$mycount;--$j) {
        push(@grid,"$x,$j");
      }
      $y = $j;
    }
  }
  %seen=();
  @unique = grep { ! $seen{$_} ++ } @grid;
  $tmpwire{$wirecount} = [@unique];
  $wirecount++;
  for($z=0;$z<=$#unique;++$z) {
    $final[$allcount] = $unique[$z];
    $allcount++;
  }
}
close(INFILE);

@part1 = ();
$hash{$_}++ for @final;
for (sort keys %hash) {
  if ( $hash{$_} > 1 ) {
    ($x,$y) = split(/\,/,$_);
    $mdist = abs($x) + abs($y);
    push(@part1,$mdist) if ( $mdist) ;
    push(@intersections,"$x,$y");
  }
}
@sorted = sort { $a <=> $b } @part1;
print("Part 1: $sorted[0]\n");

@part2 = ();
for($i=0;$i<=$#intersections;++$i) {
  $totalsteps = 0;
  for(sort keys %tmpwire) {
    $step = 0;
    for $j ( 0 .. $#{ $tmpwire{$_} } ) {
      if ( $intersections[$i] eq $tmpwire{$_}[$j] ) {
        last;
      }
      else {
        $step++;
      }
    }
    $totalsteps += $step;
  }
  push(@part2,$totalsteps) if ($totalsteps);
}
@sorted = sort { $a <=> $b } @part2;
print("Part 2: $sorted[0]\n");
exit;
