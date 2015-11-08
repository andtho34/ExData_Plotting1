plot2 <-function(){
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
        
        ##Generate Plot 2
        plot(powerdata$datetime, powerdata[,3], type = "l",
             xlab = NA,
             ylab = "Global Active Power (kilowatts")
        dev.copy(png, file = "plot2.png")
        dev.off()
}