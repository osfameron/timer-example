package MyApp::Test;
use Moose;
extends 'MyApp';

our $VERSION = 0.001;

# for tests, we override the DSN (this will eventually use migrations)
has dsn => (
    is => 'ro',
    isa => 'Str',
    value => 'dbi:Pg:dbname=myapp_test',
);

1;

=head1 NAME
 
MyApp - playing with OX and DBIx::Class::Migration
 
=head1 AUTHOR
 
Hakim
 
=head1 SEE ALSO
 
L<DBIx::Class::Migration>
 
=head1 COPYRIGHT & LICENSE
 
Copyright 2013 Hakim
 
This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
 
=cut
