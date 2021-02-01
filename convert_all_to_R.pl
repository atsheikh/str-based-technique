#! /usr/bin/perl -w
use Cwd;

$start = time;
$cwd = getcwd; #get Current Working Directory

@inputs  = qw (14 45 39 54 9 15 9 23 8 8 25 14 8 41 5 14 17 7);
@inputs2  = qw (54 9 9 24 22 10 8 8 14 16 14 17 8);

@OH1  = qw (	2.0393
				2.0656
				2.0345
				2.1160
				2.0276
				2.5192
				2.0941
				2.0583
				2.4525
				2.3214
				2.5473
				2.0521
				2.0566
				2.0494
				2.5538
				2.0283
				2.0298
				2.2516
			);
@OH2  = qw (	0.3168
				0.5079
				0.3498
				0.4635
				0.3086
				0.4217
				0.2790
				0.3686
				0.2930
				0.1885
				0.2919
				0.3822
				0.3718
			);


@circuits = qw (	
s298f_IMP6
s344f_IMP6
s386f_IMP7
s444f_IMP33
s510f_IMP71
s641f_IMP12
			   );
			
open (TRACE, ">phaseArea.dat") or die $!;

foreach $i (0..scalar @circuits - 1) {		

	# $file = "$circuits[$i].pla";			
	# system("perl dmr.pl $file");
	# system("rm -rf $circuits[$i]_min.pla");
	# print "\nProcessing $circuits[$i]...\n";
	# foreach $k (0..scalar @threshold1 - 1) {
	
		# print "\n---Processing $circuits[$i]...";
		# system("perl compute-pof.pl $circuits[$i] $inputs[$i]");			
		# system("perl integrated-algos.pl $circuits[$i] $OH2[$i]");			
		# system("perl integrated-algos.pl $circuits[$i] 0.002");			
		# system("perl compute-pof.pl $circuits[$i] 45");			
		# system("perl computeGateStats.pl $circuits[$i] 45");			
		
		# ###For protection with threshold algo only
		# system("perl integrated-algos.pl $circuits[$i] $threshold1[4]");			
		# $temp = $threshold1[$k];	
		# $temp =~ s/\.//;		
		# system("ren *_$threshold1[$k].bench *_$temp.bench");			
		# system("perl faultInjProb.pl $circuits[$i]"."R_$temp");	
		#################################################################
		
		# system("perl gen_rnd_vecs.pl $inputs[$i] $circuits[$i]");	
		# system("hope -t $circuits[$i].test -D -N $circuits[$i].bench -l $circuits[$i].fault");	
		
		# system("perl faultInjProb.pl $circuits[$i]");	
		# system("perl bench_to_spice_130nm.pl $circuits[$i]");			
		# system("perl bench_to_tmr.pl $circuits[$i]");			
		# system("dos2unix $circuits[$i].bench");	
		
		# # For area constraint algo only
		# $temp *=100;
		# $circ = $circuits[$i]."_AC_".$temp;
		# system("perl bench_to_spice_130nm.pl $circuits[$i]");			
		
		# system("perl addInterGatesAsOutputs.pl $circuits[$i]");	
		# system("hope -t $circuits[$i].test $circuits[$i]-FO.bench -l $circuits[$i]-FO.fault");
		# system("perl transPOFs.pl $circuits[$i]");	
	# }
	
	
	# system("perl bench_to_spice_130nm.pl $circuits[$i]");	
	# # Read area from file
	# open(AR, "area.sp") or die $!;
	# while (<AR>) {
		# chomp;
		# $area1 = $_;			
	# }
	# close (AR);
	# print TRACE "$area1\n";
	
}
# system("ren *_0.01.bench *_pv001.bench"); #pv = protected voters.
# system("ren *_0.02.bench *_02.bench"); 

close (TRACE);

$end = time;
$diff = $end - $start;
print "---Time taken by Conversion Process = $diff \n";
				
	