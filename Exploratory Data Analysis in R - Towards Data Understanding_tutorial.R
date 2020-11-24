# Exploratory Data Analysis in R: Towards Data Understanding
## Link to Tutorial: https://www.youtube.com/watch?v=JW5Ug6NQexg

#****************************************************************************#

# rstudio.cloud/project  = another option vs rstudio

# Importing libraries
library(datasets)
library(caret)  # package for machine learning algorithms
# CARET = Classification and Regresion Training

# Importing the Iris data set
data(iris)

iris <- dataset::iris

# Method 2

library(RCurl)
iris <- read.csv(test = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"))

# View the data
View(iris)

### Explore the Iris data set ###

# head() / tail()
head(iris, 4)
tail(iris, 4)

# summary()
summary(iris)
summary(iris$Sepal.Length)

# Missing value analysis
sum(is.na(iris))

# skimr() - expands on summary() by providing larger set of statistics
library(skimr)

skim(iris)  # Perform a skim to display summary statistics

# Group data by Species then perform skim
iris %>%
  dplyr::group_by(Species) %>%
  skim()

#########################################
##### QUICK DATA VISUALIZATION #########

# Panel Plots
plot(iris)
plot(iris, col = "red")

# scatter plot
plot(iris$Sepal.Width, iris$Sepal.Length)




###############################################################################################
# To be able to reproduce the code, set the random see number
set.seed(100)

Model <- train(Species ~ ., data ~ iris,
               method = 'svmPoly',
               na.action = na.omit,
               preProcess = c("scale", "center"),
               trControl = trainControl(method = "none"),
               tuneGrid = data.frame(degree = 1, scale = 1, C = 1) # Hyperparameter tuning
               )

Model <- train(Species ~ ., data = iris,
               method = "rf", 
               na.action = na.omit,
               preProcess = c("scale", "center"),
               truControl = trainControl(method = "none")
              )



