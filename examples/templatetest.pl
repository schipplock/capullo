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

if ($app->template->open("templates/test1.tmpl")) {
  $app->template->passVariables(header => "customer table");
  my @customers = (
    {id => "1", customername => "Larry Wall"},
    {id => "2", customername => "Bill Gates"}
  );
  $app->template->passVariables(customer => \@customers);
  $app->template->render();
} else {
  print "template file not found";
}

