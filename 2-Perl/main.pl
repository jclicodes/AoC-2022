#!/usr/bin/perl

my %outcomes = (
  "A X" => 4, "A Y" => 8, "A Z" => 3,
  "B X" => 1, "B Y" => 5, "B Z" => 9,
  "C X" => 7, "C Y" => 2, "C Z" => 6
);

my %outcomes_2 = (
  "A X" => 3, "A Y" => 4, "A Z" => 8,
  "B X" => 1, "B Y" => 5, "B Z" => 9,
  "C X" => 2, "C Y" => 6, "C Z" => 7
);

my $sum   = 0;
my $sum_2 = 0;
while (<>) {
  chomp;
  $sum   += $outcomes{$_};
  $sum_2 += $outcomes_2{$_};
}

print "part 1: $sum\n";
print "part 2: $sum_2"
