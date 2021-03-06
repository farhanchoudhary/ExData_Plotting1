# Coursera Data Science Specialization: Exploratory Data Analysis
# Course Project 1: Plot1
# Farhan Choudhary
# www.linkedin.com/in/farhanchoudhary

## load the data
rm(list = ls())
setwd("C:/Users/farhan.choudhary/Desktop/R/Johns Hopkins University/Exploratory Data Week 1")
data <- read.table("C:/Users/farhan.choudhary/Desktop/R/Johns Hopkins University/Exploratory Data Week 1/household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)