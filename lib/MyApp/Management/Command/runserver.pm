package MyApp::Management::Command::runserver;
use Moose;
use MyApp;
use MyApp::Management -command;
use Plack::Runner;

sub description {
    'wrapper around plackup';
}

sub execute {
    my ($self, $opt, $args) = @_;

    shift @ARGV;

    my $runner = Plack::Runner->new;
    $runner->parse_options(@ARGV);
    if ($runner->{loader} eq 'Restarter') {
        # also watch conf
        $runner->loader->watch( './conf' );
    }
    $runner->run;
}

=head1 NAME

MyApp::Management::Command::runserver - Start up a webserver

=head1 DESCRIPTION

    bin/manage runserver -r

This script is a thin wrapper around plackup.  If a Restarter loader is used,
we also watch the './conf' directory by default.

    bin/manage runserver -h 
    plackup -h  # to see the options for the script

=cut

1;
