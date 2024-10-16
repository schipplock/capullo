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

$app->form->setup("forms/testform2.frm");

if ($app->request->get("action") ne "submit") {
  # pre-set variables
  # if you preset variables, you must preset all ones
  $app->form->presetSingle("username","testuser");
  $app->form->presetSingle("password","test123");
  $app->form->presetSingle("textfield1","here goes some content");
  # load the testform
  print $app->form->show();
} else {
  # validate form input
  if ($app->form->validate()) {
  # ok, our form validates
    print $app->form->get("username")."<br />";
    print $app->form->get("password")."<br />";
    print $app->form->get("textfield1")."<br />";
    print $app->form->get("selectbox1");
  } else {
    print $app->form->error();
  }
}
