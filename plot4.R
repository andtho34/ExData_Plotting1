plot4 <-function(){
        ##read in data from working directory
        powerdata<-read.table("~/Programming/R/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';')
        
        ##Convert dates to date class and subset data to only include readings on
        ##"2007-02-01" and "2007-02-02"
        powerdata[,1]<-as.character(powerdata[,1])
        powerdata[,1]<-as.Date(powerdata[,1], format = "%d/%m/%Y")
        reduced<-powerdata[which("2007-02-01" <= powerdata[,1] & powerdata[,1] <= "2007-02-02"),]
        powerdata<-reduced
        powerdata$datetime <-paste(powerdata[,1], powerdata[,2])
        powerdata$datetime <- strptime(powerdata$datetime,
                                       format="%Y-%m-%d %H:%M:%S")
        
        #Convert other values to numeric
        for (i in 3:9){
                powerdata[,i]<-as.numeric(as.character(powerdata[,i]))
        }
        
        ##Generate Plot 4
        par(mfcol = c(2,2))
        
        ##Upper Left Plot
        plot(powerdata$datetime, powerdata[,3], type = "l",
             xlab = NA,
             ylab = "Global Active Power")
        
        ##Lower left plot
        plot(powerdata$datetime, powerdata[,7], type = "l",
             xlab = NA,
             ylab = "Energy sub metering")
        lines(powerdata$datetime, powerdata[,8], col = "red")
        lines(powerdata$datetime, powerdata[,9], col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ##Upper right plot
        plot(powerdata$datetime, powerdata[,5], type = "l",
             xlab = "datetime",
             ylab = "Voltage")
        
        ##Lower right plot
        plot(powerdata$datetime, powerdata[,4], type = "l",
             xlab = "datetime",
             ylab = "Global_reactive_power")
        
        #Copy and save to png
        dev.copy(png, file = "plot4.png")
        dev.off()

}