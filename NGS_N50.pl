open (F, "Graph") or die "File not found";
while (chomp($line=<F>))
{
if ($line =~ /^NODE\t[0-9]*\t([0-9]*)\t([0-9]*)\t([0-9]*)\t0\t0$/)
{
$number_node++;
push @len_node, $1;
$total_node += $1;
if ($1>=31)
{
$number_contig++;
push @len_contig, $1;
$total_contig += $1;
}
}
}
print "Number of nodes in the Graph file= $number_node \n";
print "Number of contigs in the contigs.fa file= $number_contig \n";
$end= '-' x 50;
print "$end \n";
@len_node= sort {$b <=> $a} @len_node; #For sorting in ascending order, we use (sort {$a <=> $b} @len;)
@len_contig= sort {$b <=> $a} @len_contig;
$large_node= $len_node[0];
print "Largest node in the Graph file= $large_node \n";
$large_contig= $len_contig[0];
print "Largest contig in the contigs.fa file= $large_contig \n";
$end= '-' x 50;
print "$end \n";
$short_node= $len_node[-1];
print "Shortest node in the Graph file= $short_node \n";
$short_contig= $len_contig[-1];
print "Shortest contig in the contigs.fa file= $short_contig \n";
$end= '-' x 50;
print "$end \n";
print "Total number of residues in the Graph file (from all the nodes)= $total_node \n";
print "Total number of residues in the contigs.fa file= $total_contig \n";
$end= '-' x 50;
print "$end \n";
$half_node= $total_node/2;
print "Half the number of residues in the Graph file (from all the nodes)= $half_node \n";
$half_contig= $total_contig/2;
print "Half the number of residues in the contigs.fa file= $half_contig \n";
$end= '-' x 50;
print "$end \n";
foreach $l(@len_node)
{
$sum_node += $l;
if ($sum_node<$half_node)
{ $count_node++; }
else
{ last; }
}
$n50_node= $len_node[$count_node];
print "N50 value of the assembly in the Graph file= $n50_node \n";
foreach $l(@len_contig)
{
$sum_contig += $l;
if ($sum_contig<$half_contig)
{ $count_contig++; }
else
{ last; }
}
$n50_contig= $len_contig[$count_contig];
print "N50 value of the assembly in the contigs.fa file= $n50_contig \n";
$end= '-' x 50;
print "$end \n";