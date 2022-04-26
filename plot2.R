library(readr)
HPC <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")
head(HPC)

HPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
HPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

SubHPC <- HPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


# Plot 2

png("plot2.png", width=480, height=480)

plot(x = SubHPC[, dateTime]
     , y = SubHPC[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

