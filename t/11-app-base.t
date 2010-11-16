#!/usr/bin/env perl

use strict;
use warnings;

use FindBin '$Bin';
use lib "$Bin/lib";

use Catalyst::Test 'App';
use Test::More tests => 3;


is( get( '/a' ), 'ok', 'simple response' );

is( get( '/b' ), 'not found', 'default' );

is( get('/user'), 'user-1', 'first user' );

