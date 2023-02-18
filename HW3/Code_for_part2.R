install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggrepel")
library(tidyverse)
library(ggplot2)
library(ggrepel)

cropsdata<- read.csv(file.choose(), header=T)
cropsdata
number_years <- c(1987, 1992, 1997,2002,2007,2012)
ggplot(cropsdata, aes(x = Year)) +
  geom_line(aes(y = Wheat), color = "chartreuse3", size = 1.3)+
  geom_line(aes(y = Cotton), color = "darkorange2", size = 1.3)+
  geom_line(aes(y = Rice), color = "azure4", size = 1.3)+
  geom_line(aes(y = Corn), color = "deepskyblue4", size = 1.3)+
  geom_line(aes(y = Soybeans), color = "darkgoldenrod1", size = 1.3)+
  theme(axis.text.y=element_blank())+theme_minimal()+
  labs(title = "Midpoint acreage for major field crops, 1987-2012",
       subtitle = "Midpoint acreages more than doubled for all five major field crops")+
  theme(plot.title = element_text(face = "italic",color = "black"))+
  geom_text(x = 2012, y = 1000+30, label="Wheat", color ="chartreuse3", check_overlap=T)+
  geom_text(x = 2012, y = 970-20, label ="Cotton", color = "Darkorange2",check_overlap=T)+
  geom_text(x = 2012, y = 800+20, label ="Rice", color = "azure4",check_overlap=T)+
  geom_text(x = 2012, y = 633+20, label ="Corn", color = "deepskyblue3",check_overlap=T)+
  geom_text(x = 2012, y = 567+20, label ="Soybeans", color = "darkgoldenrod1",check_overlap=T)+
  ylab(" ")+scale_y_continuous(breaks = seq(0, 1200, 200))+
  scale_x_discrete(limits = number_years)





