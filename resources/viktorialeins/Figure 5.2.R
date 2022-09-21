library(tidyverse)
library(readxl)
library(ggrepel)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data from Eurostat
Life_Quality<-read_excel("Life quality.xlsx",sheet="R")
GDP<-read_excel("GDP in 2018 PPS.xlsx",sheet ="R")

# Tidy data
data<- merge(Life_Quality,GDP,by="Country")
data <- rename(data,GDP=Value)

# Plot graph
ggplot(data, aes(x=GDP,y=Life_sat))+
  geom_point()+
  labs(x="GDP per capita in 2018 PPS (EU27=100)",
       y="Overall life satsfaction ranking (1-10)",
       caption="Data source: Eurostat")+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(0,10))+
  scale_x_continuous(expand=c(0,0),breaks = scales::extended_breaks(n=10),limits = c(0,300))+    
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"))+
  geom_label_repel(data=subset(data, Life_sat ==5.4|Country=="Albania"|Country=="Ireland"|Country=="United Kingdom"|Country=="Luxembourg"),aes(label=Country),min.segment.length=unit(0,"lines"),nudge_y=6)
  
  
ggsave("fig1.png")