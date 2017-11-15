#The following screenshot plots the child mortality rate in selected countries Use chlmort.csv file to show the relationship between the child mortality rate and Gross Domestic Product (GDP) of a country.  Hint : Use plot function


library(readr)
chlmort <- read_csv("graph_exercises/chlmort.csv")
View(chlmort)

plot( chlmort$gdp_bil,chlmort$child, main="Child Mortality Rate in Selected countries for 2012", 
     xlab="GDP in billions in current US$ ", ylab="Child Mortality rate",col="blue",pch = 19)+
  abline(h = mean(chlmort$child), col="red") +
  text(max(chlmort$gdp_bil)/2,mean(chlmort$child)+10, "Average Child Mortality", srt=0.2,cex=.7, col = "red")+
  text(chlmort$gdp_bil[chlmort$child == max(chlmort$child)],chlmort$child[chlmort$child == max(chlmort$child)], chlmort$CountryName[chlmort$child == max(chlmort$child)],
       pos = 4,cex=.7, col = "red") +
  text(chlmort$gdp_bil[chlmort$gdp_bil == max(chlmort$gdp_bil)],chlmort$child[chlmort$gdp_bil == max(chlmort$gdp_bil)], chlmort$CountryName[chlmort$gdp_bil == max(chlmort$gdp_bil)],
       pos = 3,cex=.7, col = "red")