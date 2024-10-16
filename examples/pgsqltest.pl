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

$app->database->setup("pgsql", "127.0.0.1", "postgres", "", "testdb");
if ($app->database->connected()) {
  my @AoH = $app->database->query("select id, username, password from test");
  for (my $run=0;$run<(@AoH);$run++) {
    print $AoH[$run]{id}." - ".$AoH[$run]{username}." - ".$AoH[$run]{password}."<br />";
  }
} else {
  print "there is an error with our database right now, sorry!";
}