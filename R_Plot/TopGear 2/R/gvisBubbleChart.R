#Use crimeUSA.csv, googlevis package and gvisBubbleChart function 
#And show crime per state bubble chart as shown below.
#Bubble Size is population


library(readr)
crimeusa <- read_csv("graph_exercises/crimeusa.csv")
View(crimeusa)

crimeusa$Burglary <- crimeusa$Burglary*20

plot(gvisBubbleChart(crimeusa,idvar = "States",xvar= "Robbery", yvar=
                  "Burglary", sizevar ="Population", colorvar = "Year",
                options = list(legend = "none",width = 900, height = 600,title
                               =" Crime per State in 2012", sizeAxis ="{maxSize : 40, minSize
                               :0.5}",vAxis = "{title : 'Burglary'}",hAxis= "{title :
                               'Robbery'}")))