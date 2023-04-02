%ascii=('@',0, 'A',1, 'B',2, 'C',3, 'D',4, 'E',5, 'F',6, 'G',7, 'H',8, 'I',9, 'J',10, 'K',11, 'L',12, 'M',13, 'N',14, 'O',15, 'P',16, 'Q',17, 'R',18, 'S',19, 'T',20, 'U',21, 'V',22, 'W',23, 'X',24, 'Y',25, 'Z',26, '[',27, '\\',28, ']',29, '^',30, '_',31, '`',32, 'a',33, 'b',34, 'c',35, 'd',36, 'e',37, 'f',38, 'g',39, 'h',40, 'i',41, 'j',42);
open (F, "fastq.txt") or die "File not found";
while (chomp($line=<F>))
{ push @reads, $line; }
$number_lines= @reads;
for ($i=1; $i<$number_lines; $i+=4)
{ push @seq, $reads[$i]; }
for ($i=3; $i<$number_lines; $i+=4)
{ push @quality, $reads[$i]; }
$number_positions= length($seq[0]);
$number_reads= @seq;
for ($i=1; $i<=$number_positions; $i++)
{
@s= @seq;
@q= @quality;
$count= 0;
$sum= 0;
$position= '';
for ($j=0; $j<$number_reads; $j++)
{
$a= shift(@s);
$a= reverse($a);
$b= shift(@q);
$b= reverse($b);
for ($k=1; $k<=$i; $k++)
{
$x= chop($a);
$y= chop($b);
}
if ($x eq 'C' or $x eq 'G')
{ $count++; }
$position .= $x;
$sum += $ascii{$y};
}
print "$position \n";
$gc= ($count*100)/$number_reads;
print "GC% of all reads for $i position= $gc \n";
$av= $sum/$number_reads;
print "Average of the quality scores of all reads for $i position= $av \n";
$end= '-' x 50;
print "$end \n";
}
