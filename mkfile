# DESCRIPTION:
# mk module to create a bedpe R object
# from a .matrix file and a .bed file 
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/mk-targets`
#
# Multiple target execution in tandem `bin/mk-targets | xargs mk`
#
# AUTHOR: HRG
#
# Run R script to produce matrices in bedpe format.
#
results/%.bedpe.Rdata:	data/%.matrix data/%_abs.bed
	mkdir -p `dirname $target`
	bin/generate-hicexp.R \
		--vanilla \
		$prereq

