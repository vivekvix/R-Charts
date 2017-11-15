#2. Use disable.csv file and generate Gantt Chart that  displays periods during which baseball players are disabled.

library(readr)
disable <- read_csv("graph_exercises/disable.csv")
View(disable)

data = data.frame(position = as.character(disable$position), player = as.character(disable$player), start = as.POSIXct(disable$start), end = as.POSIXct(disable$end))


library(googleVis)
plot(gvisTimeline(data=data,rowlabel="player",
                  start="start", end="end",
     options=list(width=800, height=500,colors="['Blue']"))
)

