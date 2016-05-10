use strict;
use Test::More;
use Test::Warnings;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

ok
    __PACKAGE__->can('data_camelize'),
    'data_camelize exported';

ok
    __PACKAGE__->can('data_decamelize'),
    'data_decamelize exported';

done_testing;
