library(tidyverse)
library(readxl)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data OECD
working_hours<-read_excel("Working hours.xlsx",sheet="Sheet1")

# Create chart
ggplot(working_hours,aes(x=Time,y=Value,colour=Gender,linetype=Region))+
  geom_line(size=1)+
  scale_colour_manual(values=c("Cornflowerblue","Deeppink2"))+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.y= element_line(colour = "grey", size = 0.5))+
  theme(panel.grid.minor.y =element_blank())+
  theme(panel.grid.major.x = element_blank())+
  theme(panel.grid.minor.x = element_blank())+
  labs(x="Year", y="Average usual weekly work hours",caption = "Data source: OECD (Average usual weekly hours worked on the main job)")+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(30,44))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"),
        legend.position="top",legend.key =element_rect(fill="white") )
  
  
ggsave("fig17.png")  
  
