library(tidyverse)
library(readxl)

# set working directory
setwd("C:/Users/leins/Desktop/Research Assistant/Economic Data")

# Load Data from ONS
ONS<-read_excel("Unemployment rate.xlsx")
ONS$Year<-as.numeric(ONS$Year)

# Plot graph
ggplot(ONS,aes(x=Year,y=Unemployment))+
  geom_line(size=0.75)+
  labs(x="Year",
       y="Unemployment rate (%)",
       caption="Data source: Office for National Statistics")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"))+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(0,12))
