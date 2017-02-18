library(plyr)
library(dplyr)

# Question 1

## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
##              "C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/idaho.csv", 
##              method = "curl")

idaho <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/idaho.csv")

households <- ddply(idaho, "RT", mutate, 
                    agricultureLogical = ifelse(ACR == 3 & AGS == 6, 
                                                yes = TRUE, no = FALSE)) 

which(households$agricultureLogical)


#Question 2

library(jpeg)

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", 
# "C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/instructor.jpeg", 
# method = "curl")

img <- readJPEG("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/instructor.jpeg",
                native = TRUE)

quantile(img, c(0.3, 0.8))

# Question 3

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
#               "C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/gdp.csv", 
#               method = "curl")

gdp_data <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/gdp.csv",
                     skip = 4, nrows = 190)

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", 
#               "C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/education.csv", 
#               method = "curl")

edu_data <- read.csv("C:/Users/Bamini/Documents/Coursera/Cleaning_up_data/education.csv")

names(gdp_data)[1] <- "CountryCode"

library(tidyr)
newgdp <- mutate(gdp_data, X.4 = extract_numeric(X.4))
mergeddf <- merge(newgdp, edu_data)
sortedgdp <- arrange(mergeddf, X.4)
sortedgdp$X.3[13]
sum(gdp_data$CountryCode %in% edu_data$CountryCode)


# Question 4


mergeddf <- mutate(mergeddf, Gross.domestic.product.2012 = 
                       extract_numeric(Gross.domestic.product.2012))

ddply(mergeddf, .(Income.Group), summarize, 
      average = mean(Gross.domestic.product.2012, na.rm = TRUE))

# Question 5

library(Hmisc)
mergedgdp <- mutate(mergeddf, cutgdp = cut2(mergeddf$Gross.domestic.product.2012,
                                            g = 5))
table(mergedgdp$Income.Group, mergedgdp$cutgdp)