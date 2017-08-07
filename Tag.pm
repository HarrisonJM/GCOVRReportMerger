#!/usr/bin/perl

#this defines the "tag". The entire document is made up of tags, everything will
#inherit from this.

package Tag;


sub new
{
  my $class = shift;
  my $self = 
  {
    _tagID => shift, #the tag itself, e.g. <line>, <classes>
    _entireLine => shift, #The entire line
  };

  bless $self, $class;
  return $self;
}

sub setEntireLine
{
  my ($self, $entireLine ) = @_; #grab parameter
  $self->{_entireLine} = $entireLine if defined ($entireLine); #set attribute
  return $self->{_entireLine}; #return the now set parameter
}

sub setTagID
{
  my ($self, $TagID) = @_;
  $self->{_tagID} = $TagID if defined ($TagID);
  return $self->{_tagID};
}

sub getEntireLine
{
  my ($self) = @_;
  return $self->{_entireLine};
}

sub getTagID
{
  my ($self) = @_;
  return $self->{_tagID};
}


