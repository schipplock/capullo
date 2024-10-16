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

$app->session->session_save_path("/tmp/foobar_sessions");
$app->session->session_name("foobar_session");
$app->session->init();

# first make a request to /?name=Helmut
# then make a request to /
# the given name "Helmut" should then be printed

if ($app->request->get("name") ne "") {
  my $username = $app->request->get("name");
  $app->session->set("name", $username);
  $app->session->expire_in("3m");
  print "session saved, expires in 3 minutes";
} else {
  if ($app->session->get("name") ne "") {
    print $app->session->get("name");
  } else {
    print "No session value has been saved or it's already expired";
  }
}

