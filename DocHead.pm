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
    _timestamp => 0,
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
  my($self) = @_;
  my @tempHead = @{ $self->{_entireHeader} };

  my $pattern = qr/\"([^\s]*)\"[\s]/;
  my @values = $tempHead[3] =~ m/$pattern/g;

  print "@values \n";
}





1;
