##instructuions to load in the data and make the subset
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
