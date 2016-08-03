# this script generate chimeric genome by cat hg38 and mm10

#mm10_fa="/labshares/fanlab/anqin/REF/MM10/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa"
#hg38_fa="/labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa"

#sh ./add_tag_to_fa.sh ${mm10_fa} mm10 > mm10_prefixed.fa

#sh ./add_tag_to_fa.sh ${hg38_fa} hg38 > hg38_prefixed.fa

cat hg38_prefixed.fa mm10_prefixed.fa > chimeric_hg_mm.fa

bwa index chimeric_hg_mm.fa -p hg38_mm10_human_first_chimeric
