#### R: Exploratory Data Analysis - Multivariate Analysis ####
## Three broad classes of multivariate analysis:
# 1. The relationship between one categorical variable and one continuous variable
# 2. THe relationship between two categorical variables
# 3. The relationship between two continuous variables

### Goal is to discover relationships between variables ###

## Types of grpahs to use:
# Scatter Plot
# density plots 
# box plots


## compare education to income
by(bike_buyer$Income, bike_buyer$Education, summary)
by(bike_buyer$Income, bike_buyer$Education, mean)
by(bike_buyer$Income, bike_buyer$Education, median)

boxplot(bike_buyer$Income~bike_buyer$Education, notch=TRUE,
        col=c("grey", "gold", "grey", "grey"), main = "Income vs Education")


?sm
library(sm)
typeof(bike_buyer$Income)
bike_buyer$Income <- as.numeric(bike_buyer$Income)
sm.density.compare(bike_buyer$Income, bike_buyer$Education, xlab="Income")


education_legend <- factor(bike_buyer$Education, labels = c("Bachelors", "Graduate Degree",
                                                             "High School", "Partial College","Partial High   
                                                             School" ))
bike_buyer$Income
typeof(bike_buyer$Income)

names(bike_buyer)

colfill <- c(2:(2+length(levels(education_legend))))
legend(locator(1), levels(education_legend), fill = colfill)


#### categorical and categorical ####
## bought a bike vs education
xtabs(~Education+Purchased.Bike, bike_buyer)
plot(xtabs(~Education+Purchased.Bike, bike_buyer), main="Bike Buyers & Occupation")


library(gmodels)
## contingency table
CrossTable(bike_buyer$Education, bike_buyer$Purchased.Bike, chisq = TRUE, prop.t = F)
# chisquared = level of significance for categorical variables
CrossTable(bike_buyer$Occupation, bike_buyer$Purchased.Bike, chisq = TRUE, prop.t = F)


scatter.smooth(bike_buyer$Age, bike_buyer$Income)

library(datasets)
cars <- mtcars
smoothScatter(cars$mpg, cars$hp, xlab="MPG", ylab="HP #")
scatter.smooth(cars$mpg, cars$hp, xlab="MPG", ylab="HP #")









