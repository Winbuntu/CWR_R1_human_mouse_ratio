# This script count how many reads mapped on each chromosome

#USEAGE: sh ./per_chromosome_count.sh ${bam_to_count} > file to save result

# should index the bam file first



if [ ! -f "${1}.bai" ]; then  

	samtools index ${1}

fi

# count reads 

samtools idxstats ${1}
