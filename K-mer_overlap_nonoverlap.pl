print "Enter a genomic sequence: ";
chomp($s=<>);
print "Enter the length of K-mer: ";
chomp($k=<>);
$l= length($s);
print "Overlapping K-mers: \n";
$a=1;
for ($i=0; ($i+$k-1)<=($l-1); $i++)
{
$c= substr($s, $i, $k);
print "Overlapping K-mer $a= $c \n";
$a++;
}
print "Non-overlapping K-mers: \n";
$a=1;
for ($i=0; ($i+$k-1)<=($l-1); $i+=$k)
{
$c= substr($s, $i, $k);
print "Non-overlapping K-mer $a= $c \n";
$a++;
}