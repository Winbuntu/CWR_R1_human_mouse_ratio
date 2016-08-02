# this script generate chimeric genome by cat hg38 and mm10

mm10_fa="/labshares/fanlab/anqin/REF/MM10/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa"
hg38_fa="/labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa"

sh ./add_tag_to_fa.sh ${mm10_fa} mm10 > mm10_prefixed.fa

sh ./add_tag_to_fa.sh ${hg38_fa} hg38 > hg38_prefixed.fa

cat mm10_prefixed.fa hg38_prefixed.fa > chimeric.fa

bwa index chimeric.fa -p hg38_mm10_chimeric
