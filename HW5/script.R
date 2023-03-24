# necessary libraries imported 
library(ggplot2) 
library(tidyverse)
library(scales)
# i used read.csv to link csv file 
censusdata <- read.csv(file.choose(), header=T)
# This wil show the dataset structure. 
head(censusdata)

CENSUS2010POP = data.frame(glyphs='CENSUS2010POP', value=censusdata$CENSUS2010POP) 
POPESTIMATE2015 = data.frame(glyphs = 'POPESTIMATE2015', value=censusdata$POPESTIMATE2015)
POPESTIMATE2019 = data.frame(glyphs = 'POPESTIMATE2019', value=censusdata$POPESTIMATE2019)                   

# To assign all the required columns as glyphs in a single chart

plot.data = rbind(CENSUS2010POP, POPESTIMATE2015, POPESTIMATE2019) 

# To change the shape of the data-frame to have 3 rows

Box_glyphs<- ggplot(plot.data, aes(x=glyphs, y=value, fill=glyphs))+geom_boxplot()+
labs(x = " Separate boxplot glyphs in single chart",y = "Population distribution of all counties")+
  
  # Naming the x and y axes.
  
  theme_bw()+
  theme(legend.position = "none")+
  scale_fill_brewer(palette="Dark1")+
  
  # Giving colors to fill the glyphs with using RColorBrewer palette.
  
  scale_y_continuous(trans = log10_trans(),
                     breaks = trans_breaks("log10", function(x) 10^x),
                     labels =trans_format("log10",math_format(10^.x)))+
  
  # As the range of values of the population is very large,
  # scaling them using log10 to show the y axis scale as exponents of 10.
  # This gives a good view of the boxes and whiskers.
  
  labs(title = 'Census of 2010 with estimated population distribution in 2015 and 2019')+
  theme(plot.title = element_text(face = "bold"))

# Assigning title to the chart.


print(Box_glyphs) 

# ecdf
eCDF<-ggplot(censusdata, aes(CENSUS2010POP))+stat_ecdf(geom="point", pad=FALSE, color="cyan")+
  
  labs(x = "Distribution of the population of all counties",y = "Range",face =c("plain"), inherit.aes = FALSE)+theme_bw()+
  
  scale_x_continuous(trans = log10_trans(),breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))+
  
  labs(title = 'Distribution of the population of all counties in 2010 Census')+theme(plot.title = element_text(face = "bold"))

print(eCDF)

#histogram
HSGM_vis<-ggplot(censusdata, aes(x=CENSUS2010POP))+theme_bw()+geom_histogram(binwidth=0.5,color="grey", fill="seagreen")+
  
  scale_x_continuous(trans = log10_trans(),breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))+
  
  labs(x = "bins",y = "Distribution of population of all counties",face =c("plain"))+labs(title = 'Distribution of population of all counties in 2010 Census')+theme(plot.title = element_text(face = "bold"))

print(HSGM_vis)

##Part 2

#histogram
HSGM_vis<-ggplot(censusdata, aes(x=CENSUS2010POP))+theme_bw()+geom_histogram(binwidth=0.1,color="grey", fill="orange")+
  
  scale_x_continuous(trans = log10_trans(),breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))+
  
  labs(x = "bins",y = "Distribution of the population of all counties",face =c("plain"))+labs(title = 'Distribution of the population of all counties in 2010 Census')+theme(plot.title = element_text(face = "bold"))

print(HSGM_vis)

#histogram
HSTGM_vis<-ggplot(censusdata, aes(x=CENSUS2010POP))+theme_bw()+geom_histogram(binwidth=0.9,color="grey", fill="orange")+
  
  scale_x_continuous(trans = log10_trans(),breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))+
  
  labs(x = "bins",y = "Distribution of the population of all counties",face =c("plain"))+labs(title = 'Distribution of the population of all counties in 2010 Census')+theme(plot.title = element_text(face = "bold"))

print(HSTGM_vis)

