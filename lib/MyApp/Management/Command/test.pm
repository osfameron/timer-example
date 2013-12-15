package MyApp::Management::Command::test;
use Moose;
use MyApp;
use MyApp::Management -command;
use App::ForkProve;

sub description {
    'wrapper around prove';
}

sub execute {
    my ($self, $opt, $args) = @_;

    shift @ARGV;

    $ENV{PERL_FORKPROVE_IGNORE} = 'no-preload';
    App::ForkProve->run(
        '-Mt::Preload',
        @ARGV,
        '-lr',
        't',
    );
}

=head1 NAME

MyApp::Management::Command::test - Run Tests

=head1 DESCRIPTION

    bin/manage test

This script is a thin wrapper around App::ForkProve.  We do the following:

 * run all tests in t/
     * and recursively
 * Preload the following large modules:
        OX (and family)
        Test::Most
        DBIx::Class
        DBD::Pg
        Text::Xslate
 * but not for any tests whose name includes `no-preload`
 * include lib/ in the path

    perldoc forkprove  # to see the options for the script

If any tests error, you can run them individually to see what happened with

    perl -Ilib t/foo.t
    perl -Ilib -MTest::Pretty  t/foo.t   # prettier tests

=cut

1;
