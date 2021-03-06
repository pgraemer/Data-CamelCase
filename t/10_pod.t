#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin;

eval {
    require Test::Pod;
    Test::Pod->import;
};

plan skip_all => 'Test::Pod 1.14 required' if $@;
plan skip_all => 'set TEST_POD to enable this test' unless $ENV{TEST_POD};

all_pod_files_ok(all_pod_files());
