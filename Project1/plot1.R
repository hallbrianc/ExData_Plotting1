library(tidyverse)
setwd("/Users/brianhall/Desktop/Git/Coursera/courses/04_ExploratoryAnalysis/")

power.df <- read_delim("./household_power_consumption.txt",
                       delim=";",
                       col_types = list("c","t","d","d","d","d","d","d","d"),
                       na="?") %>%
            data.frame() %>%
            mutate(Date=as.Date(Date,format="%d/%m/%Y")) %>%
            filter(Date >= "2007-02-01" & Date <= "2007-02-02")

hist(power.df$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.copy(png, 
         file = "./ExData_Plotting1/Project1/plot1.png",
         width=480,
         height=480)
dev.off()
