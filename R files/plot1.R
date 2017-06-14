##COURSE 4: EDA
##PROJECT 1 - plor1.R


#Please save the file in your current working directory.
#EPC - Electric Power Consumption

#Read data from 2007-02-01 and 2007-02-02
EPC <- read.table("household_power_consumption.txt", sep = ";", col.names =
        c("Date", "Time", "GAP", "GRP","Voltage", "GInt", "Sub_Met1", 
          "Sub_Met2","Sub_Met3"), skip = grep("31/1/2007;23:59:00", readLines(
                  "household_power_consumption.txt")), nrows = 2880,
        stringsAsFactors = FALSE)

#CONCATENATE DATE AND TIME
EPC$DateTime <- with(EPC, as.POSIXct(paste(Date,Time),
                                     format="%d/%m/%Y %H:%M:%S"))

EPC <- EPC[c("DateTime", "Time", "GAP", "GRP","Voltage", "GInt", "Sub_Met1", 
             "Sub_Met2","Sub_Met3","Date","Time")]

library(dplyr)
EPC <- select(EPC,DateTime:Sub_Met3)
par(mar = c(4,4,4,2))
hist(EPC$GAP, main = "Global Active Power", xlab ="Global Active Power (kilowatts)",
     col = "Red")
dev.copy(png, file = "Plot1.png", width = 480, height = 480) #copy my plot1 to a png file
dev.off() #close the png device


