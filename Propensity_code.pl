opendir (DIR, "C:\\Users\\shiva\\Downloads\\Structural Bioinformatics\\SB Propensity code") or die "Couldn't open the directory";
while ($file= readdir DIR)
{
if ($file =~ /\.pdb$/)
{ push @name, $file; }
}
$last= $#name;
%sum_db= (), %sum_helix= (), %sum_sheet= ();
for ($i=0; $i<=$last; $i++)
{
$s='';
@seq= (), @helix= (), @sheet= ();
open (F,$name[$i]) or die "File not found";
print ">>$name[$i] \n";
while (chomp($line=<F>))
{
if ($line =~ /^SEQRES *[0-9]* [A-Z] *[0-9]*  (.*)/)
{ $s .= $1; }
}
@seq= split(' ',$s);
$length_seq= @seq;
$length_db += $length_seq;
print "Sequence of the protein= @seq \n";
print "Total number of residues in the protein= $length_seq \n";
%count_protein= ();
foreach $aa(@seq)
{ $count_protein{$aa}++; }
foreach $aa(keys%count_protein)
{
print "Key= $aa, Value= $count_protein{$aa} \n";
$sum_db{$aa} += $count_protein{$aa};
}
$end= '-' x 50;
print "$end \n";
seek(F,0,0); # OR open (G,$name[$i]) or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /^HELIX *[0-9]* *[A-Z0-9]* ([A-Z]*) [A-Z] *[0-9]*  ([A-Z]*) [A-Z] *[0-9]*  [0-9] *([0-9]*)/)
{
for ($j=0; $j<$length_seq; $j++)
{
if ($seq[$j] eq $1)
{
if ($seq[$j+$3-1] eq $2)
{
for ($k= $j; $k<=($j+$3-1); $k++)
{ push @helix, $seq[$k]; }
last;
} #Closing of inner 'if'
} #Closing of outer 'if'
} #Closing of '$j' 'for' loop
} #Closing of pattern matching line for helix
if (($line =~ /^SHEET *1 *[A-Z 0-9]* ([A-Z]*) [A-Z] *([0-9]*)  ([A-Z]*) [A-Z] *([0-9]*)  0/) or ($line =~ /^SHEET *[0-9]* *[A-Z 0-9]* ([A-Z]*) [A-Z] *([0-9]*)  ([A-Z]*) [A-Z] *([0-9]*) *(-1|1)  [ON]  [A-Z]* [A-Z] *[0-9]*   [ON]  [A-Z]* [A-Z] *[0-9]*/))
{
for ($j=0; $j<$length_seq; $j++)
{
if ($seq[$j] eq $1)
{
if ($seq[$j+$4-$2] eq $3)
{
for ($k= $j; $k<=($j+$4-$2); $k++)
{ push @sheet, $seq[$k]; }
last;
} #Closing of inner 'if'
} #Closing of outer 'if'
} #Closing of '$j' 'for' loop
} #Closing of pattern matching line for sheet
} #Closing of 'while' loop
$length_helix= @helix;
$length_db_helix += $length_helix;
print "Sequence in the helix= @helix \n";
print "Total number of residues in the helix= $length_helix \n";
%count_helix= ();
foreach $aa(@helix)
{ $count_helix{$aa}++; }
foreach $aa(keys%count_helix)
{
print "Key= $aa, Value= $count_helix{$aa} \n";
$sum_helix{$aa} += $count_helix{$aa};
}
$end= '-' x 50;
print "$end \n";
$length_sheet= @sheet;
$length_db_sheet += $length_sheet;
print "Sequence in sheet= @sheet \n";
print "Total number of residues in the sheet= $length_sheet \n";
%count_sheet= ();
foreach $aa(@sheet)
{ $count_sheet{$aa}++; }
foreach $aa(keys%count_sheet)
{
print "Key= $aa, Value= $count_sheet{$aa} \n";
$sum_sheet{$aa} += $count_sheet{$aa};
}
$end= '-' x 50;
print "$end \n$end \n";
}
%amino_acid= ('GLY',0, 'ALA',0, 'VAL',0, 'LEU',0, 'ILE',0, 'MET',0, 'PRO',0, 'PHE',0, 'TYR',0, 'TRP',0, 'SER',0, 'THR',0, 'CYS',0, 'ASN',0, 'GLN',0, 'ASP',0, 'GLU',0, 'HIS',0, 'LYS',0, 'ARG',0);
foreach $aa(keys%amino_acid)
{
$propensity_helix= ($sum_helix{$aa}*$length_db)/($sum_db{$aa}*$length_db_helix);
$propensity_sheet= ($sum_sheet{$aa}*$length_db)/($sum_db{$aa}*$length_db_sheet);
print "Propensity of $aa in helix= $propensity_helix \n";
print "Propensity of $aa in sheet= $propensity_sheet \n";
}
close (DIR);
