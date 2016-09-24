#produce salmon indexes of flybase transcripts, transposons, and ERCCs for quasi mapping and quantification
salmon index -p 4 -t ~/annotations/dmel_r6.12_trnscpt_trnspsn_ercc.fasta  -i ~/annotations/salmon_index_23 --type quasi -k 23
salmon index -p 4 -t ~/annotations/dmel_r6.12_trnscpt_trnspsn_ercc.fasta  -i ~/annotations/salmon_index_27 --type quasi -k 27
salmon index -p 4 -t ~/annotations/dmel_r6.12_trnscpt_trnspsn_ercc.fasta  -i ~/annotations/salmon_index_31 --type quasi -k 31

for i in /Volumes/Untitled/rna_sov/Sample_*/
do
	FILE=${i#/Volumes/Untitled/rna_sov/}
	FILE=${FILE%/}
	mkdir ~/sov_data_files/${FILE}
	mkdir ~/sov_data_files/${FILE}/salmon_23_quant
	mkdir ~/sov_data_files/${FILE}/salmon_27_quant
	mkdir ~/sov_data_files/${FILE}/salmon_31_quant
	salmon quant -p 4 -i ~/annotations/salmon_index_23/ -l SR -r ${i}*fastq -o ~/sov_data_files/${FILE}/salmon_23_quant
	salmon quant -p 4 -i ~/annotations/salmon_index_27/ -l SR -r ${i}*fastq -o ~/sov_data_files/${FILE}/salmon_27_quant
	salmon quant -p 4 -i ~/annotations/salmon_index_31/ -l SR -r ${i}*fastq -o ~/sov_data_files/${FILE}/salmon_31_quant
	fastqc -o ~/sov_data_files/fastqc_files ${i}*fastq
done





