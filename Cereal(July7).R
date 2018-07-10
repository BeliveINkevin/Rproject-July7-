library(readr)
#cereal_uncleaned will refer to the uncleaned dataset and "cereal" refers to the "cleaned" dataset
cereal_uncleaned<-read_csv("C:/Users/kevin/Downloads/cereal.csv") #Note that I took the XXXXX https://perso.telecom-paristech.fr/eagan/class/igr204/datasets

#Data Cleaning. Locate the rows with NA's in them
is.na(cereal_uncleaned)# Rows 28,45, and 46 have all NA's in them
#Note: since muesli raisins, fruit/fiber dates, and Oatmeal products are not considered to be "Cereal".
#I will delete these rows; also protein,fat,weight,shelflife, and cups are irrevalent to the purpose of my analysis
#because those numbers are not that significant to the analysis, I will delete those columns
cereal<-cereal_uncleaned[-c(21,28,44:46,58),-c(5,6,13,14,15)]
max(cereal$calories) #Mueslix crispy blend, puff rice and puff wheat
min(cereal$calories) #all bran with extra fiber
is.na(cereal)
install.packages("dplyr")
library(dplyr) #I am going to be subsetting the rows based on manufacturer
man_n<-dplyr::filter(cereal,Manufacturer=='N')
man_q<-dplyr::filter(cereal,Manufacturer=='Q')
man_k<-dplyr::filter(cereal,Manufacturer=='K')
man_r<-dplyr::filter(cereal,Manufacturer=='R')
man_g<-dplyr::filter(cereal,Manufacturer=='G')
man_p<-dplyr::filter(cereal,Manufacturer=='P')

below100<-cereal[cereal$calories<=100,] #This refers to cereals below 100cals per serving
above100<-cereal[cereal$calories>100,] #this refers to cereals above 100cals per serving
install.packages("ggplot2")
library(ggplot2)
a<-ggplot(data=below100,aes(x=calories,y=rating))
a+geom_smooth(model=lm)
b<-ggplot(data=above100,aes(x=calories,y=rating))
b+geom_smooth(model=lm)
c<-ggplot(cereal,aes(rating,calories))
c+geom_jitter()
ggplot(cereal, aes(x = calories, y = rating, colour = Manufacturer)) +
  geom_point() +
  facet_wrap( ~ Manufacturer)
