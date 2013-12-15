package MyApp::Controller::Root;
use Moose;
extends 'MyApp::Controller';

has title => (
    is => 'ro',
    isa => 'Str',
    default => 'My App yeah!',
);

1;
