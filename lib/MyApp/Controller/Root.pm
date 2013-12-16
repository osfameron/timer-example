package MyApp::Controller::Root;
use Moose;
extends 'MyApp::Controller';

has title => (
    is => 'ro',
    isa => 'Str',
    default => 'My App yeah!',
);

sub index {
  my( $self , $req ) = @_;

  return $self->render( 'index.tx' , {
    title => $self->title ,
    count => $self->model->resultset('Timer')->count,
    # user  => $req->session->{user_id} ,
  });
}

1;
