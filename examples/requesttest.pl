#!/usr/bin/env perl
use strict;

use lib "/home/andreas/projects/capullo/lib";
use Capullo;

my $app = Capullo->new(
  script_path => "/home/andreas/projects/capullo",
  document_type => "text/html",
  apache_object => shift
);
$app->init();

print "Hallo ".$app->request->get("name", "clean");

