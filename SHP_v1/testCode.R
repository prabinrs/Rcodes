#load libraries 
library(tidyverse)
library(sjPlot)

#loading Datap
shReg<-read.csv("~/R/SHP_V1/Data/SH_registration.csv")
shDetails<-read.csv("~/R/SHP_V1/Data/school_details.csv")
chReg<-read.csv("~/R/SHP_v1/Data/child_register.csv")
chStoolResults<-read.csv("~/R/SHP_v1/Data/stool_results.csv")
chDetail<-read.csv("~/R/SHP_v1/Data/school_child_que.csv")
waterResults<-read.csv("~/R/SHP_v1/Data/water_results.csv")
washMeasurement<-read.csv("~/R/SHP_v1/Data/")

#Data Qulaity and Data Manupulation
sjmisc::descr(shReg, out = "browser")
sjmisc::descr(shDetails, out = "browser")
sjmisc::descr(chReg, out = "browser")
sjmisc::descr(chStoolResults, out = "browser")
sjmisc::descr(chDetail, out="browser")
sjmisc::descr(waterResults, out = "browser")

#Discriptive Statistics 
sjt.frq(shReg$form.address.SH_Districts)
sjt.frq(shDetails$form.schoolFacilities.toiletFacilities)
sjt.frq(shDetails$form.schoolFacilities.first_aid_facilitiybox)
sjt.frq(shDetails$form.schoolFacilities.playground)
