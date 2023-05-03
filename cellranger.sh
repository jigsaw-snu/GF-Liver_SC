# cellranger count result will be made under the directory you run this code

CR=/home/lsg239/tools/cellranger-7.1.0/bin/cellranger
FASTQ=/data2/lsg239/HN00189091/HN00189091_10X_RawData_Outs
CROUT=/data2/lsg239/HN00189091/CellRanger_Out
REF=/data2/lsg239/ref/cellranger-ref/refdata-gex-mm10-2020-A

SAMPLES="
GF_HC_1
GF_HC_2
GF_HC_3
GF_NPC_1
GF_NPC_2
GF_NPC_3
SPF_HC_1
SPF_HC_2
SPF_HC_3
SPF_NPC_1
SPF_NPC_2
SPF_NPC_3
"

# Flow Cell-1 : HJLGGCCX2, Flow Cell-2 : HJLJ3CCX2

for sample in ${SAMPLES}; do
	${CR} count --id=${sample}_CR \
				--fastqs=${FASTQ}/${sample}/HJLGGCCX2,${FASTQ}/${sample}/HJLJ3CCX2 \
				--sample=${sample} \
				--transcriptome=${REF} \
				--expect-cells=8000 \
				--localcores=92 \
				--localmem=500

	echo ${sample} process done!
done
