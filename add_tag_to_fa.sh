# add mm10 or hg38 pre-fix into chrN, so chromosome name will be unique after cat hg38 and mm10

# HOW TO RUN: 
# sh ./add_tag_to_fa.sh ${genome.fa} ${pre-fix} > ${name_to_save}.fa

# Hg38 path
# /labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta

#

cat ${1} | sed "s/^>/>${2}./"
