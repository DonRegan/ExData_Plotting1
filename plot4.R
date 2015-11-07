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
