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
	
## R script to plot

1. Download chromosome length information to normalize read count
	
	[hg38 chromosome sizes file from UCSC](https://genome.ucsc.edu/goldenPath/help/hg38.chrom.sizes)
	
	[mm10 chromosome sizes file from UCSC](http://hgdownload.cse.ucsc.edu/goldenPath/mm10/bigZips/mm10.chrom.sizes)
	
	Total mapped reads, mm10.chr9 and mm10.chr2 has wired 2fold depth then others. Try use unique mapped reads.
	
1. Generate unique mapped reads table:
	
	* output chromosome names list **chr.names.txt**
	* shell script **get\_unique\_mapped\_count.sh**

	* Unique mapped reads not works well.