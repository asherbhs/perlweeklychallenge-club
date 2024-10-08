#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 285 Task 1: No Connection
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( unpairs first );

sub no_connection( $routes ) {
    # Store all given routes in a hash ( from => to ).
    my %connections = unpairs $routes->@*;
    # Return the first destination node that does not have a route going out of it.
    return first { ! exists $connections{$_} } values %connections;
}

use Test2::V0 qw( -no_srand );
is no_connection( [["B", "C"], ["D", "B"], ["C", "A"]] ), "A",
    'Example 1: no_connection( [["B", "C"], ["D", "B"], ["C", "A"]] ) == "A"';
is no_connection( [["A", "Z"]] ), "Z",
    'Example 2: no_connection( [["A", "Z"]] ) == "Z"';
done_testing;
