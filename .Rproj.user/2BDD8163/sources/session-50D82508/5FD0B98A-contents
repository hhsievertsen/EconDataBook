library(tidyverse)
library(readxl)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data from World Inequality Database
Income_Share<-read_excel("Income Share.xlsx")

# Plot graph
ggplot(data=Income_Share,aes(x=Year,y=Share,colour=Percentile))+
  geom_line(size=1)+
  labs(x="Year",
       y="Income Share",
       caption="Data source: World Inequality Database")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"),
        legend.position="top",legend.key =element_rect(fill="white") )+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=5),limits = c(0,0.25))
  


ggsave("fig1.png")