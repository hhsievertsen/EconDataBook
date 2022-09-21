library(tidyverse)
library(readxl)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data Maddison Project Data 2020
gdppc<-read_excel("mpd2020.xlsx",sheet="Full data")

# Filter data only for United Kingdom
gdppc<-select(gdppc, country,gdppc,year)
gdppc_uk<-filter(gdppc, str_detect(country, "United Kingdom"))
gdppc_uk <-drop_na(gdppc_uk)

# Create linechart
ggplot(gdppc_uk,aes(x=year,y=gdppc))+
  labs(x="Year", y="Real GDP per capita in 2011$",caption = "Data source: Maddison Project Database 2020")+
  geom_line(size=0.6)+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.y= element_line(colour = "grey", size = 0.5))+
  theme(panel.grid.minor.y =element_blank())+
  theme(panel.grid.major.x = element_blank())+
  theme(panel.grid.minor.x = element_blank())+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(0,40000))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"))
ggsave("fig1.png")