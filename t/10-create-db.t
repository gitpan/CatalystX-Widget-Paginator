#!/usr/bin/env perl

use strict;
use warnings;

use FindBin '$Bin';
use lib "$Bin/lib";

use DBI;
use File::Spec;
use Test::More tests => 1;


my $dbf = File::Spec->catdir($FindBin::Bin, 'lib', 'App', 'db');
unlink $dbf if -f $dbf;
my $dbh = DBI->connect("dbi:SQLite:dbname=$dbf","","", { RaiseError=>1 });

$dbh->do('CREATE TABLE user ( id INTEGER PRIMARY KEY, name TEXT )');
my $sth = $dbh->prepare('INSERT INTO user VALUES(?,?)');
$sth->execute( $_, 'user-' . $_ ) for 1 .. 1_000;

ok(1, 'db created');

