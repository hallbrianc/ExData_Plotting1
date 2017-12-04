library(tidyverse)
setwd("/Users/brianhall/Desktop/Git/Coursera/courses/04_ExploratoryAnalysis/")

power.df <- read_delim("./household_power_consumption.txt",
                       delim=";",
                       col_types = list("c","t","d","d","d","d","d","d","d"),
                       na="?") %>%
            data.frame() %>%
            mutate(Date=as.Date(Date,format="%d/%m/%Y")) %>%
            filter(Date >= "2007-02-01" & Date <= "2007-02-02")

par(mfrow=c(2,2),cex=0.8)
plot(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
plot(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Every sub meeting")
lines(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Sub_metering_2,
     col="red")
lines(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Sub_metering_3,
      col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n",
       cex=0.8)
plot(strptime(as.character(paste0(power.df$Date," ",power.df$Time)),format="%Y-%m-%d %H:%M:%S"),power.df$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


dev.copy(png, 
         file = "./ExData_Plotting1/Project1/plot4.png",
         width=480,
         height=480)
dev.off()
