package MyApp::Controller;
use Moose;

has title => (
  is  => 'ro' ,
  isa => 'Str'
);

has model => (
  is       => 'ro' ,
  isa      => 'MyApp::Schema',
  # handles  => [ qw/ load_user_from_session / ] ,
  required => 1 ,
);

has view => (
  is       => 'ro' ,
  isa      => 'Text::Xslate' ,
  handles  => [ qw/ render / ] ,
  required => 1 ,
);

1;
