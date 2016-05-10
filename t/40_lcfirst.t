use strict;
use Test::Most;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

eq_or_diff
    data_camelize(
        lcfirst => 1,
        {
            lc_first => {
                array_var => [qw(foo_bar BatzBar foo)]
            },
        }
    ),
    {
        lcFirst => {
            arrayVar => [qw(fooBar batzBar foo)]
        }
    },
    "first char upper option camelize";

eq_or_diff
    data_decamelize(
        {
            lcFirst => {
                arrayVar => [qw(fooBar batzBar foo)]
            },
        }
    ),
    {
        lc_first => {
            array_var => [qw(foo_bar batz_bar foo)]
        }
    },
    "first char upper optino decamelize";

done_testing;
