library(tidyverse)
library(readxl)
library(zoo)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")


# Load Data from Eurostat
HICP2<-read_excel("HICP2.xlsx",sheet="R")

# Tidy data
HICP2$Value<-as.numeric(HICP2$Value)
HICP2<-drop_na(HICP2)
HICP2$Time<-as.Date(as.yearmon(HICP2$Time))
HICP2$Time<-as.Date(HICP2$Time,"%Y-%m-%d")

# Plot graph
ggplot(HICP2,aes(x=Time,y=Value,colour=Country))+
  geom_line(size=1)+
  labs(x="Year",y="Inflation (in percent)",caption = "Data source: Eurostat (HICP - monthly data (12-month average rate of change))")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"),
        legend.position="top",legend.key =element_rect(fill="white") )+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(-3,6))+
  geom_abline(intercept=0,slope=0)

ggsave("ex1_2.png")

