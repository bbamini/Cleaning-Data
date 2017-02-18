# Question 1

community <- read.csv("CommunitySurvey.csv")

n <- 0

for (i in 1:length(community$VAL)) {
    if (is.na(community$VAL[[i]])) {
        next()
    } else if (community$VAL[[i]] == 24) {
        n <- n + 1
    } 
    
}

n

# Question 3

library(xlsx)

dat <- read.xlsx("NaturalGas.xlsx", sheetName = "NGAP Sample Data", 
                        rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)

# Question 4

library(XML)

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)

zipcodes <- xpathSApply(rootnode,"//zipcode", xmlValue)

counter <- 0
for (i in 1:length(zipcodes)) {
    if (zipcodes[[i]] == "21231") {
        counter <- counter + 1
    }
}

counter

# Question 5

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
# "IdahoHousing.csv")

library(data.table)

DT <- fread("IdahoHousing.csv")

system.time({tapply(DT$pwgtp15,DT$SEX,mean)})

system.time({sapply(split(DT$pwgtp15,DT$SEX),mean)})

system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})

system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})

system.time({DT[,mean(pwgtp15),by=SEX]})

system.time({mean(DT$pwgtp15,by=DT$SEX)})

