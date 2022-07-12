#!/usr/bin/perl
use strict;
use warnings;
use Pod::Usage;
use Getopt::Long;
use File::Basename;

# A script used to extract your interested genes from a full table.
# Author: lei feng
# Mail: lfeng0703 <at> hotmail <dot> com
# Created Time: Wed 15 Jun 2022 07:20:01 PM CST

# Parameter variables
my $table;
my $list;
my $helpAsked;
my $outFile = "";

GetOptions(
    "i=s" => \$table,
    "l=s" => \$list,
    "h|help" => \$helpAsked,
    "o|outputFile=s" => \$outFile,
);

if(defined($helpAsked)) {
    prtUsage();
    exit;
}
if(!defined($table)) {
    prtError("No input files are provided");
}

my ($fileName, $filePath) = fileparse($table);
$outFile = $table . "_extract_result.txt" if($outFile eq "");

open(TABLE, "<$table") or die "Can not open file: $table\n";
open(LIST, "<$list") or die "Can not open file: $list\n";
open(OUT, ">$outFile") or die "Can not open file: $outFile\n";

my @gene_names;
while(<LIST>){
    chomp $_;
    my $onegene = $_;
    $onegene =~ s/^\s+|\s+$//g;
    push @gene_names, $onegene;
}

my $row_count = 0;
my @all_records;
while(<TABLE>){
    chomp $_;
    my $record = $_;
    $row_count++;
    if($row_count == 1){
        print OUT "$record\n";
        next;
    }
    push @all_records, $record;
}

my $onegene;
foreach $onegene (@gene_names){   ### 按照待查询的列表的顺序输出查找结果
    my $database;
    foreach $database (@all_records){
        if($database =~ m/$onegene/){
            print OUT "$database\n";
            last;
        }
    }
}

# my $row_count = 0;
# while(<TABLE>){
#     chomp $_;
#     my $record = $_;
#     $row_count++;
#     if($row_count == 1){
#         print OUT "$record\n";
#         next;
#     }
#     my $onegene;
#     foreach $onegene (@gene_names){
#         if($record =~ m/$onegene/){
#             print OUT "$record\n";
#             next;
#         }
#     }
# }

close TABLE;
close LIST;
close OUT;

sub prtHelp {
    print "\n$0 options:\n\n";
    print "### Input full gene table (Required)\n";
    print "  -i <full gene table>\n";
    print "    full gene table in tab, csv, or text format\n";
    print "\n";
    print "### Input gene list you want to extract (Required)\n";
    print "  -l <gene list>\n";
    print "    A gene list in text format\n";
    print "\n";
    print "### Other options [Optional]\n";
    print "  -h | -help\n";
    print "    Prints this help\n";
    print "  -o | -outputFile <Output file name>\n";
    print "    Output will be stored in the given new file\n";
    print "    default: By default, output file will be stored in same location of the input file.\n";
    print "\n";
}

sub prtError {
    my $msg = $_[0];
    print STDERR "+======================================================================+\n";
    printf STDERR "|%-70s|\n", "  Error:";
    printf STDERR "|%-70s|\n", "       $msg";
    print STDERR "+======================================================================+\n";
    prtUsage();
    exit;
}

sub prtUsage {
    print "\nUsage: perl $0 <options>\n";
    prtHelp();
}


