package App::Controller::Root;

use Moose;

BEGIN { extends 'Catalyst::Controller' }


__PACKAGE__->config( namespace => '' );


sub a :Local :Args(0) {
	my ( $self, $c ) = @_;

	$c->res->body('ok');
}

sub user :Local :Args(0) {
	my ( $self, $c ) = @_;

	$c->res->body( $c->model('Simple::User')->search(1)->first->name );
}

sub index :Path :Args(0) {
	my ( $self, $c ) = @_;

	$c->res->body( $c->widget('+CatalystX::Widget::Paginator',
		rs => 'Simple::User',
		%{ $c->req->params },
	));
}

sub main :Local :Args(0) {
	my ( $self, $c ) = @_;

	$c->res->body( $c->widget('+CatalystX::Widget::Paginator',
		rs => 'Simple::User',
		main => 3,
	) ."\n" );
}

sub side :Local :Args(0) {
	my ( $self, $c ) = @_;

	$c->res->body( $c->widget('+CatalystX::Widget::Paginator',
		rs => 'Simple::User',
		side => 0,
	) ."\n" );
}

sub default :Private {
    my ( $self, $c ) = @_;

    $c->res->body('not found');
    $c->res->status(404);
}

__PACKAGE__->meta->make_immutable;

1;

