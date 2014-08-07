dt_raw <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
dt_1 <- subset(dt_raw,dt_raw[,1] == "1/2/2007")
dt_2 <- subset(dt_raw,dt_raw[,1] == "2/2/2007")
dt <- rbind(dt_1,dt_2)

dt[,2] <- paste(dt[,1],dt[,2],sep=" ")

dt$TimeStamp <- strptime(dt[,2],format="%d/%m/%Y %H:%M:%S",tz="GMT")

dt[,3] <- as.numeric(as.character(dt[,3]))

par(mar=c(4,4,4,4))
plot(dt$TimeStamp,dt[,3],
     type="l",
     xlab="",
     ylab = "Global Active Power (kilowatts)"
)
dev.copy(png,file='./plot2.png',width=480,height=480)

