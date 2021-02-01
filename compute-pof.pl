#! /usr/bin/perl -w
use Cwd;

$start = time;
$inputFile = $ARGV[0];
$inputs = $ARGV[1];

print "\nProcessing $inputFile...\n";
system("perl gen_rnd_vecs.pl $inputs $inputFile");	

# system("perl addInterGatesAsOutputs.pl $inputFile");
# system("hope -t $inputFile.test $inputFile-FO.bench -l $inputFile-FO.fault");	
# system("perl probFailures130nm.pl");
# system("perl transPOFs.pl $inputFile");

# system("perl createFaultsList.pl $inputFile");	
# system("dos2unix $inputFile.fn");	
# system("hope -f $inputFile.fn -t $inputFile.test -D -N $inputFile.bench -l $inputFile.fault");	

system("hope -t $inputFile.test -D -N $inputFile.bench -l $inputFile.fault");	

system("perl integrated-algos.pl $inputFile 0.01");	

	

$end = time;
$diff = $end - $start;
print "---Time taken by Conversion Process = $diff \n";
				
	