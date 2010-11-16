package App::Model::Simple;

use Moose;

extends 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config({
	schema_class => 'App::Schema',
	connect_info => {
		dsn => 'dbi:SQLite:dbname=' . App->path_to('db')
	},
});


__PACKAGE__->meta->make_immutable;

1;

