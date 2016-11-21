library(Quandl)
library(quantmod)
library(xts)
library(zoo)

unemployment <- Quandl("FRED/SEAT653URN", api_key="MGe_MUEiBmwwMo7eSsVB", 
       start_date="2006-01-01", end_date="2015-12-31")

write.table(unemployment, "~/Github/Learning/data/unemployment.csv", sep = ",")

unemploymentx <- xts(unemployment$VALUE, order.by = unemployment$DATE)
unemployment_year <- apply.yearly(unemploymentx, mean)

barChart(unemployment_year)
