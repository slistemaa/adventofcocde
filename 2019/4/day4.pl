#!/usr/bin/perl
open(INFILE,"<$ARGV[0]") || die;
while(<INFILE>) {
  $totala = 0;
  $totalb = 0;
  chomp;
  ($start,$end) = split(/-/);
  for($i=$start;$i<=$end;++$i) {
    $test1 = 0;
    $test2 = 0;
    $test3 = 0;
    @elements = split(//,$i);
    #test1
    for($j=0;$j<=$#elements;++$j) {
      #test1
      if ( ($elements[$j] eq $elements[$j+1]) || (($j-1 >=0) && ($elements[$j] eq $elements[$j-1]))) {
        $test1++;
      }
      #test2
      if ( ($j+1 <= $#elements) && ($elements[$j+1] >= $elements[$j]) ) {
        $test2++;
      }

      # Got this from a sub-reddit.  Need to investigate further...
      # https://www.reddit.com/r/perl/comments/e637e4/regex_for_matching_sequences_of_the_same_digit/
      if ( $i =~ /(?:^|(?<=(\d))(?!\1))((\d)\3(?!\3))/g ) {
        $test3++;
      }  
    }
    if ($test1 && $test2 eq "5") {
      $totala++;
    }
    if ($test1 && $test2 eq "5" && $test3) {
      $totalb++;
    }
  }
  print("TOTAL PART A: $totala \n");
  print("TOTAL PART B: $totalb \n");
}

exit;
