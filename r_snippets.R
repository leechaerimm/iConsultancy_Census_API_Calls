install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)
library(tidyverse)

#Calling an API
res = GET("https://api.census.gov/data/1989/cps/basic/aug?get=A_LFSR,A_MARITL,A_FNLWGT&for=state:*&A_HGA=12&key=3ad651c17bc1089d172b32227e97b9439f014afb")

#calling the raw data to character
r = rawToChar(res$content)

#Convert JSON into list data structure
df <-fromJSON(r)

#Create a data frame
df <- data.frame(df)

#skipping a line
#we skipped a line the row was a header
df <- df[-1,]

#renaming the data frame columns
colnames(df) <- c("col 1","col 2","col 3","col 4 ", "col 5")

#Check the type of data
class(df$`col 1`)

#Change the type of data to factor
df$`col 1` <- as.factor(df$`col 1`)

#Change the type of data to numeric
df$`col 3` <- as.numeric(df$`col 3`)

#Check the type of data
class(df$`col 3`)

