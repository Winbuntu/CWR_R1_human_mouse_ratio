#Get human/mouse cfDNA ratio
Working path: 

juno: /labshares/fanlab/anqin/cfDNA_project/CWR_R1_human_mouse_ratio

Data file: 16C-1

## Build human mouse chimeric genome

1. Download hg38 & mm10 genome
	
	from iGenome project
1. Add prefix to chromosome name: use **add\_tag\_to\_fa.sh**
1.  Cat hg38 & mm10 
1.  Build BWA index
	
	Step 2-4 are in **generate\_chimeric\_genome.sh** 

## Map data and count read num per chromosome
1. Map fastq using BWA mem
1. Count
	 	
	Step 5-6 are in **Map\_and\_count.sh**
	
	