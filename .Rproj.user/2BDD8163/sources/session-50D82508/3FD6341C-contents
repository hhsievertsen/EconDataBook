library(tidyverse)
library(readxl)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")


# Load Data from Eurostat
Gini<-read_excel("Gini coefficient.xlsx",sheet="R")


#Plot graph
ggplot(Gini,aes(x=reorder(Country,Gini),y=Gini))+
  geom_bar(stat="identity",aes(fill=Gini))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  geom_hline(yintercept=filter(Gini,Country=="EU27")$Gini[1])+
  geom_text(aes(x=4,y=32),label="EU27 = 30")+
  labs(x="Country",
       y="Gini coeffiecient",
       caption="Data source: Eurostat")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(0,45))+
  scale_x_discrete(expand=c(0,0))+
  scale_fill_gradient2(low='deeppink1', mid='gold1', high='brown2')+
  theme(axis.text.x = element_text(colour = "black"))



ggsave("ex7.png")


