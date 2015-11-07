##FIRST PLOT GENERATOR
my_plot1<-function(){
  hist(elec_power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  axis(1,at=c(0,2,4,6))
  dev.copy(png,file="./figure/plot1.png",width=480,height=480)
  dev.off()
}
my_plot1()

