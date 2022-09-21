library(tidyverse)
library(readxl)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data OECD (1. Gross domestic product (GDP)  : GDP, volume – annual growth rates in percentage)
Growth_rates<-read_excel("Growth rates.xlsx",sheet="R")

# Select only the columns that were interested in
Growth_rates$Time<-Growth_rates$TIME
Growth_rates<-select(Growth_rates,Time, Value)

Growth_rates$Sign <- factor(sign(Growth_rates$Value), (-1):1, c("Brown1", "neutral", "Palegreen4"))

ggplot(Growth_rates,aes(x=Time,y=Value))+
  geom_bar(stat="identity",fill=Growth_rates$Sign,show.legend = FALSE)+
  labs(x="Year",
       y="Growth rate (%)",
       caption="Data source: OECD")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(-10,10))+
  theme(axis.text.x = element_text(colour = "black"))

ggsave("fig10.png")