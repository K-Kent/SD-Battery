library(readr)
library(tidyverse)

my_bat <- read_csv("Data/Battery.csv", col_names = FALSE, col_types = "inDcc")
names(my_bat) <- c("Battery", "Voltage", "Date", "Size", "Comment")

by_bat <- my_bat %>% group_by(Battery)


temp <- by_bat %>% summarise("Min_V" = sprintf(min(Voltage), fmt = '%#.2f'), 
                     "Max_V" = sprintf(max(Voltage), fmt = '%#.2f'),
                     "Cycles" = n())



by_date <- my_bat %>% group_by(Date)

by_date %>% summarise("Avg_V" = mean(Voltage), "SD" = sd(Voltage), "Count" = n())


