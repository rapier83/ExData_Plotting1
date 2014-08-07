dt_raw <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
dt_1 <- subset(dt_raw,dt_raw[,1] == "1/2/2007")
dt_2 <- subset(dt_raw,dt_raw[,1] == "2/2/2007")
dt <- rbind(dt_1,dt_2)

# dt[,2] <- paste(dt[,1],dt[,2],sep=" ")

dt$TimeStamp <- strptime(dt[,2],format="%d/%m/%Y %H:%M:%S")

dt[,3] <- as.numeric(as.character(dt[,3]))
hist(dt[,3],
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)",
          ylab = "Frequency",
          col = "red"
          )
dev.copy(png,file='./plot1.png',width=480,height=480)

