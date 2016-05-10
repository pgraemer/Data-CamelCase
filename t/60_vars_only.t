use strict;
use Test::Most;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

eq_or_diff
    data_camelize(
        vars_only => 1,
        {
            first_var => {
                array_var => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        first_var => {
            array_var => [qw(FooBar BatzBar Foo)]
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
    "camelize works correct after vars_only";


eq_or_diff
    data_decamelize(
        vars_only => 1,
        {
            first_var => {
                array_var => [qw(FooBar BatzBar Foo)]
            },
        }
    ),
    {
        first_var => {
            array_var => [qw(foo_bar batz_bar foo)]
        }
    },
    "keys_only decamlize keys only";


done_testing;
