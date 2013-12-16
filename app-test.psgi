use lib qw(./lib ./t/lib);
use MyApp::Test;

my $app = MyApp::Test->new;
$app->migration->install;
$app->to_app;
