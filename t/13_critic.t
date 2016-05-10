#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Perl::Critic;
use FindBin;

all_critic_ok(
    $FindBin::Bin.'/../lib',
    $FindBin::Bin.'/../t',
);
