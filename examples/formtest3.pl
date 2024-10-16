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

$app->form->setup("forms/testform3.frm");
my @selectbox2AoH = ({value => "value1", label => "label1"}, {value => "value2", label => "label2"});
$app->form->presetMulti("selectbox2", @selectbox2AoH);

my @radiobox1AoH = ({value => "radiovalue1", label => "radiovalue 1"}, {value => "radiovalue2", label => "radiovalue 2"});
$app->form->presetMulti("radiobox1", @radiobox1AoH);

if ($app->request->get("action") ne "submit") {
  # load the testform
  print $app->form->show();
} else {
  # validate form input
  if ($app->form->validate()) {
    # ok, our form validates
    print "username:".$app->form->get("username")."<br />";
    print "password:".$app->form->get("password")."<br />";
    print "textfield1:".$app->form->get("textfield1")."<br />";
    print "textfield2:".$app->form->get("textfield2")."<br />";
    print "selectbox1:".$app->form->get("selectbox1")."<br />";
    print "selectbox2:".$app->form->get("selectbox2")."<br />";
    print "radiobox1:".$app->form->get("radiobox1")."<br />";
  } else {
    print $app->form->error();
  }
}
