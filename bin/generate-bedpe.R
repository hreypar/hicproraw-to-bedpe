#!/usr/bin/env Rscript
#
# hreyes Jan 2020
# generate-bedpe.R
#
# Read in a raw matrix (output from HiC-Pro) and format it to generate a bedpe object
#
#
#################### import libraries and set options ####################
library(magrittr)
library(purrr)
library(dplyr)
library(HiCcompare)
#
options(scipen = 10)
#
########################## read in data ###################################
args = commandArgs(trailingOnly=TRUE)
#
#
args[grepl(".matrix", args)]  %>% 
  read.table() -> hicpro_matrix
#
args[grepl("_abs.bed", args)] %>% 
  read.table() -> hicpro_bed 
#
out_bedpe_path = args[grepl("bedpe", args)]
#
########################## call hicpro2bedpe ##############################
outfile <- hicpro2bedpe(mat = hicpro_matrix, bed = hicpro_bed)
#
#rm(hicpro_matrix, hicpro_bed)
#
########### select only cis interactions and bind the chromosomes #########
outfile %<>%
  pluck("cis") %>%
  within(rm("chrY")) %>%
  bind_rows() %>%
  droplevels()
#
################  then you save the object and that's that ################
saveRDS(outfile, file = out_bedpe_path)
