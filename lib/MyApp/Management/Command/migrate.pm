package MyApp::Management::Command::migrate;
use Moose;
use MyApp;
use MyApp::Management -command;
use DBIx::Class::Migration::Script;

sub execute {
    my ($self, $opt, $args) = @_;

    shift @ARGV;

    my $app = MyApp->new;

    my $script = 'DBIx::Class::Migration::Script';
    $script->new_with_options(
        $script->_defaults, 
        schema => $app->model)->run;
}

1;
