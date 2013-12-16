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

    # if right-hand argument is a file, then assume we are running a single test
    if (@ARGV and -f $ARGV[-1]) {

        # oddly -t STDOUT is suppressed at some point in exec'd test, so
        # we override for Test::Pretty's benefit
        $ENV{PERL_TEST_PRETTY_ENABLED}++; 
        
        system( 'perl',
            '-MTest::Pretty', # run pretty tests
            '-Ilib',          # add ./lib
            '-It/lib',        # add ./t/lib
            @ARGV,
        );
    }

    # otherwise we run a recursive 'prove' over 't' or a subdirectory
    else {
        $ENV{PERL_FORKPROVE_IGNORE} = 'no-preload';
        App::ForkProve->run(
            '-l',           # add ./lib
            '-It/lib',      # add ./t/lib
            '-MPreload',    # pre-load common modules for speed
            '-r',           # run recursively
            @ARGV,
        );
    }
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

    bin/manage test t/foo.t

=cut

1;
