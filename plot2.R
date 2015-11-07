##SECOND PLOT GENERATOR
my_plot2<-function(){
  plot(elec_power$DateTime,elec_power$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="./figure/plot2.png",width=480,height=480)
  dev.off()
}
my_plot2()