library(tidyverse)
library(readxl)
library(zoo)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")


# Load Data from Eurostat
HICP<-read_excel("HICP.xlsx",sheet="R")

# Tidy data
HICP$Value<-as.numeric(HICP$Value)
HICP<-drop_na(HICP)
HICP$Time<-as.Date(as.yearmon(HICP$Time))
HICP$Time<-as.Date(HICP$Time,"%Y-%m-%d")

# Plot graph
ggplot(HICP,aes(x=Time,y=Value,colour=Country))+
  geom_line(size=1)+
  labs(x="Year",y="HICP (2015=100)",caption = "Data source: Eurostat (HICP - monthly data (index))")+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(60,120))+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"),
        legend.position="top",legend.key =element_rect(fill="white") )

ggsave("ex1_1.png")
  