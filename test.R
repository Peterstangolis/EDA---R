library(opendatatoronto)
library(dplyr)

# get packages
package <- show_package("6a87b8bf-f4df-4762-b5dc-bf393336687b")

head(package)
tail(package)
View(package)
class(package)
package$topics

nrow(package)

ncol(package)

length(package)
names(package)
str(package)
dplyr::glimpse(package)

# Plotting and Inspecting Data
plot(package)
identify(package)

# Summarising data
xtabs(package)

