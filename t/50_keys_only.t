use strict;
use Test::Most;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

eq_or_diff
    data_camelize(
        keys_only => 1,
        {
            first_var => {
                array_var => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        FirstVar => {
            ArrayVar => [qw(foo_bar BatzBar foo)]
        }
    },
    "keys_only camelize keys only";

eq_or_diff
    data_camelize(
        {
            first_var => {
                array_var => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        FirstVar => {
            ArrayVar => [qw(FooBar BatzBar Foo)]
        }
    },
    "camelize works after keys_only";

eq_or_diff
    data_decamelize(
        keys_only => 1,
        {
            firstVar => {
                arrayVar => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        first_var => {
            array_var => [qw(foo_bar BatzBar foo)]
        }
    },
    "keys_only decamlize keys only";

done_testing;
