#!/usr/bin/perl -w
use strict;
my $solutions = &addcol([]);
print "Solutions: " . $solutions . "\n";

sub addcol {
	# All boards passed to addcol are assumed to be good so far
	my $boardref = shift;
	my $newsol = 0;
	my @newboard;

	if (@{$boardref} == 8) {
		# Board is full; it must be a solution
		&printboard($boardref);
		$newsol += 1;
	} else {
		for (my $i = 1; $i <= 8; $i++) {
			if (&leftisgood($i, $boardref)) {
				@newboard = ($i);
				for (my $j = $#$boardref; $j >= 0; $j--) {
					unshift(@newboard, $boardref->[$j]);
				}
				$newsol += &addcol(\@newboard);
			}
		}
	}
	return $newsol;
}

sub leftisgood {
	my $pos = shift;
	my $boardref = shift;

	for (my $i = 0; $i <= $#$boardref; $i++) {
		if ($boardref->[$#$boardref - $i] == $pos) { return 0; }
		if ($boardref->[$#$boardref - $i] == $pos + $i + 1) { return 0; }
		if ($boardref->[$#$boardref - $i] == $pos - $i - 1) { return 0; }
	}
	return 1;
}

sub printboard {
	my $board = shift;
	for (my $y = 8; $y > 0; $y--) {
		for (my $x = 0; $x < 8; $x++) {
			if (exists($board->[$x]) && $board->[$x] == $y) {
				print "[Q]";
			} else {
				print "[ ]";
			}
		}
		print "\n";
	}
	print "\n";
}
