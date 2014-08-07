dt_raw <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
dt_1 <- subset(dt_raw,dt_raw[,1] == "1/2/2007")
dt_2 <- subset(dt_raw,dt_raw[,1] == "2/2/2007")
dt <- rbind(dt_1,dt_2)

dt[,2] <- paste(dt[,1],dt[,2],sep=" ")

dt$TimeStamp <- strptime(dt[,2],format="%d/%m/%Y %H:%M:%S",tz="GMT")

dt[,7] <- as.numeric(as.character(dt[,7]))
dt[,8] <- as.numeric(as.character(dt[,8]))
dt[,9] <- as.numeric(as.character(dt[,9]))

dt <- dt[!is.na(dt[,7]),]
dt <- dt[!is.na(dt[,8]),]
dt <- dt[!is.na(dt[,9]),]

par(mar=c(4,4,4,4))
plot(dt[,10],dt[,7],xlab="",ylab="Energy sub metering",col="black",type="l")
lines(dt[,10],dt[,8],col="red")
lines(dt[,10],dt[,9],col="blue")
legend("topright",lty=c(1,1,1),
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file='./plot3.png',width=480,height=480)
