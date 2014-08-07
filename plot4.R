dt_raw <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
dt_1 <- subset(dt_raw,dt_raw[,1] == "1/2/2007")
dt_2 <- subset(dt_raw,dt_raw[,1] == "2/2/2007")
dt <- rbind(dt_1,dt_2)

dt[,2] <- paste(dt[,1],dt[,2],sep=" ")

dt$TimeStamp <- strptime(dt[,2],format="%d/%m/%Y %H:%M:%S",tz="GMT")

for (i in c(3:9)) {
    dt[,i] <- as.numeric(as.character(dt[,i]))
    dt <- dt[!is.na(dt[,i]),]
}


par(mfrow=c(2,2),oma=c(0,0,2,0))
with(dt,{
    plot(dt[,10],dt[,3],type="l",ylab="Global Active Power")
    plot(dt[,10],dt[,5],type="l",xlab="datetime",ylab=names(dt)[5])
    plot(dt[,10],dt[,7],ylab="Energy sub metering",col="black",type="l")
    lines(dt[,10],dt[,8],col="red")
    lines(dt[,10],dt[,9],col="blue")
    legend("topright",lty=c(1,1,1),
           col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(dt[,10],dt[,4],type="l",xlab="datetime",ylab=names(dt)[4])
})

dev.copy(png,file='./plot4.png',width=480,height=480)