use strict;
use Test::Most;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

eq_or_diff
    data_camelize(
        keys_only => 1,
        lcfirst   => 1,
        {
            first_var => {
                array_var => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        firstVar => {
            arrayVar => [qw(foo_bar BatzBar foo)]
        }
    },
    "keys_only with lcfirst camelize keys only";

done_testing;
