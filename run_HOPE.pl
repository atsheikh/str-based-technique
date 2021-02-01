#! /usr/bin/perl -w
use Cwd;

$start = time;
$cwd = getcwd; #get Current Working Directory
$vectors = 100000;

@circuits = qw (	alu4M_tmr
apex1M_tmr
apex2M_tmr
apex3M_tmr
apex4M_tmr
b12M_tmr
clipM_tmr
cordicM_tmr
ex5M_tmr
misex1M_tmr
misex2M_tmr
misex3M_tmr
rd84M_tmr
seqM_tmr
squar5M_tmr
table3M_tmr
table5M_tmr
z5xp1M_tmr
			   );
			

#print "File = $file \n"; exit;

foreach $i (0..scalar @circuits - 1) {

	print "\nProcessing $circuits[$i]...\n";
	
	
	# $file = "/cygdrive/d/cse710/benchmarks/$circuits[$i].bench";			
	$file = "$circuits[$i].bench";			
	system("hope -r $vectors -D -N $file -l $circuits[$i].fault");
	# system("hope -r $vectors $file -l $circuits[$i].fault");
	# system("perl integrated-algos.pl $circuits[$i] 0.01");
}

$end = time;
$diff = $end - $start;
print "---Time taken by Conversion Process = $diff \n";
				
	