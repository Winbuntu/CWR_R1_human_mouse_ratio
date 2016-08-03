while read line
do
count=`samtools view -q 10 16C-1_S101_L008_R1_001.fastq.gz_sorted.bam  ${line} |wc -l`

echo ${line} ${count} | tee -a "16C-1_S101_L008_R1_001.fastq.gz_sorted.bam_unique_count.txt" 

done<chr.names.txt
