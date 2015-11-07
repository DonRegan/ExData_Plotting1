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
