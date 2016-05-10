#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::EOL;

use FindBin;

all_perl_files_ok(
    {
        trailng_whitespace => 1
    },
    $FindBin::Bin.'/../lib',
    $FindBin::Bin.'/../t',
    $FindBin::Bin.'/../Build.PL'
);
