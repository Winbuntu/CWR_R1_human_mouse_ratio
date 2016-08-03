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



#Test with 15F, CWR-R1 shallow sequencing data

data: 15F-01-05

##Re-process shallow mapped data, see if can reproduce the figure

Old data, mm10-hg38 index, still wired peaks.

# Re-ru the task with old code

```
sh ./print_chromosome_reads.sh
```
	
```
# use a different flag here. This gives you unique mapped reads
samtools view -q 10 15F-01-05_CAGATC_L001_R1_001.fastq.gz_sorted.bam ${line} |wc -l
```
The figure become good when quickly go through 15F data.

Re-run with 16C-1 data.

16C-1 data is not good. 

**Finalize the figure use old data and old code.**