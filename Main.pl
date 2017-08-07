#!/usr/bin/perl

#XML_Merger: Merges two XML's together! Current version can only merge Gcov 
#reports. Adds values and recalulates rates
#main entry point for the xml_merger

use DocHead;

use strict;
use warnings;
use Fcntl;

main();

sub main
{
  my $targetFile = "TARGET.XML";#'./GCOVR-REPORT-MERGED.xml'; 
  my $source = "./SOURCE.XML";#$ARGV[0]; #Get CLA for the source file
  #this file is the base file. the unmerged

  open XMLS, '<' ,"$source" or die "Failed to open file $!\n"; 
  #The new GCOV Report

  open XMLM, '+>>' ,"$targetFile" or die "Failed to open file $!\n"; 
  #The One to merge with
  
  backupMERGE(); #backup merged file

  #We now have both files opened. Our next step is to begin reading the tags in.  #We should start by reading in up to <packages> which is 10 lines (0-9).
  
  seek XMLM, 0, 0;
  my @FileHeader = map scalar(<XMLS>), 0..9;
  my $FH_REF = \@FileHeader;

  my $Header = new DocHead(@FileHeader);
  $Header->ExtractThings;

}


#backs up the file supplied ot it. And returns the backups file handle.
sub backupMERGE
{
  sysopen(BKP, "./backupmerge.xml", O_CREAT|O_WRONLY);

  while(<XMLM>)
  {
    print BKP $_;
  }

  close BKP;
}






