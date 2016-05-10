#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
eval {
    require Test::Pod::Coverage;
    Test::Pod::Coverage->VERSION('1.04');
    Test::Pod::Coverage->import;
};
plan skip_all => "Test::Pod::Coverage 1.04 required for testing POD coverage" if $@;
plan skip_all => "set TEST_POD to enable this test " unless $ENV{TEST_POD};
all_pod_coverage_ok();
