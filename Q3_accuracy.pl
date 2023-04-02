print ">>Protein ID: 1HB6 \n";
open(F, "C:\\Users\\shiva\\Downloads\\Structural Bioinformatics\\SB Practical-3\\Proteins\\1HB6\\DSSP.txt") or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /^[0-9]+\s*\t\t(.*)/)
{ $seq .= $1; }
if ($line =~ /^\t\t(.*)/)
{ $dssp .= $1; }
}
$seq =~ s/ //g;
$length= length($seq);
print "Length of the sequence: $length \n";
$end= '-' x 50;
print "$end \n";
print "Sequence: $seq \n";
$end= '-' x 50;
print "$end \n";
@dssp= split//,$dssp;
$length_dssp= @dssp;
for ($i=10; $i<$length_dssp; $i+=10)
{ splice (@dssp, $i, 1,); }
$dssp='';
for ($i=0; $i<$length; $i++)
{ $dssp .= shift(@dssp); }
$dssp =~ s/[^HE]/C/g;
print "DSSP:     $dssp \n";
$end= '-' x 50;
print "$end \n";
close (F);
open (F, "C:\\Users\\shiva\\Downloads\\Structural Bioinformatics\\SB Practical-3\\Proteins\\1HB6\\GOR1.txt") or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /[hect]+/)
{ $gor1 .= $line; }
}
$gor1= uc($gor1);
$gor1 =~ s/T/C/g;
$gor1 =~ s/ //g;
print "GOR1:     $gor1 \n";
$end= '-' x 50;
print "$end \n";
close (F);
open (F, "C:\\Users\\shiva\\Downloads\\Structural Bioinformatics\\SB Practical-3\\Proteins\\1HB6\\GOR4.txt") or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /[hect]+/)
{ $gor4 .= $line; }
}
$gor4= uc($gor4);
$gor4 =~ s/T/C/g;
$gor4 =~ s/ //g;
print "GOR4:     $gor4 \n";
$end= '-' x 50;
print "$end \n";
close (F);
open (F, "C:\\Users\\shiva\\Downloads\\Structural Bioinformatics\\SB Practical-3\\Proteins\\1HB6\\query.reprof") or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /^[0-9]*\t[A-Z]\t([HEL])\t.*/)
{ $phd .= $1; }
}
$phd =~ s/L/C/g;
print "PHD:      $phd \n";
$end= '-' x 50;
print "$end \n$end \n";
close (F);
for ($i=1; $i<=$length; $i++)
{
$a= chop($dssp);
$b= chop($gor1);
$c= chop($gor4);
$d= chop($phd);
if ($a eq $b)
{ $count_gor1++; }
if ($a eq $c)
{ $count_gor4++; }
if ($a eq $d)
{ $count_phd++; }
}
print "Number of correctly predicted states for GOR1 method: $count_gor1 \n";
print "Number of correctly predicted states for GOR4 method: $count_gor4 \n";
print "Number of correctly predicted states for PHD method: $count_phd \n";
$end= '-' x 50;
print "$end \n";
$q3_gor1= ($count_gor1*100)/$length;
$q3_gor4= ($count_gor4*100)/$length;
$q3_phd= ($count_phd*100)/$length;
print "Q3 accuracy of GOR1 method: $q3_gor1 \n";
print "Q3 accuracy of GOR4 method: $q3_gor4 \n";
print "Q3 accuracy of PHD method: $q3_phd \n";
