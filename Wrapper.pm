#!/usr/bin/perl

#Generic Header for tag wrappers

package Wrapper;
use strict;
use warnings;

sub new
{
  my $class = shift;
  my $self = 
  { 
    _FilePointer => shift,
    _wrapperName => "", #name of the wrapper
    _wrapperHead => "", #wrapper header
    _wrapperFooter => "", #wrapper footer
    _wraps => [], #a list of the objects it contains
  };

  bless $self, $class;

  return $self;
}

# extracts next package name from file pointer and uses it to determine
# the name of the wrapper. 
sub CreateTags
{
  my ($self) = @_;
  #my $wrapperName = $self->{_wrapperName};
  my $FP = $self->{_FilePointer};

  print <$FP>;
  
  #$self->{_wrapperHead} = "<$wrapperName>";
  #$self->{_wrapperFooter} = "</$wrapperName>"; 
  
}




1;

