# hicproraw-to-hicexp #

Import a [HiC-Pro](http://nservant.github.io/HiC-Pro/) raw `.matrix` and `.bed` of any resolution into R and generate a `hicexp` object.


## Description ##

HiC-Pro raw matrices are in a sparse upper-triangular format, however they are output as two plain text files: a `.matrix` and a `.bed`.

The `hicpro2bedpe` function from [HiCcompare](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2288-x) is used to produce a sparse upper-triangular matrix in BEDPE format, which is required as input by [multiHiCCompare](https://academic.oup.com/bioinformatics/article-abstract/35/17/2916/5298730?redirectedFrom=fulltext).


## References ##

- [multiHiCcompare vignette](https://bioconductor.org/packages/devel/bioc/vignettes/multiHiCcompare/inst/doc/multiHiCcompare.html#using-data-from-hic-pro)
