print "Enter the genomic sequence: ";
chomp ($s=<>);
$s= lc($s);
$l= length($s);
%count= ('aaa',0,'aat',0,'aag',0,'aac',0,'ata',0,'att',0,'atg',0,'atc',0,'aga',0,'agt',0,'agg',0,'agc',0,'aca',0,'act',0,'acg',0,'acc',0,'taa',0,'tat',0,'tag',0,'tac',0,'tta',0,'ttt',0,'ttg',0,'ttc',0,'tga',0,'tgt',0,'tgg',0,'tgc',0,'tca',0,'tct',0,'tcg',0,'tcc',0,'gaa',0,'gat',0,'gag',0,'gac',0,'gta',0,'gtt',0,'gtg',0,'gtc',0,'gga',0,'ggt',0,'ggg',0,'ggc',0,'gca',0,'gct',0,'gcg',0,'gcc',0,'caa',0,'cat',0,'cag',0,'cac',0,'cta',0,'ctt',0,'ctg',0,'ctc',0,'cga',0,'cgt',0,'cgg',0,'cgc',0,'cca',0,'cct',0,'ccg',0,'ccc',0);
for ($i=0; $i<=$l-1; $i+=3) #For NON-OVERLAPPING codons
{
$codon= substr($s, $i, 3);
$count{$codon}++;
}
print "\n GLYCINE \n";
$n= $count{gga} + $count{ggt} + $count{ggg} + $count{ggc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'gga' or $codon eq 'ggt' or $codon eq 'ggg' or $codon eq 'ggc'))
{
$rscu= $count{$codon}/($n/4);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n ALANINE \n";
$n= $count{gca} + $count{gct} + $count{gcg} + $count{gcc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'gca' or $codon eq 'gct' or $codon eq 'gcg' or $codon eq 'gcc'))
{
$rscu= $count{$codon}/($n/4);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n VALINE \n";
$n= $count{gta} + $count{gtt} + $count{gtg} + $count{gtc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'gta' or $codon eq 'gtt' or $codon eq 'gtg' or $codon eq 'gtc'))
{
$rscu= $count{$codon}/($n/4);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n LEUCINE \n";
$n= $count{cta} + $count{ctt} + $count{ctg} + $count{ctc} + $count{tta} + $count{ttg};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'cta' or $codon eq 'ctt' or $codon eq 'ctg' or $codon eq 'ctc' or $codon eq 'tta' or $codon eq 'ttg'))
{
$rscu= $count{$codon}/($n/6);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n ISOLEUCINE \n";
$n= $count{ata} + $count{att} + $count{atc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'ata' or $codon eq 'att' or $codon eq 'atc'))
{
$rscu= $count{$codon}/($n/3);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n METHIONINE \n";
$n= $count{atg};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'atg'))
{
$rscu= $count{$codon}/($n/1);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n PROLINE \n";
$n= $count{cca} + $count{cct} + $count{ccg} + $count{ccc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'cca' or $codon eq 'cct' or $codon eq 'ccg' or $codon eq 'ccc'))
{
$rscu= $count{$codon}/($n/4);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n PHENYLALANINE \n";
$n= $count{ttt} + $count{ttc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'ttt' or $codon eq 'ttc'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n TRYPTOPHAN \n";
$n= $count{tgg};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'tgg'))
{
$rscu= $count{$codon}/($n/1);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n TYROSINE \n";
$n= $count{tat} + $count{tac};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'tat' or $codon eq 'tac'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n CYSTEINE \n";
$n= $count{tgt} + $count{tgc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'tgt' or $codon eq 'tgc'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n SERINE \n";
$n= $count{tca} + $count{tct} + $count{tcg} + $count{ttc} + $count{agt} + $count{agc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'tca' or $codon eq 'tct' or $codon eq 'tcg' or $codon eq 'tcc' or $codon eq 'agt' or $codon eq 'agc'))
{
$rscu= $count{$codon}/($n/6);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n THREONINE \n";
$n= $count{aca} + $count{act} + $count{acg} + $count{acc};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'aca' or $codon eq 'act' or $codon eq 'acg' or $codon eq 'acc'))
{
$rscu= $count{$codon}/($n/4);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n ASPARAGINE \n";
$n= $count{aat} + $count{aac};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'aat' or $codon eq 'aac'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n GLUTAMINE \n";
$n= $count{caa} + $count{cag};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'caa' or $codon eq 'cag'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n ASPARTATE \n";
$n= $count{gat} + $count{gac};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'gat' or $codon eq 'gac'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n GLUTAMATE \n";
$n= $count{gaa} + $count{gag};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'gaa' or $codon eq 'gag'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n ARGININE \n";
$n= $count{cga} + $count{cgt} + $count{cgg} + $count{cgc} + $count{aga} + $count{agg};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'cga' or $codon eq 'cgt' or $codon eq 'cgg' or $codon eq 'cgc' or $codon eq 'aga' or $codon eq 'agg'))
{
$rscu= $count{$codon}/($n/6);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n LYSINE \n";
$n= $count{aaa} + $count{aag};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'aaa' or $codon eq 'aag'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n HISTIDINE \n";
$n= $count{cat} + $count{cac};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'cat' or $codon eq 'cac'))
{
$rscu= $count{$codon}/($n/2);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
print "\n STOP \n";
$n= $count{taa} + $count{tag} + $count{tga};
foreach $codon(keys%count)
{
if ($n != 0 and ($codon eq 'taa' or $codon eq 'tag' or $codon eq 'tga'))
{
$rscu= $count{$codon}/($n/3);
print "codon: $codon, count: $count{$codon}, RSCU value: $rscu \n";
}
}
