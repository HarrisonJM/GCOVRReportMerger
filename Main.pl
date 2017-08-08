#!/usr/bin/perl

#XML_Merger: Merges two XML's together! Current version can only merge Gcov 
#reports. Adds values and recalulates rates
#main entry point for the xml_merger

use DocHead;
use Wrapper;

use strict;
use warnings;

use Fcntl;
use File::Copy;

main();

sub main
{
  my $targetFile = "TARGET.XML";#'./GCOVR-REPORT-MERGED.xml'; 
  my $source = "./SOURCE.XML";#$ARGV[0]; #Get CLA for the source file
  #this file is the base file. the unmerged

  open my $XMLS, '<' ,"$source" or die "Failed to open file $!\n"; 
  #The new GCOV Report

  open my $XMLM, '+>>' ,"$targetFile" or die "Failed to open file $!\n"; 
  #The One to merge with
  
  backupMERGE($XMLM); #backup merged file

  #We now have both files opened. Our next step is to begin reading the tags in.  #We should start by reading in up to <packages> which is 10 lines (0-9).
  
  seek $XMLM, 0, 0;
  my @FileHeader = map scalar($XMLS), 0..9;

  my $Header = new DocHead(@FileHeader);
  $Header->ExtractThings;

  #With the Header and its values extracted we can begin gathering other
  # parts of the document. Our next step is the <packages> tag

  my $Package = new Wrapper($XMLS);

  $Package->CreateTags;
}


#backs up the file supplied ot it. And returns the backups file handle.
sub backupMERGE
{
  my $fh = shift;

  sysopen(my $BKP, "./backupmerge.xml", O_CREAT|O_WRONLY);

  copy($fh, $BKP);

  close $BKP;
}






