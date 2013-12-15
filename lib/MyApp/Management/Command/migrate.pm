package MyApp::Management::Command::migrate;
use Moose;
use MyApp;
use MyApp::Management -command;
use DBIx::Class::Migration::Script;

sub description {
    'wrapper around dbic-migrate which handles passing schema in from app config';
}

sub execute {
    my ($self, $opt, $args) = @_;

    shift @ARGV;

    my $app = MyApp->new;

    my $script = 'DBIx::Class::Migration::Script';
    $script->new_with_options(
        $script->_defaults, 
        schema => $app->model)->run;
}

=head1 NAME

MyApp::Management::Command::migrate - manage DB migrations

=head1 DESCRIPTION

    bin/manage migrate prepare
    bin/manage migrate install
    # etc.

This script is a wrapper around dbic-migrate, but also passes the schema from
the OX application as default.

    bin/manage migrate help  # to see the options for the script

=cut

1;
