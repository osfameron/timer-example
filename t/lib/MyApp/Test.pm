package MyApp::Test;
use OX;
extends 'MyApp';

our $VERSION = 0.001;

has dsn => (
    is => 'ro',
    isa => 'Str',
    block => sub {
        my ($s, $self) = @_;
        return $ENV{MYAPP_TEST_DSN} || $self->test_postgresql->dsn;
        # $ENV{MYAPP_TEST_DSN} || 'dbi:Pg:dbname=myapp_test';
    },
);

has test_postgresql => (
    is => 'ro',
    isa => 'Test::PostgreSQL',
    lifecycle => 'Singleton',
);

has migration => (
    is => 'ro',
    isa => 'DBIx::Class::Migration',
    dependencies => {
        schema => 'model',
    },
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
