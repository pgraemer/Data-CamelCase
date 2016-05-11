#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Perl::Critic;
use FindBin;

plan skip_all => 'set TEST_CRITIC to enable this test' unless $ENV{TEST_CRITIC};

all_critic_ok(
    $FindBin::Bin.'/../lib',
    $FindBin::Bin.'/../t',
);
