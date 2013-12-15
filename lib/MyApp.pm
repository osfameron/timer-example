package MyApp;
use OX;
use MyApp::Schema;

our $VERSION = 0.001;

has dsn => (
    is => 'ro',
    isa => 'Str',
    value => 'dbi:Pg:dbname=myapp',
);

has connect_info => (
    is => 'ro',
    isa => 'ArrayRef',
    dependencies => ['dsn'],
    block => sub {
        [ shift->param('dsn') ]
    },
);

has model => (
    is => 'ro',
    isa => 'MyApp::Schema',
    dependencies => ['connect_info'],
    lifecycle => 'Singleton',
    block => sub {
        MyApp::Schema->connect( @{ shift->param('connect_info') } );
    },
);

has root_controller => (
    is    => 'ro',
    isa   => 'MyApp::Controller::Root',
    infer => 1,

);

has view => (
    is => 'ro',
    isa => 'Text::Xslate',
    dependencies => {
        cache_dir => 'cache_dir',
        path      => 'template_root',
    },
);

has cache_dir     => ( is => 'ro' , isa => 'Str' , required => 1, default => 'cache_dir' );
has template_root => ( is => 'ro' , isa => 'Str' , required => 1, default => 'templates' );

router as {
    route '/'       => 'root_controller.index';
};

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
