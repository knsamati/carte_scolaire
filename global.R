library(rgdal)
jardin<-read.csv2("data/jardin.csv",header=T,sep=";")
primaire<-read.csv2("data/primaire.csv",header=T,sep=";")
college<-read.csv2("data/college.csv",header=T,sep=";")
lycee<-read.csv2("data/lycee.csv",header=T,sep=";")

carto<-readOGR("data","TGO_l05_2012")

