#### R: Exploratory Data Analysis (EDA), Univariate Analysis ####
### Link: https://www.youtube.com/watch?v=ONrGJF_8onw

# 1. Understanding Variables
# 2. Find patterns in your data set
# 3. Suggest modeling strategies


# Load the data set
bike_buyer <- read.csv("data_analyst_role/EDA/EDA---R/bike_buyers.csv")

### Retrieve High Level Overview of the Data set ###
str(bike_buyer)
summary(bike_buyer)
class(bike_buyer)
names(bike_buyer)

View(bike_buyer)
head(bike_buyer, 5)

### Make note of what you have discovered in your initial investigation
#### Make notes in a separate text / excel file ####

library("dplyr")
bike_buyer = select(bike_buyer, -ï..ID)  # drop ID column
summary(bike_buyer)

#### NOTES: ######
### Examine Univariate Data ####
## univariate data = samples of one variable
## univariate data analysis isnt concerned with 'why', it is to describe data as is
## discrete variables vs continuous variables
## discrete = i.e. level of education.  Limited set of values
## continuous = i.e. income. can be any number


### Two Things to Consider in EDA: central tendency, spread
## central tendency = what is a common value?  what value is the data centered
## spread = how varied are the data points?

## types of graphs to use ##
# box plot
# histogram
# density plot
# pie plot

############################ EDA ##############################################

## INCOME: discrete or continuous?    *continuous*

### central tendency ###
summary(bike_buyer$Income)
boxplot(bike_buyer$Income)

## spread
hist(bike_buyer$Income)
plot(density(bike_buyer$Income), main = "Income Density Spread"))


## EDUCATION: categorical, discrete
summary(bike_buyer$Education)
plot(bike_buyer$Education)


## MARITAL STATUS: categorical, discrete
summary(bike_buyer$Marital.Status)
plot(bike_buyer$Marital.Status)
plot(bike_buyer$Marital.Status, main="Married vs Single Buyers")


pie(table(bike_buyer$Marital.Status), main="Married vs Single Buyers")


## CHILDREN: 
summary(bike_buyer$Children)
plot(bike_buyer$Children)
typeof(bike_buyer$Children)

## Change to factor ##
bike_buyer$Children = factor(bike_buyer$Children)
summary(bike_buyer$Children)
plot(bike_buyer$Children, xlab = "Num. of Children", ylab = "Frequency")

## People who bought a bike ##
library("dplyr")
bough = filter(bike_buyer, Purchased.Bike == "Yes")
plot(bough$Children)

bike_buyer$Commute.Distance <- factor(bike_buyer$Commute.Distance)
plot(bike_buyer$Commute.Distance)

bike_buyer$Purchased.Bike <- factor(bike_buyer$Purchased.Bike)
plot(bike_buyer$Purchased.Bike)

