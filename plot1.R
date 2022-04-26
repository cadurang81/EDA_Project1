library(readr)
HPC <- read_delim("household_power_consumption.txt", 
                  delim = ";", escape_double = FALSE, trim_ws = TRUE)
head(HPC)
SubHPC <- subset(HPC,HPC$Date=="1/2/2007" | HPC$Date =="2/2/2007")

# Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(SubHPC$Global_active_power)),col = "red",
     main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()


