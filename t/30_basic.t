use strict;
use Test::Most;
BEGIN {
    use_ok('Data::CamelCase', 'data_camelize', 'data_decamelize');
}

my $simple_ref_tests = {
    'simple hashref' => {
        input => {
            foo => 'bar',
            foo_bar => 'foo_bar',
        },
        result => {
            Foo => 'Bar',
            FooBar => 'FooBar',
        }
    },
    'hash of hashes' => {
        input => {
            key_of_hash => {
                sub_key_of_hash => {
                    with_deep_struct => 1,
                    deep_deep => { deeper => 1, more_deeper => 2 },
                }
            }
        },
        result => {
            KeyOfHash => {
                SubKeyOfHash => {
                    WithDeepStruct => 1,
                    DeepDeep => { Deeper => 1, MoreDeeper => 2},
                }
            }
        },
    },
    'with array refs' => {
        input => {
            test_with_arrays => [qw(a_b 2 foo foo_bar)],
            nested_arrays    => [[qw(a_b foo_bar 3)], [qw(b_c bar_bar this)]]
        },
        result => {
            TestWithArrays => [qw(AB 2 Foo FooBar)],
            NestedArrays   => [[qw(AB FooBar 3)], [qw(BC BarBar This)]],
        },
    }
};

for my $test (keys %{$simple_ref_tests}) {
    my $data = $simple_ref_tests->{$test};
    eq_or_diff
        data_camelize($data->{input}),
        $data->{result},
        $test;

    eq_or_diff
        data_decamelize($data->{input}),
        $data->{input},
        "reverse $test";
}

done_testing;
