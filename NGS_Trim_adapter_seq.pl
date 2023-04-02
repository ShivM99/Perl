open (F, "fastq.txt") or die "File not found";
open (E, ">output.txt");
$adapter= GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA;
print E "The adapter sequence: $adapter \n";
print "Enter the minimum length of overlap required between the read and the adapter: ";
chomp ($O=<>);
print E "The minimum length of overlap: $O \n";
$end= '-' x 50;
print E "$end \n";
while (chomp($line=<F>))
{ push @reads, $line; }
$number_lines= @reads;
for ($i=1; $i<$number_lines; $i+=4)
{ push @seq, $reads[$i]; }
$number_reads= @seq;
$l= length($seq[0]);
$count= 0;
$match_adapter= substr($adapter, 0, $O);
for ($i=0; $i<$number_reads; $i++)
{
for ($j=0; $j<$l; $j++)
{
$match_seq= substr($seq[$i], $j, $O);
if ($match_adapter eq $match_seq)
{
$count++;
print E "To be trimmed: $seq[$i] \n";
for ($k=$l-1; $k>=0; $k--)
{
if ($k >= $j)
{ chop($seq[$i]); }
} #Closing '$k' 'for' loop
print E "Trimmed:       $seq[$i] \n";
} #Closing 'if'
} #Closing '$j' 'for' loop
} #Closing '$i' 'for' loop
$end= '-' x 50;
print E "$end \n";
print E "Number of trimmed reads: $count \n";
