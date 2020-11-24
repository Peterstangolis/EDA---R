# Exploring data in R
# https://www.youtube.com/watch?v=mgslMeYwNmM

library(dplyr)
my.data <- airquality

head(my.data)   # view first 6 rows of data set
tail(my.data)   # view last rows of the data set
class(my.data)  # why type of class the object is
length(my.data) # column number
ncol(my.data)   # also gives num of columns
names(my.data)  # names of the columns
length(my.data[ ,1])  # rows of the data
nrow(my.data)         # row number option 2
View(my.data)         # see all the data at once
str(my.data)          # structure, summarize the data
glimpse(my.data)  # from dplyr 

# factor Month column - loaded in as int
my.data$Month <- factor(my.data$Month)
# reassign the levels of the month variable, change numbers to words
levels(my.data$Month) <- list(May="5", June="6", July="7", Aug="8", Sept="9")
levels(my.data$Month)

plot(my.data$Ozone, my.data$Temp)
idx <- identify(my.data$Ozone, my.data$Temp)

plot(my.data$Ozone, my.data$Temp)
idx <- identify(my.data$Ozone, my.data$Temp, labels = my.data$Month, plot = TRUE)

#xtabs(my.data)  # summarizing data

plot(my.data$Ozone, my.data$Temp)
idx <- identify(my.data$Ozone, my.data$Temp, labels = paste(as.character(my.data$Day), "_" , as.character(my.data$Month)), plot = TRUE)

# Easy function to investigate number of observations fora  varialbe (month)
xtabs(~Month, data=my.data)  # summarizing data


