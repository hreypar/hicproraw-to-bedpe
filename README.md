# hicproraw-to-bedpe #

Import a [HiC-Pro](http://nservant.github.io/HiC-Pro/) raw `.matrix` and `.bed` of any resolution into R and generate a `.bedpe.Rdata` object.


## Description ##

HiC-Pro raw matrices are in a sparse upper-triangular format, however they are output as two plain text files: a `.matrix` and a `.bed`

The [`hicpro2bedpe`](https://rdrr.io/bioc/HiCcompare/man/hicpro2bedpe.html) function from [HiCcompare](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2288-x) is used in this module to produce a sparse upper-triangular matrix in [BEDPE format](https://bedtools.readthedocs.io/en/latest/content/general-usage.html#bedpe-format), which is required as input by [multiHiCCompare](https://academic.oup.com/bioinformatics/article-abstract/35/17/2916/5298730?redirectedFrom=fulltext).



## References ##

- [multiHiCcompare vignette](https://bioconductor.org/packages/devel/bioc/vignettes/multiHiCcompare/inst/doc/multiHiCcompare.html#using-data-from-hic-pro)


## Acknowledgements ##

- This [SO post](https://stackoverflow.com/questions/4675755/how-to-save-with-a-particular-variable-name?rq=1) exemplifying how to save an object when its name is in a string variable was originally used, however [saveRDS()](https://www.r-bloggers.com/how-to-save-and-load-datasets-in-r-an-overview/) was later favoured.


## Author ##

[Helena Reyes Gopar](mailto:hreyes@inmegen.edu.mx)

 
