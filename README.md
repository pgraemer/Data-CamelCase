[![Build Status](https://travis-ci.org/pgraemer/Data-CamelCase.svg?branch=master)](https://travis-ci.org/pgraemer/Data-CamelCase)

# NAME

Data::CamelCase - camelize data structures recursive

# SYNOPSIS

```perl
use Data::CamelCase qw(data_camelize data_decamelize)
my $camelized = data_camelize(%opts, { foo_bar => [qw(bar camel_case)]);
# Result:
# { FooBar => ['bar', 'CamelCase'] }
my $decamelized = data_decamelize(%opts, $camelized);
# Result:
# { foo_bar => ['bar', 'camel_case'] }
```

# DESCRIPTION

Data::CamelCase is

# METHODS

## data\_camelize(%opts, $ref)

camelizes a data structure

options: keys\_only, vars\_only, lcfirst

## data\_decamelize(%opts, $ref)

decamelize a data structure

options: keys\_only, vars\_only

# AUTHOR

Patrick Grämer &lt;pgraemer@cpan.org>

# COPYRIGHT

Copyright 2016- Patrick Grämer

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[String::Camelize](https://metacpan.org/pod/String::Camelize)
