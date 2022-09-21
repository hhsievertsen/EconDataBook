library(tidyverse)
library(readxl)
library(zoo)

# set working directory
setwd("C:\\Users\\hs17922\\Downloads\\Economic Data for UOB Students Handbook")

# Load Data from Bank of England
Policy_interest_rate <- read_excel ("Bank of England Database (IUMTLMV).xlsx")
Bank_rate <- read_excel("Bank of England Database (IUMABEDR).xlsx")

#Tidy data
Policy_interest_rate$Date<-as.Date(as.yearmon(Policy_interest_rate$Date))
Policy_interest_rate$Date<-as.Date(Policy_interest_rate$Date,"%d-%m-%Y")

Bank_rate$Date<-as.Date(as.yearmon(Bank_rate$Date))
Bank_rate$Date<-as.Date(Bank_rate$Date,"%d-%m-%Y")

Interest_rates <- merge(Policy_interest_rate,Bank_rate,by="Date")

# Calculate Difference
Interest_rates <- Interest_rates %>%
  mutate(difference= Policy_interest_rate-Bank_rate)

# Plot Graph
ggplot(Interest_rates,aes(x=Date,y=difference))+
  geom_line(size=1, colour = "Maroon2")+
  labs(x="Years",
       y="Interest rate gap (percent points)",
       caption="Data source: Bank of England Database")+
  theme(panel.background = element_rect(fill="white"))+
  theme(axis.line = element_line(colour = "black"))+
  theme(panel.grid.major.x = element_blank(),panel.grid.major.y = element_line(size=.1, color="grey"))+
  theme(axis.text.y = element_text(colour = "black"))+
  theme(axis.text.x = element_text(colour = "black"))+
  scale_y_continuous(expand=c(0,0),breaks=scales::extended_breaks(n=10),limits = c(0,5))

ggsave("ex4_3.png")