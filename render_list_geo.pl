#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Std;
use Math::Trig;

my $options = {};
getopts("n:x:X:y:Y:z:Z:h", $options);

if ($options->{h}) {
  print "options: (x,X,y,Y,z,Z - required, no checks, small letters should be less)\n";  
  print "  -n <n>         number of used concurrent threads\n";
  print "  -m <m>         name of map\n";
  print "  -x <x>, -X <x> start and end longitude (in geographic coordinates, WGS84)\n";
  print "  -y <y>, -Y <y> start and end latitude (in geographic coordinates, WGS84)\n";
  print "  -z <z>, -Z <z> start and end level value\n";
  print "\n";
  exit;
}

my ($z, $Z);
my $bulkSize=8;
if ($options->{x} && $options->{X} &&
    $options->{y} && $options->{Y} &&
    $options->{z} && $options->{Z})
{
    print "\nRendering started at: ";
    system("date");
    print("\n");
    $z = $options->{z};
    $Z = $options->{Z};
    for my $iz ($options->{z}..$options->{Z})
    {
	my ($zoom, $x, $X, $y, $Y, $cmd, $n);
	$zoom = 1 << $iz;
	$x = int($zoom * ($options->{x} + 180) / 360);
	$X = int($zoom * ($options->{X} + 180) / 360);
	$y = int($zoom * (1 - log(tan($options->{y}*pi/180) + sec($options->{y}*pi/180))/pi)/2);
	$Y = int($zoom * (1 - log(tan($options->{Y}*pi/180) + sec($options->{Y}*pi/180))/pi)/2);
	#some stupid magic: aligning max range values to the border of meta-bundles (caused by internal bug of render_list)
	$X=(int($X/$bulkSize)+1)*$bulkSize-1;
	$y=(int($y/$bulkSize)+1)*$bulkSize-1;
	$n = 2;
	#be careful! y and Y used in reversed order
	$cmd="render_list -a -z ".$iz." -Z ".$iz." -x ".$x." -X ".$X." -y ".$Y." -Y ".$y;
	if ($options->{n}) {$cmd = $cmd." -n ".$options->{n}};
        if ($options->{m}) {$cmd = $cmd." -m ".$options->{m}};
        print $cmd."\n";
	system($cmd);
	print("\nZoom factor: ".$iz." finished at\n");
	system("date");
    }
    print "\nRendering finished at: ";
    system("date");
    print ("\n");
};
