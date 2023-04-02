print "Enter the genomic sequence: ";
chomp ($s=<>);
$s= lc($s);
$l= length($s);
$n=0;
$w=1;
%count= ();
for ($i=0; $i<=$l-1; $i+=3) #For NON-OVERLAPPING codons
{
$codon= substr($s, $i, 3);
$count{$codon}++;
$n++;
}
foreach $codon(keys%count)
{
if ($codon eq 'gga' or $codon eq 'ggt' or $codon eq 'ggg' or $codon eq 'ggc')
{ push @Gly, $count{$codon}; sort{$a<=>$b}@Gly; }
if ($codon eq 'gca' or $codon eq 'gct' or $codon eq 'gcg' or $codon eq 'gcc')
{ push @Ala, $count{$codon}; sort{$a<=>$b}@Ala; }
if ($codon eq 'gta' or $codon eq 'gtt' or $codon eq 'gtg' or $codon eq 'gtc')
{ push @Val, $count{$codon}; sort{$a<=>$b}@Val; }
if ($codon eq 'cta' or $codon eq 'ctt' or $codon eq 'ctg' or $codon eq 'ctc' or $codon eq 'tta' or $codon eq 'ttg')
{ push @Leu, $count{$codon}; sort{$a<=>$b}@Leu; }
if ($codon eq 'ata' or $codon eq 'att' or $codon eq 'atc')
{ push @Ile, $count{$codon}; sort{$a<=>$b}@Ile; }
if ($codon eq 'atg')
{ push @Met, $count{$codon}; sort{$a<=>$b}@Met; }
if ($codon eq 'cca' or $codon eq 'cct' or $codon eq 'ccg' or $codon eq 'ccc')
{ push @Pro, $count{$codon}; sort{$a<=>$b}@Pro; }
if ($codon eq 'ttt' or $codon eq 'ttc')
{ push @Phe, $count{$codon}; sort{$a<=>$b}@Phe; }
if ($codon eq 'tgg')
{ push @Trp, $count{$codon}; sort{$a<=>$b}@Trp; }
if ($codon eq 'tat' or $codon eq 'tac')
{ push @Tyr, $count{$codon}; sort{$a<=>$b}@Tyr; }
if ($codon eq 'tgt' or $codon eq 'tgc')
{ push @Cys, $count{$codon}; sort{$a<=>$b}@Cys; }
if ($codon eq 'tca' or $codon eq 'tct' or $codon eq 'tcg' or $codon eq 'tcc' or $codon eq 'agt' or $codon eq 'agc')
{ push @Ser, $count{$codon}; sort{$a<=>$b}@Ser; }
if ($codon eq 'aca' or $codon eq 'act' or $codon eq 'acg' or $codon eq 'acc')
{ push @Thr, $count{$codon}; sort{$a<=>$b}@Thr; }
if ($codon eq 'aat' or $codon eq 'aac')
{ push @Asn, $count{$codon}; sort{$a<=>$b}@Asn; }
if ($codon eq 'caa' or $codon eq 'cag')
{ push @Gln, $count{$codon}; sort{$a<=>$b}@Gln; }
if ($codon eq 'gat' or $codon eq 'gac')
{ push @Asp, $count{$codon}; sort{$a<=>$b}@Asp; }
if ($codon eq 'gaa' or $codon eq 'gag')
{ push @Glu, $count{$codon}; sort{$a<=>$b}@Glu; }
if ($codon eq 'cga' or $codon eq 'cgt' or $codon eq 'cgg' or $codon eq 'cgc' or $codon eq 'aga' or $codon eq 'agg')
{ push @Arg, $count{$codon}; sort{$a<=>$b}@Arg; }
if ($codon eq 'aaa' or $codon eq 'aag')
{ push @Lys, $count{$codon}; sort{$a<=>$b}@Lys; }
if ($codon eq 'cat' or $codon eq 'cac')
{ push @His, $count{$codon}; sort{$a<=>$b}@His; }
if ($codon eq 'taa' or $codon eq 'tag' or $codon eq 'tga')
{ push @Stop, $count{$codon}; sort{$a<=>$b}@Stop; }
}
foreach $codon(keys%count)
{
if ($codon eq 'gga' or $codon eq 'ggt' or $codon eq 'ggg' or $codon eq 'ggc')
{ $w *= $count{$codon}/pop@Gly; }
if ($codon eq 'gca' or $codon eq 'gct' or $codon eq 'gcg' or $codon eq 'gcc')
{ $w *= $count{$codon}/pop@Ala; }
if ($codon eq 'gta' or $codon eq 'gtt' or $codon eq 'gtg' or $codon eq 'gtc')
{ $w *= $count{$codon}/pop@Val; }
if ($codon eq 'cta' or $codon eq 'ctt' or $codon eq 'ctg' or $codon eq 'ctc' or $codon eq 'tta' or $codon eq 'ttg')
{ $w *= $count{$codon}/pop@Leu; }
if ($codon eq 'ata' or $codon eq 'att' or $codon eq 'atc')
{ $w *= $count{$codon}/pop@Ile; }
if ($codon eq 'atg')
{ $w *= $count{$codon}/pop@Met; }
if ($codon eq 'cca' or $codon eq 'cct' or $codon eq 'ccg' or $codon eq 'ccc')
{ $w *= $count{$codon}/pop@Pro; }
if ($codon eq 'ttt' or $codon eq 'ttc')
{ $w *= $count{$codon}/pop@Phe; }
if ($codon eq 'tgg')
{ $w *= $count{$codon}/pop@Trp; }
if ($codon eq 'tat' or $codon eq 'tac')
{ $w *= $count{$codon}/pop@Tyr; }
if ($codon eq 'tgt' or $codon eq 'tgc')
{ $w *= $count{$codon}/pop@Cys; }
if ($codon eq 'tca' or $codon eq 'tct' or $codon eq 'tcg' or $codon eq 'tcc' or $codon eq 'agt' or $codon eq 'agc')
{ $w *= $count{$codon}/pop@Ser; }
if ($codon eq 'aca' or $codon eq 'act' or $codon eq 'acg' or $codon eq 'acc')
{ $w *= $count{$codon}/pop@Thr; }
if ($codon eq 'aat' or $codon eq 'aac')
{ $w *= $count{$codon}/pop@Asn; }
if ($codon eq 'caa' or $codon eq 'cag')
{ $w *= $count{$codon}/pop@Gln; }
if ($codon eq 'gat' or $codon eq 'gac')
{ $w *= $count{$codon}/pop@Asp; }
if ($codon eq 'gaa' or $codon eq 'gag')
{ $w *= $count{$codon}/pop@Glu; }
if ($codon eq 'cga' or $codon eq 'cgt' or $codon eq 'cgg' or $codon eq 'cgc' or $codon eq 'aga' or $codon eq 'agg')
{ $w *= $count{$codon}/pop@Arg; }
if ($codon eq 'aaa' or $codon eq 'aag')
{ $w *= $count{$codon}/pop@Lys; }
if ($codon eq 'cat' or $codon eq 'cac')
{ $w *= $count{$codon}/pop@His; }
if ($codon eq 'taa' or $codon eq 'tag' or $codon eq 'tga')
{ $w *= $count{$codon}/pop@Stop; }
}
$cai= $w/$n;
print "Codon adaptation index of the entered genomic sequence= $cai \n";
