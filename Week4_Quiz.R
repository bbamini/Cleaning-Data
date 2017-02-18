# Question 1

idaho <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/idaho.csv")
wgtpsplit <- strsplit(names(idaho), "wgtp")
wgtpsplit[123]


# Question 2

gdp_data <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/gdp.csv",
                     skip = 4, nrows = 190)
library(dplyr)
library(tidyr)

newgdp <- mutate(gdp_data, X.4 = extract_numeric(X.4))
mean(newgdp$X.4)

# Question 3
names(gdp_data)[4] <- "countryNames"
length(grep("^United", gdp_data$countryNames))


# Question 4

names(gdp_data)[1] <- "CountryCode"
edu_data <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/education.csv")
mergeddf <- merge(gdp_data, edu_data)
length(grep("Fiscal year end: June", mergeddf$Special.Notes))

# Question 5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)
sum(year(sampleTimes) == 2012)
sum(wday(sampleTimes) == 2 & year(sampleTimes) == 2012)


