#!/usr/bin/perl

#stores the top of the document; e.g. timestamp, version, etc

package DocHead;
use strict;
use warnings;

sub new
{
  my $class = shift;
  my $self = 
  {
    _timeStamp => 0,
    _brachRate => 0,
    _lineRate => 0,
    _entireHeader => [@_],
  };

  bless $self, $class;
  
  return $self;
}

#extracts the information from the header file
sub ExtractThings
{
no warnings; #unused variable warning

  my($self) = @_;
  my @tempHead = @{ $self->{_entireHeader} };

  my $pattern = qr/\"([^\s]*)\"[\s]/;
  my @values = $tempHead[3] =~ m/$pattern/g;

  $self->{_lineRate} => $values[0];
  $self->{_branchRate} => $values[1];
  $self->{_timeStamp} => $values[2];
}

#recalculates the branch and line rates and the timestamp
sub RecalcValues
{

  my ($self) = @_;
  my $LR = $self->{_lineRate};
  my $BR = $self->{_branchRate};
  my $TS = $self->{_timeStamp};

}



1;
