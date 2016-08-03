library(ggplot2)

chr.count = read.table("16C-1_S101_L008_R1_001.fastq.gz_per_chro_read_count.txt",head=F)


chr.count.purified = chr.count[c(1:47),]



chr.count.purified$species = c( rep("mouse",22), rep("human",25) )

chr.count.purified = chr.count.purified[-c(20,47),]

chr.levels = c(
  paste("hg38.chr",c(1:22,"X","Y"),sep=""),
  paste("mm10.chr",c(1:22,"X","Y"),sep="")
)

# chr.count.purified 
# has un normalized read count


### generate un normalized bar plot.


p.unnormalized = ggplot(data=chr.count.purified, aes(x=factor(V1,levels = chr.levels), y=V3, fill = species)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_bw() + 
  ylab("mapped read count") + xlab("chromosomes")+ ggtitle("Read mapping among chimeric genome")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

ggsave(p.unnormalized,filename = "read_count_bar.unnormalized.pdf",width = 10,height=5)


### generate pie chart

# Pie Chart with Percentages, shows human and mouse and unmapped

slices= c(
 sum(  chr.count.purified$V3[substr(chr.count.purified$V1,1,4)=="mm10"]  ), # sum of mm10
 sum(  chr.count.purified$V3[substr(chr.count.purified$V1,1,4)=="hg38"]  ), # sum of hg38
 chr.count[218,4]
 )

lbls <- c("Mouse", "Human", "Unmapped")
pct <- round(slices/sum(slices)*100, digits=2)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 

pdf(file = "pie.chart.pdf",width = 8, height = 5)

pie(slices,labels = lbls,
    main="Pie Chart reads")

dev.off()



##### normalized read count bar plot

hg38.sizes = read.table("hg38.sizes.txt")
hg38.sizes.purified = hg38.sizes[c(1:24),]
hg38.sizes.purified$V1 = paste("hg38.",as.character(hg38.sizes.purified$V1),sep="")

mm10.sizes = read.table("mm10.sizes.txt")
mm10.sizes.purified = mm10.sizes[c(1:21),]
mm10.sizes.purified$V1 = paste("mm10.",as.character(mm10.sizes.purified$V1),sep="")



chro.size.label = NULL
chro.size = NULL

chro.size.label[match(hg38.sizes.purified$V1,as.character(chr.count.purified$V1))] = 
  hg38.sizes.purified$V1
chro.size.label[match(mm10.sizes.purified$V1,as.character(chr.count.purified$V1))] = 
  mm10.sizes.purified$V1


chro.size[match(hg38.sizes.purified$V1,as.character(chr.count.purified$V1))] = 
  hg38.sizes.purified$V2
chro.size[match(mm10.sizes.purified$V1,as.character(chr.count.purified$V1))] = 
  mm10.sizes.purified$V2

chr.count.purified$chr_size = chro.size

chr.count.purified$normalized_read_count = 
  chr.count.purified$V3/chr.count.purified$chr_size

p.Normalized = ggplot(data=chr.count.purified, aes(x=factor(V1,levels = chr.levels), y=normalized_read_count, fill = species)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_bw() + 
  ylab("mapped read count") + xlab("chromosomes")+ ggtitle("Read mapping among chimeric genome")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

ggsave(p.Normalized, filename = "read_count_bar.Normalized.pdf",width = 10,height=5)


#### bar plot with unique mapped reads

write.table(chro.size.label,file = "chr.names.txt",quote=F,row.names = F,col.names = F)

unique.read = read.table("unique_count.txt")

colnames(unique.read) = c("chrname1","uniq1")

chr.count.purified.unique = cbind(chr.count.purified,unique.read)

chr.count.purified.unique$unique_norm = chr.count.purified.unique[,9]/chr.count.purified.unique[,2]


p.Normalized.unique = ggplot(data=chr.count.purified.unique, aes(x=factor(V1,levels = chr.levels), y=unique_norm, fill = species)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_bw() + 
  ylab("mapped read count") + xlab("chromosomes")+ ggtitle("Read mapping among chimeric genome")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
p.Normalized.unique


### here use unique mapped read count from new data

old.code.count = read.table("15F-01-05_unque_read_count.txt")
colnames(old.code.count) = c("chrname1","uniq1")

chr.count.purified.unique.old.code = cbind(chr.count.purified,old.code.count)

chr.count.purified.unique.old.code$uniq1_normalized.by.length = 
  chr.count.purified.unique.old.code$uniq1/chr.count.purified.unique.old.code$V2

p.Normalized.unique.old.code = ggplot(data=chr.count.purified.unique.old.code, aes(x=factor(V1,levels = chr.levels), y=uniq1_normalized.by.length, fill = species)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_bw() + 
  ylab("mapped read count") + xlab("chromosomes")+ ggtitle("Read mapping among chimeric genome")+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
p.Normalized.unique.old.code

