library(readr)
HPC <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?")
head(HPC)

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

SubHPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Plot 3

png("plot3.png", width=480, height=480)

plot(SubHPC[, dateTime], SubHPC[, Sub_metering_1], type = "l", xlab = "", 
     ylab="Energy sub metering")
lines(SubHPC[, dateTime], SubHPC[, Sub_metering_2],col = "red")
lines(SubHPC[, dateTime], SubHPC[, Sub_metering_3],col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
