package Data::CamelCase;

use strict;
use warnings;
use String::CamelCase qw(camelize decamelize);

our $VERSION = '0.01';

use base qw(Exporter);
our @EXPORT_OK = qw(data_camelize data_decamelize);

our $lcfirst_key    = sub { shift };
our $lcfirst_var    = sub { shift };
our $camelize_key   = sub { camelize shift };
our $camelize_var   = sub { camelize shift };
our $decamelize_key = sub { decamelize shift };
our $decamelize_var = sub { decamelize shift };

sub data_camelize {
    my $struct  = pop;
    my %options = @_;
    local ($lcfirst_key, $lcfirst_var)  = (sub { lcfirst shift }) x2 if $options{lcfirst};
    local ($camelize_var, $lcfirst_var) = (sub { shift })         x2 if $options{keys_only};
    local ($camelize_key, $lcfirst_key) = (sub { shift })         x2 if $options{vars_only};
    return
        ref $struct eq 'HASH'
            ?
                {
                    map {
                        $lcfirst_key->($camelize_key->($_)) => data_camelize( $struct->{$_} );
                    }
                    keys %{$struct}
                }
            :
                ref $struct eq 'ARRAY'
                    ? [ map { data_camelize($_) } @{$struct} ]
                    : $lcfirst_var->($camelize_var->( $struct ));
}

sub data_decamelize {
    my $struct  = pop;
    my %options = @_;
    local $decamelize_var = sub { shift } if $options{keys_only};
    local $decamelize_key = sub { shift } if $options{vars_only};
    return
        ref $struct eq 'HASH'
            ?
                {
                    map {
                        $lcfirst_key->($decamelize_key->($_)) => data_decamelize( $struct->{$_} );
                    }
                    keys %{$struct}
                }
            :
                ref $struct eq 'ARRAY'
                    ? [ map { data_decamelize($_) } @{$struct} ]
                    : $lcfirst_var->($decamelize_var->($struct));
}

1;

__END__

=encoding utf-8

=head1 NAME

Data::CamelCase - camelize data structures recursive

=head1 SYNOPSIS

  use Data::CamelCase qw(data_camelize data_decamelize)
  my $camelized = data_camelize(%opts, { foo_bar => [qw(bar camel_case)]);
  # Result:
  # { FooBar => ['bar', 'CamelCase'] }
  my $decamelized = data_decamelize(%opts, $camelized);
  # Result:
  # { foo_bar => ['bar', 'camel_case'] }

=head1 DESCRIPTION

Data::CamelCase is

=head1 METHODS

=head2 data_camelize(%opts, $ref)

camelizes a data structure

options: keys_only, vars_only, lcfirst

=head2 data_decamelize(%opts, $ref)

decamelize a data structure

options: keys_only, vars_only

=head1 AUTHOR

Patrick Grämer E<lt>pgraemer@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2016- Patrick Grämer

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<String::Camelize>

=cut
