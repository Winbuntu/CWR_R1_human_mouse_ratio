if [ ! -d "/tmp" ]; then
  mkdir /tmp
fi

# alignment $1 is first pair , $2 is second pair
# $3 is name, a number

# chimeric genome.fa path

chi_fa="/labshares/fanlab/anqin/cfDNA_project/CWR_R1_human_mouse_ratio/hg38_mm10_chimeric" 

bwa mem  -t 16  ${chi_fa}  ${1} ${2} > ${1}_bwa_align.sam

samtools view -bS ${1}_bwa_align.sam | samtools sort -@ 16 - ${1}_sorted

samtools index ${1}_sorted.bam

sh ./per_chromosome_count.sh ${1}_sorted.bam > ${1}_per_chro_read_count.txt  
