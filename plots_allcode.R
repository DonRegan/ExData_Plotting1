elec_power_full<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##once read in the datatable columns need their columns
##to be specified [they might be coerced anyway though]
lapply(elec_power_full,class)
elec_power_full$Date<-as.Date(elec_power_full$Date,"%d/%m/%Y")
elec_power<-elec_power_full[elec_power_full$Date=="2007-02-01"|elec_power_full$Date=="2007-02-02",]
##now have our subsetted data. Make sure the columns are numeric and we've a datetime column

elec_power$Global_active_power<-as.numeric(as.character(elec_power$Global_active_power))
elec_power$Global_reactive_power<-as.numeric(as.character(elec_power$Global_reactive_power))
elec_power$Voltage<-as.numeric(as.character(elec_power$Voltage))

elec_power$Global_intensity<-as.numeric(as.character(elec_power$Global_intensity))
elec_power$Sub_metering_1<-as.numeric(as.character(elec_power$Sub_metering_1))
elec_power$Sub_metering_2<-as.numeric(as.character(elec_power$Sub_metering_2))
elec_power$Sub_metering_3<-as.numeric(as.character(elec_power$Sub_metering_3))
elec_power$DateTime<-as.POSIXct(paste(elec_power$Date,elec_power$Time))


##FIRST PLOT GENERATOR
my_plot1<-function(){
  hist(elec_power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  axis(1,at=c(0,2,4,6))
  dev.copy(png,file="./figure/plot1.png",width=480,height=480)
  dev.off()
}
my_plot1()


##SECOND PLOT GENERATOR
my_plot2<-function(){
  plot(elec_power$DateTime,elec_power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="./figure/plot2.png",width=480,height=480)
  dev.off()
}
my_plot2()


##THIRD PLOT GENERATOR
my_plot3<-function(){
  plot(elec_power$DateTime,elec_power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(elec_power$DateTime,elec_power$Sub_metering_2,col="red")
  lines(elec_power$DateTime,elec_power$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)
  dev.copy(png,file="./figure/plot3.png",width=480,height=480)
  dev.off()
}
my_plot3()


##FOURTH PLOT GENERATOR
my_plot4<-function(){
  par(mfrow=c(2,2))##for 2x2 array of plots
  plot(elec_power$DateTime,elec_power$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.axis=0.7)

  plot(elec_power$DateTime,elec_power$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.axis=0.7)
  
  plot(elec_power$DateTime,elec_power$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.axis=0.7)
  lines(elec_power$DateTime,elec_power$Sub_metering_2,col="red")
  lines(elec_power$DateTime,elec_power$Sub_metering_3,col="blue")
  ##cex for legend text size, bty="n" for no boundary
  legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)
  
  plot(elec_power$DateTime,elec_power$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.axis=0.7)
  dev.copy(png,file="./figure/plot4.png",width=480,height=480)
  dev.off()
}
my_plot4()
