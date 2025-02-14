package Capullo::Template;
use Moose;

  use HTML::Template;

  has "template_object" => (
    isa => "HTML::Template",
    is => "rw"
  );
  
  has "root_directory" => (
    isa => "Str",
    is => "rw"
  );
    
  sub open {
    my ($self, $tplname) = @_;
    my $file = $self->root_directory()."/$tplname";
    eval {
      $self->template_object(HTML::Template->new(filename => $file));
    };
    return 0 if ($@);
    return 1 if (!$@);
  }
    
  sub include {
    my ($self, $file) = @_;
    if ($self->open("/".$file)) {
      $self->render();
      return 1;
    } else {
      return 0;
    }
  }
    
  sub passVariables {
    my ($self, %variables) = @_;
    eval {
      $self->template_object->param(%variables);
    };
    return 0 if ($@);
    return 1 if (!$@);
  }
    
  sub render {
    my ($self) = @_;
    eval {
      print $self->template_object->output;
    };
    return 0 if ($@);
    return 1 if (!$@);
  }
  
1;
