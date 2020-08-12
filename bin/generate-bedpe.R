#!/usr/bin/env Rscript
#
# hreyes Jan 2020
# generate-bedpe.R
#
# Read in a raw matrix (output from HiC-Pro) and format it to generate a bedpe object
#
#
#################### import libraries and set options ####################
suppressMessages(library(magrittr))
suppressMessages(library(purrr))
suppressMessages(library(dplyr))
suppressMessages(library(HiCcompare))
message("\nRequired libraries have been loaded.")
#
options(scipen = 10)
#
########################## read in data ###################################
args = commandArgs(trailingOnly=TRUE)
#
#
args[grepl(".matrix", args)]  %>% 
  read.table() -> hicpro_matrix
message("The matrix file has been read.")
#
args[grepl("_abs.bed", args)] %>% 
  read.table() -> hicpro_bed
message("The corresponding bed file has been read.") 
#
out_bedpe_path = args[grepl("bedpe", args)]
#
########################## call hicpro2bedpe ##############################
outfile <- hicpro2bedpe(mat = hicpro_matrix, bed = hicpro_bed)
message("The bedpe object has been generated.")
#
#rm(hicpro_matrix, hicpro_bed)
#
########### select only cis interactions and bind the chromosomes #########
outfile %<>%
  pluck("cis") %>%
  within(rm("chrY")) %>%
  bind_rows() %>%
  droplevels()
message("CIS Hi-C interactions have been selected.")
#
################  then you save the object and that's that ################
saveRDS(outfile, file = out_bedpe_path)
message("The bedpe object has been saved as an .Rds file.\n")

