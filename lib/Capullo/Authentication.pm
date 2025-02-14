package Capullo::Authentication;
use Moose;

  use Digest::SHA1 qw(sha1 sha1_hex sha1_base64);
  
  has "database_object" => (
    is => "rw"
  );
  
  has "user_table" => (
    isa => "Str",
    is => "rw"
  );
    
  sub sha1 {
    my ($self,$input) = @_;
    return sha1_hex($input);
  }
    
  sub setup {
    my ($self,$db,$table) = @_;
    $self->database_object($db);
    $self->user_table($table);
  }
    
  sub getPassword {
    my ($self,$username) = @_;
    my $return = 1;
    my $table = $self->user_table();
    if (my @db = $self->database_object->query("select username,password from $table where username='$username' limit 1;")) {
      $return = $db[0]{"password"};
    } else {
      $return = 0;
    }
    return $return;
  }
    
  sub isInGroup {
    my ($self,$username,$group) = @_;
    my $return = 0;
    my $table = $self->user_table();
    if (my @db = $self->database_object->query("select groups from $table where username='$username' limit 1;")) {
      my @groupsplit = split(/,/, $db[0]{"groups"});
      my $length = @groupsplit;
      for (my $run=0;$run<$length;$run++) {
        if ($groupsplit[$run] eq $group) {
          $return = 1;
        }
      }
    } else {
      $return = 0;
    }
    return $return;
  }
    
  sub isAuthorized {
    my ($self,$username,$password) = @_;
    my $return = 0;
    my $table = $self->user_table();
    if (my @db = $self->database_object->query("select password from $table where username='$username' limit 1;")) {
      if ($db[0]{"password"} eq $password) {
        $return = 1;
      } else {
        $return = 0;
      }
    } else {
      $return = 0;
    }
    return $return;
  }

1;
