# this script count unique mapped reads on each chromosome

# USEAGE: sh ./get_unique_mapped_count.sh > output.txt

while read line
do

echo $line `samtools view  -f 4 16C-1_S101_L008_R1_001.fastq.gz_sorted.bam ${line}| wc -l`

done < chr.names.txt 
