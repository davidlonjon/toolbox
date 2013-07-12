#!/usr/bin/perl
# Sorting commits by commit message line count / changed lines ratio
# Currently not working
# Taken from https://git.wiki.kernel.org/index.php/ExampleScripts

use strict;

sub count_lines_in_message ($) {
        my $sha1 = $_[0];
        open COMMIT, "git cat-file -p $sha1 |" or die;
        my $header = 1;
        my $count = 0;
        while (<COMMIT>) {
                if (!$header) {
                        $count++;
                } elsif (/^$/) {
                        $header = 0;
                }
        }
        close(COMMIT);
        return $count;
}

sub count_changed_lines ($) {
        my $sha1 = $_[0];
        open DIFF, "git diff $sha1^..$sha1 |" or die;
        $count = 0;
        while (<DIFF>) {
                if (/^[\+\-]/ && !/^(\+\+\+|---)/) {
                        $count++;
                }
        }
        close(DIFF);
        return $count;
}

my @commits;

open IN, "git rev-list --no-merges next |" or die;
while (<IN>) {
        if (/^([0-9a-f]{40})/) {
                my $commit = $1;
                my $count_message = count_lines_in_message($commit);
                my $count_diff = count_changed_lines($commit);
                if ($count_diff == 0) {
                        $ratio = 1e9;
                } else {
                        $ratio = $count_message / $count_diff;
                }
                push(@commits, {
                        ratio => $ratio,
                        sha1 => $commit,
                        message => $count_message,
                        diff => $count_diff
                });
        }
}

@commits = sort {$b->{ratio} cmp $a->{ratio} } @commits;

foreach my $c (@commits) {
        print substr($c->{sha1}, 0, 8) . "... " . $c->{message} . " / "
                . $c->{diff} . " = " . $c->{ratio} . "\n";
}