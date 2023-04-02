print "Enter the genomic sequence: ";
chomp ($s=<>);
$s= uc($s);
$l= length($s);
print "Enter the length of K-mer you want to generate: ";
chomp ($k=<>);
print "Overlapping nucleotide frequencies: \n";
@s=();
for ($i=0; $i+$k-1<=$l-1; $i++)
{
$nu= substr($s, $i, $k);
push @s,$nu;
}
%count= ();
foreach $nu(@s)
{ $count{$nu}++; }
foreach $nu(keys%count)
{ print "Key= $nu, Value= $count{$nu} \n"; }