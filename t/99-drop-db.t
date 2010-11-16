#!/usr/bin/env perl

use strict;
use warnings;

use FindBin '$Bin';
use lib "$Bin/lib";

use Test::More tests => 1;


my $dbf = File::Spec->catdir($FindBin::Bin, 'lib', 'App', 'db');
unlink $dbf if -f $dbf;

ok(1, 'db dropped');

