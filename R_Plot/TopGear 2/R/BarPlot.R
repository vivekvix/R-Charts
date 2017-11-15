#Use infant.csv, create Bar graph that displays infant mortality rate of India in 2011. Use Barplot fn

library(readr)
data <- read_csv("graph_exercises/infant.csv")
View(data)

data = data[order(data$Total2011, decreasing = TRUE),]

par(mar = c(10,5,5,5))
barplot(data$Total2011, las = 2, names.arg= data$India,width =
          0.80, border = NA,ylim=c(0,20), col = "#e34a33", main = "Infant
          Mortality Rate of India in 2011") +
          abline(h = 12.2, lwd =2, col = "white", lty =2)