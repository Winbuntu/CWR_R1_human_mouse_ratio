while read line
do
count=`samtools view -q 10 15F-01-05_CAGATC_L001_R1_001.fastq.gz_sorted.bam ${line} |wc -l`

echo ${line} ${count}

done<chr.names.txt
